const aws = require('aws-sdk')
const core = require('@actions/core')
const crypto = require('crypto')


s3 = new aws.S3()


function action_handler() {
  const repository = process.env.GITHUB_REPOSITORY
  const hash = crypto.createHash('md5').update(repository).digest("hex")
  const bucket = core.getInput('bucket') || 'notset'
  
  var params = {
    Bucket: `${bucket}-${hash.substring(0, 15)}`
  };

  s3.createBucket(params, function(err, data) {
    if (err) {
      core.setFailed(error.message)
    }
    else {
      core.setOutput("bucket", data['Location'])
    }
  });
}


module.exports = action_handler;


if (require.main === module) {
    action_handler()
}