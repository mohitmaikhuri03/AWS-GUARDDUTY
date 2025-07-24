

output "guardduty_detector_id" {
  value = module.guardduty.detector_id
}

output "sns_topic_arn" {
  value = module.sns.sns_topic_arn
}

output "rule_arn" {
  value = module.eventbridge.rule_arn

}
