#!/bin/bash

# 保存所有URL的数组
urls=(
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291717/SRR13291717.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291716/SRR13291716.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291704/SRR13291704.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291700/SRR13291700.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291699/SRR13291699.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291698/SRR13291698.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-24/SRR013/13291/SRR13291713/SRR13291713.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291697/SRR13291697.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-24/SRR013/13291/SRR13291696/SRR13291696.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291695/SRR13291695.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-24/SRR013/13291/SRR13291715/SRR13291715.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291714/SRR13291714.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291712/SRR13291712.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-24/SRR013/13291/SRR13291711/SRR13291711.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291710/SRR13291710.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291709/SRR13291709.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291708/SRR13291708.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291707/SRR13291707.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291706/SRR13291706.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291705/SRR13291705.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291703/SRR13291703.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-22/SRR013/13291/SRR13291702/SRR13291702.lite.1"
    "https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-zq-20/SRR013/13291/SRR13291701/SRR13291701.lite.1"
)

# 循环遍历数组并下载文件
for url in "${urls[@]}"
do
    wget --no-check-certificate "$url"
done

