#!/bin/bash
########## env ##########
DIVLINE=$(perl -E "print '=' x 20")
function set_env(){
    PERF_HOME=/nfs/home/liuziang/Workspace/checkpoints

    gcc12O3_1=/nfs-nvme/home/share/checkpoints_profiles/spec06_rv64gcb_o3_20m_gcc12-fpcontr-off
    cpt_path_1=$gcc12O3_1/take_cpt
    cover1_path_1=$gcc12O3_1/json/o3_spec_fp_int-with-jemXalanc.json
    cover3_path_1=$PERF_HOME/json/gcc12o3-fpcontr-off-0.3.json
    cover8_path_1=$PERF_HOME/json/gcc12o3-fpcontr-off-0.8.json

    gcc12O3_2=/nfs/home/liuziang/Workspace/checkpoints/spec06_rv64gcb_O3_20m_gcc12.2.0-intFpcOff-jeMalloc
    cpt_path_2=$gcc12O3_2/checkpoint-0-0-0
    cover1_path_2=$gcc12O3_2/checkpoint-0-0-0/cluster-0-0.json
    cover3_path_2=$PERF_HOME/json/gcc12o3-incFpcOff-jeMalloc-0.3.json
    cover8_path_2=$PERF_HOME/json/gcc12o3-incFpcOff-jeMalloc-0.8.json
}
set_env

########## param: YOU SHOULD CONFIRM ##########
server_list="node29 node30 node34 node36 node38" #node003 node004
cpt_path=$cpt_path_2
json_path=$cover3_path_2
threads=16
version="kunminghu"

if [[ $1 ]]; then
    spec_dir=$1
else
    spec_dir="SPEC06_EmuTasks_"$(date +%m%d_%H%M)
fi

########## run ##########
echo "********** cal start at $(date) **********"
# cd $PERF_HOME
python3 xs_autorun_multiServer.py $cpt_path $json_path --xs $NOOP_HOME --threads $threads --dir $spec_dir --resume -L "$server_list" --version 2006 --report
echo "********** cal end at $(date) **********"
