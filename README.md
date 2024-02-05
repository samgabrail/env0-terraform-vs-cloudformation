# Overview
A demo of Terraform vs CloudFormation

### Terraform Demo

Let's now run Terraform.

#### Create an S3 Bucket with Terraform

1. The Terraform configuration is found in the `TerraformS3.tf` file and is written in HCL (HashiCorp Configuration Language).

2. Make sure you have the [Terraform binary installed](https://developer.hashicorp.com/terraform/install) on your machine.

3. Run the following commands to create an S3 bucket with Terraform:

```bash
terraform init
terraform plan
terraform apply
```

#### Destroy the S3 Bucket with Terraform

Run the following command and accept the prompt to destroy the S3 bucket:

```bash
terraform destroy
```

### CloudFormation Demo

#### Create an S3 Bucket with CloudFormation

To deploy a CloudFormation template (written in YAML or JSON), you can use the AWS Management Console, AWS Command Line Interface (CLI), or AWS SDKs. Below are the steps for deploying your CloudFormation template using the AWS Management Console and AWS CLI:

1. Prepare Your Template: Ensure your YAML file is ready and accessible.
2. Install the AWS CLI: If you haven't already, [install the AWS CLI](https://aws.amazon.com/cli/) and configure it with your AWS credentials.
3. Deploy the Stack: Open your terminal or command prompt. Use the `aws cloudformation create-stack` command to deploy your template. You'll need to specify the stack name and the path to your YAML file. Here's an example command:

```bash
aws cloudformation create-stack --stack-name env0-demo-cloudformation-stack --template-body file://CloudFormationS3.yaml
```

Output:
```bash
{
    "StackId": "arn:aws:cloudformation:us-east-1:706933696988:stack/env0-demo-cloudformation-stack/fcaa0880-c209-11ee-81a7-1272e2b5acdf"
}
```

4. **Monitor the Stack Creation:** You can monitor the progress of your stack creation in the AWS Management Console under the CloudFormation service, or by using the AWS CLI command:

```bash
aws cloudformation describe-stacks --stack-name env0-demo-cloudformation-stack
```

Output:
```json
{
    "Stacks": [
        {
            "StackId": "arn:aws:cloudformation:us-east-1:706933696988:stack/env0-demo-cloudformation-stack/fcaa0880-c209-11ee-81a7-1272e2b5acdf",
            "StackName": "env0-demo-cloudformation-stack",
            "CreationTime": "2024-02-02T20:39:53.044000+00:00",
            "RollbackConfiguration": {},
            "StackStatus": "CREATE_COMPLETE",
            "DisableRollback": false,
            "NotificationARNs": [],
            "Tags": [],
            "EnableTerminationProtection": false,
            "DriftInformation": {
                "StackDriftStatus": "NOT_CHECKED"
            }
        }
    ]
}
```

#### Destroy the CloudFormation Stack

Run the following command:

```bash
aws cloudformation delete-stack --stack-name env0-demo-cloudformation-stack
```

You won't get any output, but once again you can check the status with the command:

```bash
aws cloudformation describe-stacks --stack-name env0-demo-cloudformation-stack
```

Output:

```bash
An error occurred (ValidationError) when calling the DescribeStacks operation: Stack with id env0-demo-cloudformation-stack does not exist
```