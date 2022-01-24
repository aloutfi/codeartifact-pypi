#!/usr/bin/env bash

# https://docs.aws.amazon.com/codeartifact/latest/ug/python-configure.html

aws codeartifact login --tool pip --domain "${MY_DOMAIN}" --domain-owner "${DOMAIN_OWNER}" --repository "${MY_REPO}"
aws codeartifact login --tool twine --domain "${MY_DOMAIN}" --domain-owner "${DOMAIN_OWNER}" --repository "${MY_REPO}"