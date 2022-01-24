#!/usr/bin/env bash

# https://docs.aws.amazon.com/codeartifact/latest/ug/getting-started-cli.html

aws codeartifact create-domain --domain "${MY_DOMAIN}"

aws codeartifact create-repository --domain "${MY_DOMAIN}" --domain-owner "${DOMAIN_OWNER}" --repository "${MY_REPO}"

aws codeartifact create-repository --domain "${MY_DOMAIN}" --domain-owner "${DOMAIN_OWNER}" --repository pip-store

# https://docs.aws.amazon.com/codeartifact/latest/ug/external-connection.html
aws codeartifact associate-external-connection --domain "${MY_DOMAIN}" --domain-owner "${DOMAIN_OWNER}" --repository pip-store --external-connection "public:pypi"

aws codeartifact update-repository --repository "${MY_REPO}" --domain "${MY_DOMAIN}" --domain-owner "${DOMAIN_OWNER}" --upstreams repositoryName=pip-store
