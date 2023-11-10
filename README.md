
# Usage

This is an installer to deploy https://github.com/redhat-appstudio/jvm-build-service

The `$HOME/.docker/config.json` must contain a suitable authentication token to Quay.io.

The following environment variables are configurable and may be configured by the user prior to deploying this depending upon which features are to be enabled.

| <!-- -->    | <!-- -->    |
|---|---|
| QUAY_USERNAME | Quay.io registry to use |
| MAVEN_REPOSITORY | The URL for the external Maven repository to deploy to|
| MAVEN_USERNAME | Username for the Maven repository |
| MAVEN_PASSWORD | Password for the Maven repository|
| GIT_DEPLOY_URL | The URL for the Git service (GitHub/GitLab are supported) to archive the sources |
| GIT_DEPLOY_IDENTITY | Username/organisation name for the Git service |
| GIT_DEPLOY_TOKEN | Authentication token |
| AWS_ACCESS_KEY_ID | |
| AWS_SECRET_ACCESS_KEY | |
| AWS_PROFILE | |

Once everything has been configured sufficiently run `./deploy.sh`. This will create the namespaces, secrets and then use kustomize and kubectl to deploy to the current instance. This has been tested with kubectl v1.2.6 and kustomize v5.2.1.
