resource "aws_api_gateway_stage" "tfer--dnzo4ft42c-002F-dev" {
  cache_cluster_enabled = "false"
  deployment_id         = "h5c75w"
  rest_api_id           = "dnzo4ft42c"
  stage_name            = "dev"

  tags = {
    project = "ICM"
  }

  tags_all = {
    project = "ICM"
  }

  xray_tracing_enabled = "false"
}
