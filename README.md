
# Usage

This is an installer to deploy https://github.com/redhat-appstudio/jvm-build-service It will install two namespaces (`jvm-build-workloads` and `jvm-build-service`), the Red Hat OpenShift Pipelines operator, the JBS operator and cache and the various secrets/configmaps.

To use this either set the environment variables as described below or replace their templated values within:

 * production/config.yaml
 * secrets/*.yaml


The following environment variables are configurable and may be set by the user prior to deploying this depending upon which features are to be enabled.

| <!-- -->    | <!-- -->    |
|---|---|
| AWS_ACCESS_KEY_ID | AWS Access Key used for S3 and CodeArtfact Access |
| AWS_PROFILE | AWS Region used for CodeArtifact deployment |
| AWS_SECRET_ACCESS_KEY | AWS Secret Access Key used for S3 and CodeArtfact Access |
| GIT_DEPLOY_IDENTITY | Username/organisation name for the Git service |
| GIT_DEPLOY_TOKEN | Authentication token |
| GIT_DEPLOY_URL | The URL for the Git service (GitHub/GitLab are supported) to archive the sources |
| MAVEN_PASSWORD | Password for the Maven repository|
| MAVEN_REPOSITORY | The URL for the external Maven repository to deploy to|
| MAVEN_USERNAME | Username for the Maven repository |
| QUAY_USERNAME | Quay.io registry to use |

The `$HOME/.docker/config.json` must contain a suitable authentication token to Quay.io. So this secret may be configured it is recommend to set it as:

```
export JBS_BUILD_IMAGE_SECRET=$(cat $HOME/.docker/config.json | base64 -w 0)
```

To support private repositories set:
```
export JBS_GIT_CREDENTIALS='https://$GITHUB_E2E_ORGANIZATION:$GITHUB_TOKEN@github.com'
```

By default, the JBS images are pulled from the redhat-appstudio organization. This may be overridden by setting `JBS_QUAY_IMAGE`.

The 'worker' namespace (`jvm-build-workloads`) may be customized by setting `JBS_WORKER_NAMESPACE`. Note that the namespace configuration is also referenced in namespace/namespace.yaml and pipelines/quota.yaml as well as the files referenced above.

Once everything has been configured run `./deploy.sh`. This will use kustomize, envsubst and kubectl to deploy to the current instance. This has been tested with kubectl v1.28.4 and kustomize v5.2.1.
