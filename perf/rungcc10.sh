NOOP_HOME=~/Workspace/XiangShan
spec_dir=spec-perf-4bank

cpt_path=/nfs-nvme/home/share/checkpoints_profiles/spec06_rv64gcb_o2_20m/take_cpt
json_path=/nfs-nvme/home/share/checkpoints_profiles/spec06_rv64gcb_o2_20m/json/simpoint_coverage0.3_test.json

python3 xs_autorun_multiServer.py $cpt_path $json_path  --xs $NOOP_HOME --threads 16 --dir $spec_dir -L "open11 open17 open18 open23 open25 open26"