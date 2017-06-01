#!/bin/bash

set -ex
root=$(pwd)

terraform plan \
  pcf-pipelines/tasks/install-pcf-aws/terraform \
  -state terraform-state/terraform.tfstate \
  -out terraform.tfplan

terraform apply \
  -state-out $root/terraform-state/terraform.tfstate \
  terraform.tfplan
