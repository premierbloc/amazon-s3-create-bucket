# Amazon S3 "Create Bucket" Action for GitHub Actions

Create an Amazon S3 bucket.

## Usage

Add the following step to your workflow:

```yaml
    - name: Create artefact bucket
      uses: romaincornuconsulting/amazon-s3-create-bucket@master
```

See [action.yml](action.yml) for the full documentation for this action's inputs and outputs.

## Credentials and Region

This action relies on the [default behavior of the AWS SDK for Javascript](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-credentials-node.html) to determine AWS credentials and region.
Use [the `aws-actions/configure-aws-credentials` action](https://github.com/aws-actions/configure-aws-credentials) to configure the GitHub Actions environment with environment variables containing AWS credentials and your desired region.

We recommend following [Amazon IAM best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html) for the AWS credentials used in GitHub Actions workflows, including:
* Do not store credentials in your repository's code.  You may use [GitHub Actions secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets) to store credentials and redact credentials from GitHub Actions workflow logs.
* [Create an individual IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#create-iam-users) with an access key for use in GitHub Actions workflows, preferably one per repository. Do not use the AWS account root user access key.
* [Grant least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege) to the credentials used in GitHub Actions workflows.  Grant only the permissions required to perform the actions in your GitHub Actions workflows.  See the Permissions section below for the permissions required by this action.
* [Rotate the credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#rotate-credentials) used in GitHub Actions workflows regularly.
* [Monitor the activity](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#keep-a-log) of the credentials used in GitHub Actions workflows.