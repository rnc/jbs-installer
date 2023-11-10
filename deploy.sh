#!/bin/sh

# Namespace creation is required for the secrets.
curl --silent https://raw.githubusercontent.com/redhat-appstudio/jvm-build-service/main/deploy/namespace.yaml?ref=98b313aa1db6764623deb3abdc02f1e380bf41df | kubectl apply -f -

#TODO Replace path call with something like
#https://raw.githubusercontent.com/redhat-appstudio/jvm-build-service/main/deploy/secet.sh
/home/rnc/Work/JBS/jvm-build-service/deploy/secrets.sh

echo -e "\033[0;32mRunning kustomize...\033[0m"
kustomize build --enable-helm . | envsubst '${QUAY_USERNAME},${MAVEN_USERNAME},${MAVEN_REPOSITORY},${GIT_DEPLOY_IDENTITY},${GIT_DEPLOY_URL}' | kubectl apply -f -
