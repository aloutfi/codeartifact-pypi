# Provisioning, installing, and utilizing a private AWS Code Artifact pypi repository.

## Rationalle:

I decided to put this together after some discussion amongst my colleagues about breaking out and decoupling our monolithic python codebase into distributed microservices.

Being able to package functionality in a manner consistent with pythonic importation paridigms is a necessary abstraction to being able to build and maintain a distributed architecture (that is written in python). However, the team writes code in a closed source environment, so we are not able to utilize the official python package index. 

Per the Zen of Python:

> There should be one-- and preferably only one --obvious way to do it.

Our team has a dedicated Cloud Engineer with a high degree of specialization in AWS. Therefore, the AWS CodeArtifact service configured to utilize the python package index as a fallback becomes an attractive solution.

## Resources:

- [CodeArtifiact Identity and Access Management](https://docs.aws.amazon.com/codeartifact/latest/ug/auth-and-access-control-iam-identity-based-access-control.html)

- [Concepts](https://docs.aws.amazon.com/codeartifact/latest/ug/codeartifact-concepts.html#welcome-concepts-package): 
  - [Domain](https://docs.aws.amazon.com/codeartifact/latest/ug/domains.html), [Repository](https://docs.aws.amazon.com/codeartifact/latest/ug/repos.html), [Upstream repository](https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html), [Package](https://docs.aws.amazon.com/codeartifact/latest/ug/packages.html)

- [Official AWS CodeArtifact Tutorial](https://docs.aws.amazon.com/codeartifact/latest/ug/getting-started-cli.html)

- [Authenticatation for pip and twine](https://docs.aws.amazon.com/codeartifact/latest/ug/python-configure.html)
- [Publishing a python package with twine](https://docs.aws.amazon.com/codeartifact/latest/ug/python-run-twine.html)

## Pre-configuration

Set the following environment variables

```bash
export MY_DOMAIN=<your intended codeartifact domain name>
export DOMAIN_OWNER=<aws account id>
export MY_REPO=<your intended codeartifact repository name>
```

# Usage of this repository

1. Configure `AWSCodeArtifactAdminAccess` IAM policy
   - `./setupIAMPolicy.sh`
   - use the AWS console to apply the policy to users/groups

2. Set up the code artifact domain and repository
   - `./setupCodeArtifact.sh`

3. Authenticate `pip` and `twine` on your machine to use the Code Artifact index for the next 12 hours
   - `./setupAccess.sh`