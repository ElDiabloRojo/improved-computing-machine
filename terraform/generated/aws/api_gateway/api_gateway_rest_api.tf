resource "aws_api_gateway_rest_api" "tfer--icm-dev" {
  api_key_source               = "HEADER"
  disable_execute_api_endpoint = "false"

  endpoint_configuration {
    types = ["EDGE"]
  }

  minimum_compression_size = "1024"
  name                     = "icm-dev"

  tags = {
    STAGE   = "dev"
    project = "ICM"
  }

  tags_all = {
    STAGE   = "dev"
    project = "ICM"
  }
}
