resource "aws_lambda_function" "tfer--icm-dev-hello" {
  architectures = ["x86_64"]

  environment {
    variables = {
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }

  function_name                  = "icm-dev-hello"
  handler                        = "src/functions/hello/handler.main"
  memory_size                    = "1024"
  package_type                   = "Zip"
  reserved_concurrent_executions = "-1"
  role                           = "arn:aws:iam::670484296822:role/icm-dev-us-east-1-lambdaRole"
  runtime                        = "nodejs12.x"
  source_code_hash               = "uxvukfnnMQ+lzSusIDHQyTKS2t2VN8FtNUCZ5sEnUfA="

  tags = {
    STAGE   = "dev"
    project = "ICM"
  }

  tags_all = {
    STAGE   = "dev"
    project = "ICM"
  }

  timeout = "6"

  tracing_config {
    mode = "PassThrough"
  }
}
