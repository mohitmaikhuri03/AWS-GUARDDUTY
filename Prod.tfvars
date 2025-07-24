aws_region                    = "us-east-1"

# Enable GuardDuty

enable_guardduty              = true

# Set to "SIX_HOURS" to reduce cost in prod. 
# Since EventBridge is enabled, faster publishing is not required.

finding_publishing_frequency  = "SIX_HOURS"


# Enable all key protection features

enable_s3_logs                = "ENABLED"
enable_kubernetes_audit_logs  = "ENABLED"
enable_malware_protection_ebs = "ENABLED"

# SNS Topic for alerts

topic_name     = "guardduty-alert-prod"
email_address  = "secops@yourcompany.com"  # Prefer a shared security mailbox 

tags = {
  Name        = "GuardDuty-Prod"
}
