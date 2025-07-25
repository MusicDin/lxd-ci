# Testflinger scripts

This directory contains the scripts used for Nvidia testing via Github actions and Testflinger.
The tests run on devices within Canonical's test farm.

## Run locally
Running the tests locally is only possible if your machine has access to the Testflinger server.

Tested distros:
- `core24-latest`

Ensure `testflinger` is installed:
```
sudo snap install testflinger-cli
```

Set the input variables and execute the script from the same directory:
```bash
JOB_QUEUE=lxd-nvidia SNAP_CHANNEL=latest/edge DISTRO=core24-latest ./run.sh
```
The above replaces the inputs in the scripts and submits the Testflinger job.
To prepare the scripts only but not submit the job, set the `--dryrun` flag.
