#!/bin/bash
########## env ##########
DIVLINE=$(perl -E "print '=' x 20")
function set_env(){
    # cd ../
    # . ./env.sh
    # cd XiangShan
    
    PERF_HOME=/nfs/home/liuziang/Workspace/checkpoints
    JSON_HOME=/nfs/home/liuziang/Workspace/master-thesis/json
    # cpt_path=/nfs/home/liuziang/Workspace/checkpoints/spec17_rv64gcb_o3_20m/take_cpt
    cpt_path=/nfs/home/share/checkpoints_profiles/spec17_speed_rv64gcb_o3_20m/take_cpt

    cover1_path=$JSON_HOME/simpoint_coverage_1.0.json
    cover3_path=$JSON_HOME/simpoint_coverage_0.3.json
    cover8_path=$JSON_HOME/simpoint_coverage_0.8.json
}
set_env

########## param: YOU SHOULD CONFIRM ##########
## small server
# server_list="open06 open07 open08 open09 open10 open12 open13 open14 open15" #open23 open24 open25 open26 open27"
## big server
server_list="node29 node34 node36 node38 node39" #node003 node004
cpt_path=$cpt_path
json_path=$cover1_path
threads=16
version="kunminghu"

if [[ $1 ]]; then
    spec_dir=$1
else
    spec_dir="SPEC17_EmuTasks_"$(date +%m%d_%H%M)
fi

########## run ##########
echo "********** cal start at $(date) **********"
# cd $PERF_HOME
python3 xs_autorun_multiServer.py $cpt_path $json_path --xs $NOOP_HOME --threads $threads --dir $spec_dir --resume -L "$server_list" --version 2017 --isa rv64gcb_o3_speed --report
echo "********** cal end at $(date) **********"
