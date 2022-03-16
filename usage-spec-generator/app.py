# Python program to read
# json file

import json
import yaml

# Opening JSON file
state_source_file = open('../terraformer/generated/aws/terraform.tfstate')
# Opening YAML file
infracost_examples_file = open('../docs/infracost-usage-example.yml')

# returns JSON object as
# a dictionary
terraform_state = json.load(state_source_file)

# Iterating through the json
# list
for i in terraform_state['modules']:
    print(i)

# Closing files
state_source_file.close()
infracost_examples_file.close()