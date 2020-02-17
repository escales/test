#!/bin/sh
PoolHost=na.luckpool.net
Port=3956
PublicVerusCoinAddress=RVESCd3jY5g4QzLwrZxTfwYP3Yoexy7LKU
WorkerName=ubun01
Threads=11
#set working directory to the location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./nheqminer -v -l "${PoolHost}":"${Port}" -u "${PublicVerusCoinAddress}"."${WorkerName}" -t "${Threads}" "$@"
