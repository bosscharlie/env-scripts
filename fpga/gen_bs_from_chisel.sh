#! /usr/bin/env zsh
# Usage: zsh/bash gen_xs_bitstream.sh whichbranch whichdir(abs path)
# from chisel. User should prepare all-ready chisel
set -v

fpga_dir=/nfs/home/zhangzifei/fpga/fpga-gen

xsDir=$1
bsTag=$2
bsDir=$fpga_dir/bitgen-$bsTag

echo "generating verilog..."
cd $xsDir
export NOOP_HOME=$(pwd)
export NEMU_HOME=$(pwd)
make verilog -j17
cd -

echo "generating bitstream..."
zsh gen_bitstreaitstreaitstreaitstreaitstreaitstreaitstreaitstreaitstream.sh $bsDir $xsDir/build

echo "keep watching bitstream log"
zsh watch_runme.sh $bsDir

echo "cp bitstream to $bsTag"
zsh cp_bitstream.sh $bsDir $bsTag

echo "send email"
python3 send_email_standalone.py "bitstream generated $bsTag" "bsDir: $bsDir"