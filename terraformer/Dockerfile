FROM hashicorp/terraform:latest

ARG PROVIDER=all 
ARG GOOGLE_PROVIDER_VERSION=4.13.0
ARG AWS_PROVIDER_VERSION=4.4.0

ENV AWS_PROFILE default

# Basic utils
RUN apk update && \
    apk add curl zip

# Download & install terraformer
RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64
# Make binary executable & send it home
RUN chmod +x terraformer-${PROVIDER}-linux-amd64 && \
    mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer

# Installing plugins
WORKDIR /root/.terraform.d/plugins/linux_amd64/
# Download provider plugins
ADD https://releases.hashicorp.com/terraform-provider-aws/${AWS_PROVIDER_VERSION}/terraform-provider-aws_${AWS_PROVIDER_VERSION}_linux_amd64.zip terraform-provider-aws_${AWS_PROVIDER_VERSION}_linux_amd64.zip
ADD https://releases.hashicorp.com/terraform-provider-google/${GOOGLE_PROVIDER_VERSION}/terraform-provider-google_${GOOGLE_PROVIDER_VERSION}_linux_amd64.zip terraform-provider-google_${GOOGLE_PROVIDER_VERSION}_linux_amd64.zip
# Remove zip files, terraformer will wobble if it finds non-plugin files
RUN find . -name '*.zip' -exec unzip -d . {} \; && \
    rm -rf *.zip

WORKDIR /src
ENTRYPOINT [ "terraformer" ]