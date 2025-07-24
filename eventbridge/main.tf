resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "guardduty-findings-rule"
  description = "Forward GuardDuty findings to SNS"
  event_pattern = jsonencode({
    source      = ["aws.guardduty"],
    detail-type = ["GuardDuty Finding"]
  })
  tags = var.tags
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_findings.name
  arn       = var.sns_topic_arn
}
