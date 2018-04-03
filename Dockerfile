
FROM gcr.io/spinnaker-marketplace/halyard:stable

RUN apt-get update \
 && apt-get install -y apt-transport-https \
                       ca-certificates \
                       curl \
                       vim \
                       lsb-release \
                       software-properties-common \
 && export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
 && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
 && apt-get update \
 && apt-get install -y google-cloud-sdk \
 && rm -rf /var/lib/apt/lists/*
 