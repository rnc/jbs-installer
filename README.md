
# Usage

This is an installer to deploy https://github.com/redhat-appstudio/jvm-build-service It will install two namespaces (`jvm-build-workloads` and `jvm-build-service`), the Red Hat OpenShift Pipelines operator, the JBS operator and cache and the various secrets/configmaps.

See  https://github.com/redhat-appstudio/jvm-build-service for description of the environment variables.

The 'worker' namespace (`jvm-build-workloads`) may be customized by setting `JBS_WORKER_NAMESPACE`.

Once everything has been configured run `./deploy.sh`. This will use kustomize, envsubst and kubectl to deploy to the current instance. This has been tested with kubectl v1.28.4 and kustomize v5.2.1.
