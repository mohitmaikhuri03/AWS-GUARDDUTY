resource "aws_guardduty_detector" "Guard" {
  enable                        = var.enable_guardduty
  finding_publishing_frequency = var.finding_publishing_frequency
  tags                         = var.tags
}

resource "aws_guardduty_detector_feature" "s3_logs" {
  detector_id = aws_guardduty_detector.Guard.id
  name        = "S3_DATA_EVENTS"
  status      = var.enable_s3_logs
}

resource "aws_guardduty_detector_feature" "k8s_audit_logs" {
  detector_id = aws_guardduty_detector.Guard.id
  name        = "EKS_AUDIT_LOGS"
  status      = var.enable_kubernetes_audit_logs
}

resource "aws_guardduty_detector_feature" "ebs_malware_protection" {
  detector_id = aws_guardduty_detector.Guard.id
  name        = "EBS_MALWARE_PROTECTION"
  status      = var.enable_malware_protection_ebs
}
