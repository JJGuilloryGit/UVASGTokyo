terraform {
  
}

#-New User One. (Group 1)

resource "aws_iam_user" "New-User-1" {
  name = "Keisha"
}

resource "aws_iam_group" "my-group-1" {
  name = "BabyMommaDestroyer1"
}

resource "aws_iam_user_group_membership" "Keisha" {
  user = aws_iam_user.New-User-1.name

  groups = [
    aws_iam_group.my-group-1.name
  ]
}

resource "aws_iam_group_policy" "GP1" {
  name  = "KeishaControls"
  group = aws_iam_group.my-group-1.name
  policy = jsonencode({
    Version = "2012-10-17"
    "Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Deny",
			"Action": "autoscaling-plans:CreateScalingPlan",
			"Resource": "*"
      },
    ]
  })
}

#-New User Two (Group Two)

resource "aws_iam_user" "New-User-2" {
  name = "Wendy"
}

resource "aws_iam_group" "my-group-2" {
  name = "SideChick"
}

resource "aws_iam_user_group_membership" "Wendy" {
  user = aws_iam_user.New-User-2.name

  groups = [
    aws_iam_group.my-group-2.name
  ]
}

resource "aws_iam_group_policy" "GP2" {
  name  = "Side-Chick-Standards"
  group = aws_iam_group.my-group-2.name
  policy = jsonencode({
    Version = "2012-10-17"
    "Statement": [
		{
		  "Sid": "VisualEditor0",
			"Effect": "Deny",
			"Action": "s3:CreateBucket",
			"Resource": "*"
      },
    ]
  })
}

#-New User Three (Group Three)

resource "aws_iam_user" "New-User-3" {
  name = "Katie"
}

resource "aws_iam_group" "my-group-3" {
  name = "JumpOff"
}

resource "aws_iam_user_group_membership" "Katie" {
  user = aws_iam_user.New-User-3.name

  groups = [
    aws_iam_group.my-group-3.name
  ]
}

resource "aws_iam_group_policy" "GP3" {
  name  = "Jump-Off-Options"
  group = aws_iam_group.my-group-3.name
  policy = jsonencode({
    Version = "2012-10-17"
    "Statement": [
		{
		  "Sid": "VisualEditor0",
			"Effect": "Deny",
			"Action": "iam:CreateUser"
      "Action": "iam:CreateGroup"
			"Resource": "*"
      },
    ]
  })
}


#-New User Four (Group Four)

resource "aws_iam_user" "New-User-4" {
  name = "Paula"
}

resource "aws_iam_group" "my-group-4" {
  name = "Wifey"
}

resource "aws_iam_user_group_membership" "Paula" {
  user = aws_iam_user.New-User-4.name

  groups = [
    aws_iam_group.my-group-4.name
  ]
}

resource "aws_iam_group_policy" "GP4" {
  name  = "Jump-Off-Options"
  group = aws_iam_group.my-group-4.name
  policy = jsonencode({
    Version = "2012-10-17"
    "Statement": [
		{
		  "Sid": "VisualEditor0",
			"Effect": "Deny",
			"Action": "ec2:CreateSecurityGroup"
			"Resource": "*"
      },
    ]
  })
}