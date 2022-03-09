# Terraformer help doc

Some helpful stuff about what's in this directory. Infracost info further 
down.

## Dockerfile

The dockerfile can be used to execute terraformer commands:

  https://github.com/GoogleCloudPlatform/terraformer#capabilities

## Examples

This will generate terraformer'd code into /terraformer/generated/aws.

```
  docker run \
  -v ~/.aws/credentials:/root/.aws/credentials \
  -v $(pwd)/terraformer:/src \
  terraformer \
  import aws \
  --resources="*" \
  --filter="Name=tags.project;Value=ICM" \
  --regions="us-east-1" \
  --profile="default" \
  --path-pattern="{output}/{provider}/"
```
*Notes*
  The filter flag should be used AND match with your project tags.

  The path-pattern flag is used to store all terraformer output in the same 
  directory, this is useful preparations for infracost.

  Also change the value for profile.

# Infracost 

## Examples 

Collect resource names from generated terraform state:

```
  jq -r '.modules[].resources | keys[]' generated/aws/terraform.tfstate
```

## Usage File

Find out more about how to configure the usage file here: 

https://github.com/infracost/infracost/blob/master/infracost-usage-example.yml