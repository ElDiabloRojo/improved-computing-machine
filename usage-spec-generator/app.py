# Python program to read
# json file

import json
import yaml
import pprint

# Opening JSON file
state_source_file = open('../terraformer/generated/aws/terraform.tfstate')
# Opening YAML file
infracost_examples_file = "../docs/infracost-usage-example.yml"

# returns JSON object as
# a dictionary
terraform_state = json.load(state_source_file)
state_resources = terraform_state['modules'][0]['resources']

with open(infracost_examples_file, 'r') as stream:
    try:
        parsed_infracost_examples=yaml.safe_load(stream)
        print(parsed_infracost_examples)
    except yaml.YAMLError as exc:
        print(exc)

resources = {}


# Adding list as value
# resources["aws_api_gateway_rest_api"] = ["tfer--icm-dev", "tfer--icm-uat"]
# resources["aws_api_gateway_stage"] = ["tfer--89atczl3s4-002F-dev"] 

# 'aws_api_gateway_rest_api.tfer--icm-dev'
# 'aws_api_gateway_stage.tfer--89atczl3s4-002F-dev'
# 'aws_cloudformation_stack.tfer--icm-dev'
# 'aws_cloudwatch_log_group.tfer---002F-aws-002F-lambda-002F-icm-dev-hello'
# 'aws_iam_role.tfer--icm-dev-us-east-1-lambdaRole'
# 'aws_lambda_function.tfer--icm-dev-hello'

# Iterating through the json
# list

# pprint.pprint(state_resources['type'])

for r in state_resources:
    resources[r.split(".")[0]] = r.split(".")[1]


for u in parsed_infracost_examples:
    
    # # pprint.pprint(r)
    # pprint.pprint(r['type'])
    # resources[r] = terraform_state['modules'][0]['resources'][i]['type']

pprint.pprint(resources)


# resource_usage:
#   aws_api_gateway_rest_api.tfer--icm-dev:
#     monthly_requests:  100000000
#   aws_api_gateway_rest_api.tfer--icm-uat:
#     monthly_requests:  100000000

# Closing files
state_source_file.close()
infracost_examples_file.close()

# 'tfer--icm-dev'
# 'tfer---002F-aws-002F-lambda-002F-icm-dev-hello'
# 'tfer--icm-dev-us-east-1-lambdaRole'
# 'tfer--icm-dev-hello'

# aws_api_gateway_rest_api.tfer--icm-dev:
#     monthly_requests:  100000000 # Monthly requests to the Rest API Gateway.

# aws_api_gateway_rest_api.tfer--icm-uat:
#     monthly_requests:  100000000 # Monthly requests to the Rest API Gateway.