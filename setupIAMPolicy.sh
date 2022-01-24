#!/usr/bin/env bash

# https://docs.aws.amazon.com/codeartifact/latest/ug/get-set-up-provision-user.html
aws iam create-policy --policy-name AWSCodeArtifactAdminAccess --policy-document file://data/AWSCodeArtifactAdminAccess.json
