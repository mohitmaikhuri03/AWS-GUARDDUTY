provider "aws" {
  region = var.aws_region
}

module "guardduty" {
  source = "./aws_guarduty"

  enable_guardduty              = var.enable_guardduty
  finding_publishing_frequency  = var.finding_publishing_frequency
  enable_s3_logs                = var.enable_s3_logs
  enable_kubernetes_audit_logs  = var.enable_kubernetes_audit_logs
  enable_malware_protection_ebs = var.enable_malware_protection_ebs
  tags                          = var.tags
}

module "sns" {
  source        = "./sns"
  topic_name    = var.topic_name
  email_address = var.email_address

}

module "eventbridge" {
  source        = "./eventbridge"
  sns_topic_arn = module.sns.sns_topic_arn
  tags          = var.tags

}
