output "rule_arn" {
  value = aws_cloudwatch_event_rule.guardduty_findings.arn
}
