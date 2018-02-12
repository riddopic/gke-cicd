
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
 
ENV PROJECT=cardinal-cicd-infra \
    ZONE=us-west1-a \
    GKE_CLUSTER_NAME=gke-infra \
    GCS_SA_NAME=gcs-service-account \
    GCS_SA_DEST=/roor/.gcp/gcp.json \
    CLUSTER_VERSION=1.9.2-gke.1 \
    MACHINE_TYPE=n1-standard-2

ADD k8s /workdir/
ADD bin/spinnaker.sh /workdir/
