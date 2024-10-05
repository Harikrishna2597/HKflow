resource "aws_iam_user" "user" {
  name = "hkkk"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "accesskey" {
  user = aws_iam_user.user.name
}

data "aws_iam_policy_document" "policynew" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "userpolicynew" {
  name   = "newuserpolicy"
  user   = aws_iam_user.user.name
  policy = data.aws_iam_policy_document.policynew.json
}

resource "null_resource" "write_keys" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Access Key: ${aws_iam_access_key.accesskey.id}" > aws_keys.txt
      echo "Secret Key: ${aws_iam_access_key.accesskey.secret}" >> aws_keys.txt
    EOT
  }
  depends_on = [aws_iam_access_key.accesskey]
}

resource "aws_iam_user" "user1" {
  name = "hkkk21"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}