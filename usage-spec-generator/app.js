const yaml = require('js-yaml');
const fs   = require('fs');
const terraformState = require('../terraformer/generated/aws/terraform.json'); 
// const infracostExamples = read_config('../docs/infracost-usage-example.yml'); 

// Get document, or throw exception on error
try {
  const doc = yaml.load(fs.readFileSync('../docs/infracost-usage-example.yml', 'utf8'));
  console.log(doc);
} catch (e) {
  console.log(e);
}

console.log(terraformState);

// console.log(infracostExamples)

