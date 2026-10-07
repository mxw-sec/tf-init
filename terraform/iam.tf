data "aws_iam_policy_document" "ec2_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "app" {
  statement {
    sid     = "ArtifactAccess"
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.artifacts.arn,
      "${aws_s3_bucket.artifacts.arn}/*",
    ]
  }

  statement {
    sid       = "DescribeSelf"
    actions   = ["ec2:DescribeInstances", "ec2:DescribeTags"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "app" {
  name               = "${local.name_prefix}-app"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

resource "aws_iam_policy" "app" {
  name   = "${local.name_prefix}-app"
  policy = data.aws_iam_policy_document.app.json
}

resource "aws_iam_role_policy_attachment" "app" {
  role       = aws_iam_role.app.name
  policy_arn = aws_iam_policy.app.arn
}

resource "aws_iam_role_policy_attachment" "app_ssm" {
  role       = aws_iam_role.app.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "app" {
  name = "${local.name_prefix}-app"
  role = aws_iam_role.app.name
}

data "aws_iam_policy_document" "support_assume" {
  statement {
    sid     = "SupportAssume"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:RequestedRegion"
      values   = [var.aws_region]
    }
  }
}

resource "aws_iam_role" "support" {
  name               = "${local.name_prefix}-support"
  description        = "Support engineer access for troubleshooting"
  assume_role_policy = data.aws_iam_policy_document.support_assume.json
}

resource "aws_iam_role_policy_attachment" "support" {
  role       = aws_iam_role.support.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
