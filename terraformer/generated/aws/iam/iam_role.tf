resource "aws_iam_role" "tfer--icm-dev-us-east-1-lambdaRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "icm-dev-lambda"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogStream\",\"logs:CreateLogGroup\"],\"Resource\":[\"arn:aws:logs:us-east-1:670484296822:log-group:/aws/lambda/icm-dev*:*\"],\"Effect\":\"Allow\"},{\"Action\":[\"logs:PutLogEvents\"],\"Resource\":[\"arn:aws:logs:us-east-1:670484296822:log-group:/aws/lambda/icm-dev*:*:*\"],\"Effect\":\"Allow\"}]}"
  }

  max_session_duration = "3600"
  name                 = "icm-dev-us-east-1-lambdaRole"
  path                 = "/"

  tags = {
    STAGE   = "dev"
    project = "ICM"
  }

  tags_all = {
    STAGE   = "dev"
    project = "ICM"
  }
}
