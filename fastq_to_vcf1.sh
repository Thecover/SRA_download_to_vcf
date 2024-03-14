#!/bin/bash

module load java/jdk1.8.0_11
module load Trimmomatic/0.35
module load bwa/0.7.15
module load picard/2.9.0
module load GATK/4.2.0.0
module load samtools/1.3.1

# 获取输入参数：FASTQ文件和参考基因组文件
fastq_file="$1"  # FASTQ.gz文件路径
reference_genome="$2"  # 参考基因组文件路径

# 解压缩FASTQ.gz文件
gunzip "$fastq_file"

# 获取解压缩后的FASTQ文件名
fastq_filename="${fastq_file%.gz}"

# 定义输出文件名
output_vcf="filtered_variants.vcf"

# 定义 Picard 的路径
PICARD_HOME="/WORK/app/picard/2.9.0"

# 生成参考基因组索引文件
bwa index "$reference_genome"

# 使用 Trimmomatic 过滤接头序列和低质量读序
java -jar trimmomatic-0.35.jar SE -threads 4 "$fastq_filename" \
    trimmed.fastq.gz \
    ILLUMINACLIP:TrueSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# 将解压缩后的FASTQ文件与参考基因组比对
bwa mem "$reference_genome" "$fastq_filename" | samtools sort -o sorted_reads.bam

# 使用 Picard 剔除PCR重复序列
java -jar "$PICARD_HOME/picard.jar" MarkDuplicates \
      INPUT=sorted_reads.bam \
      OUTPUT=dedup_reads.bam \
      METRICS_FILE=dedup_metrics.txt

# 对BAM文件建立索引
samtools index dedup_reads.bam

# 使用 GATK 进行 SNP calling
gatk --java-options "-Xmx4g" HaplotypeCaller \
    -R "$reference_genome" \
    -I dedup_reads.bam \
    -O raw_variants.vcf

# 过滤变异
gatk VariantFiltration -R "$reference_genome" -V raw_variants.vcf -O "$output_vcf" \
    --filter-expression "QD < 2.0 || MQ < 40.0 || FS > 60.0 || SOR > 3.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filter-name "SNP_FILTER"
