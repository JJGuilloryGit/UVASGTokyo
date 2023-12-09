users = ["Keisha", "Wendy", "Paula", "Katie",]

iam_groups = {
  "BabyMommaDestroyer"   = "Group-1"
  "SideChick"   = "Group-2"
  "Jump-Off"  = "Group-3"
  "Wifey"    = "Group-4"
}

group_users = {
  "Group-1"   = ["Keisha", "Wendy"]
  "Group-2"   = ["Paula"]
  "Group-3"  = ["Katie", "Paula"]
  "Group-4"    = ["Wendy"]
}

group_policies = {
  "Group-1"   = ["Readonly"]
  "Group-2"   = ["ec2:RunInstances", "ec2:TerminateInstances", "ec2:StopInstances", "ec2:StartInstances"]
  "Group-3"  = ["ec2:ModifySnapshotAttribute", "cognito-idp:*", "cognito-sync:*"]
  "Group-4"    = ["ec2:Describe*", "s3:Get*", "s3:List*"] 
}
