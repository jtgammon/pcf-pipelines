#!/bin/bash

set -ex
root=$(pwd)

ami=$(cat ami/ami)

terraform plan \
  pcf-pipelines/tasks/install-pcf-aws/terraform \
  -state terraform-state/terraform.tfstate \
  -var "opsman_ami=${ami}" \
  -var "db_master_username=${DB_MASTER_USERNAME}" \
  -var "db_master_password=${DB_MASTER_PASSWORD}" \
  -out terraform.tfplan

terraform apply \
  -state-out $root/terraform-state/terraform.tfstate \
  terraform.tfplan
