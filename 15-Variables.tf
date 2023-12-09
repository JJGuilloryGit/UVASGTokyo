variable "users" {
  description = "Users"
  type        = list(string)
}

variable "iam_groups" {
  description = "Groups"
  type        = map(string)
}


variable "group_users" {
  description = "GroupUsers"
  type        = map(list(string))
}


variable "group_policies" {
  description = "policies"
  type        = map(list(string))
}

variable "mfa_enabled_groups" {
  description = "List of groups that require MFA"
  type        = list(string)
  default     = ["Revans_Rule", "Maglus_Rule"] 
}

