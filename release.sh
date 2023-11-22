#!/bin/sh

if [ -z "$1" ]; then
    echo "Pass in new SHA to update yaml files"
    exit 1
fi
if [ -z "$2" ]; then
    echo "Pass in new Quay image tag to update yaml files"
    exit 1
fi


for i in $(find . -name "*.yaml")
do
    sed -E -i "s/(jvm-build-service\/)[a-zA-Z0-9]+(\/deploy)/\1$1\2/" $i
    sed -E -i "s/(ref=)[a-zA-Z0-9]+/\1$1/" $i
done

sed -E -i "s/(hacbs-jvm-build-request-processor:).*/\1$2/" production/kustomization.yaml
sed -E -i "s/(newTag: ).*/\1$2/" production/kustomization.yaml
