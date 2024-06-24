NOOP_HOME=~/Workspace/XiangShan-dev4
spec_dir=spec-gcc12-0330

cpt_path1=/nfs-nvme/home/share/checkpoints_profiles/spec06_rv64gcb_o3_20m_gcc12-fpcontr-off/take_cpt
json_path1=/nfs-nvme/home/share/checkpoints_profiles/spec06_rv64gcb_o3_20m_gcc12-fpcontr-off/o3_spec_fp_int-with-jemXalanc.json

cpt_path2=/nfs/home/share/jiaxiaoyu/simpoint_checkpoint_archive/spec06_rv64gcb_O3_20m_gcc12.2.0-intFpcOff-jeMalloc/checkpoint-0-0-0
json_path2=/nfs/home/share/jiaxiaoyu/simpoint_checkpoint_archive/spec06_rv64gcb_O3_20m_gcc12.2.0-intFpcOff-jeMalloc/checkpoint-0-0-0/cluster-0-0.json

python3 xs_autorun_multiServer.py $cpt_path2 $json_path2 --xs $NOOP_HOME --threads 16 --dir $spec_dir  -L "open23" --report