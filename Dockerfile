FROM hashicorp/terraform:latest

ENV PROVIDER all
ENV AWS_PROFILE DOM

RUN apk update && \
    apk add curl zip

RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64
    
RUN chmod +x terraformer-${PROVIDER}-linux-amd64 && \
    mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer

ADD https://releases.hashicorp.com/terraform-provider-aws/4.4.0/terraform-provider-aws_4.4.0_linux_amd64.zip /root/.terraform.d/plugins/linux_amd64/terraform-provider-aws_4.4.0_linux_amd64.zip

RUN unzip /root/.terraform.d/plugins/linux_amd64/terraform-provider-aws_4.4.0_linux_amd64.zip && \
    rm -rf /root/.terraform.d/plugins/linux_amd64/terraform-provider-aws_4.4.0_linux_amd64.zip

ENTRYPOINT [ "terraformer" ]