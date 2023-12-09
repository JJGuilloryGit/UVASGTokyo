terraform {
  
}

##-Users, Groups & Group Memberships

resource "aws_iam_user" "user" {
  for_each = toset(var.users)
  name     = each.value
}

resource "aws_iam_group" "group" {
  for_each = var.iam_groups
  name     = each.key
}

# ##resource "aws_iam_group_membership" "group_membership" {
#   for_each = var.group_users

#   name   = "${each.key}-membership"
#   users  = each.value
#   group  = aws_iam_group.group[each.key].name
# }



##-Policies for Groups

data "aws_iam_policy_document" "group_policies" {
  for_each = var.group_policies

  statement {
    effect    = "Allow"
    actions   = each.value
    resources = ["*"]
  }
}



# resource "aws_iam_group_policy" "group_specific_policy" {
#   for_each = var.group_policies
#   name     = "${each.key}-policy"
#   group    = aws_iam_group.group[each.key].name
#   policy   = data.aws_iam_policy_document.group_policies[each.key].json
# }


data "aws_iam_policy_document" "mfa_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:GetSessionToken"]
    resources = ["*"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

resource "aws_iam_group_policy" "mfa_policy" {
  for_each = { for k in var.mfa_enabled_groups : k => var.iam_groups[k] if contains(keys(var.iam_groups), k) }
  name     = "${each.key}-mfa-policy"
  group    = aws_iam_group.group[each.key].name
  policy   = data.aws_iam_policy_document.mfa_policy.json
}


##-Access Keys for Users


resource "aws_iam_access_key" "access_key" {
  for_each = aws_iam_user.user
  user     = each.value.name
}

locals {
  user_keys_csv = { for k, v in aws_iam_access_key.access_key : k => "access_key,secret_key\n${v.id},${v.secret}" }
}

resource "local_file" "user_keys" {
  for_each = local.user_keys_csv
  content  = each.value
  filename = "${each.key}-keys.csv"
}