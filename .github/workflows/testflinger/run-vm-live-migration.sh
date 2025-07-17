#!/bin/bash -eu

temp_job=uc-nvidia-job.yml.tmp
JOB_QUEUE=${JOB_QUEUE:-lxd-nvidia}
DISTRO=${DISTRO:-ubuntu}
SNAP_CHANNEL=${SNAP_CHANNEL:-latest/edge}

echo "Inputs: $JOB_QUEUE $DISTRO $SNAP_CHANNEL"

# Replace env vars with inputs
envsubst '$JOB_QUEUE $DISTRO $SNAP_CHANNEL' < vm-live-migration-job.yml > $temp_job

if [[ "${1:-}" == "--dryrun" ]]; then
  echo "Dry-run complete"
  echo "Submit the job with:"
  echo "testflinger submit --poll $temp_job"
  exit 0
fi

# Submit the modified job
testflinger submit --poll $temp_job --wait-for-available-agents --debug
