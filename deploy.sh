#!/bin/sh

kubectl config set-context --current --namespace=jvm-build-workloads

echo -e "\033[0;32mRunning kustomize...\033[0m"
kustomize build --enable-helm . | envsubst '${AWS_ACCESS_KEY_ID},${AWS_PROFILE},${AWS_SECRET_ACCESS_KEY},${GIT_DEPLOY_IDENTITY},${GIT_DEPLOY_TOKEN},${GIT_DEPLOY_URL},${JBS_BUILD_IMAGE_SECRET},${JBS_GIT_CREDENTIALS},${MAVEN_PASSWORD},${MAVEN_USERNAME},${MAVEN_REPOSITORY},${QUAY_USERNAME}' | kubectl apply -f -
