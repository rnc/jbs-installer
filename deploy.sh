#!/bin/sh

if [ -z "$JBS_BUILD_IMAGE_SECRET" ]; then
    echo "Set JBS_BUILD_IMAGE_SECRET as per README"
    exit 1
fi
if [ -z "$JBS_QUAY_IMAGE" ]; then
    export JBS_QUAY_IMAGE=redhat-appstudio
fi
if [ -z "$JBS_WORKER_NAMESPACE" ]; then
    export JBS_WORKER_NAMESPACE=jvm-build-workloads
fi

echo -e "\033[0;32mSetting context to jvm-build-workloads with quay image $JBS_QUAY_IMAGE\033[0m"
kubectl config set-context --current --namespace=$JBS_WORKER_NAMESPACE

echo -e "\033[0;32mRunning JBS installer kustomize...\033[0m"
kustomize build . | envsubst '${AWS_ACCESS_KEY_ID},${AWS_PROFILE},${AWS_SECRET_ACCESS_KEY},${JBS_QUAY_IMAGE},${GIT_DEPLOY_IDENTITY},${GIT_DEPLOY_TOKEN},${GIT_DEPLOY_URL},${GIT_DISABLE_SSL_VERIFICATION},${JBS_BUILD_IMAGE_SECRET},${JBS_GIT_CREDENTIALS},${JBS_WORKER_NAMESPACE},${MAVEN_PASSWORD},${MAVEN_USERNAME},${MAVEN_REPOSITORY},${QUAY_USERNAME}' | kubectl apply -f -
