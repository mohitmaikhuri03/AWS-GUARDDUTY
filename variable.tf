variable "aws_region" {
  default     = "us-east-1"
  description = "Region to deploy"
}


variable "enable_guardduty" {
  type    = bool
  default = true
}

variable "finding_publishing_frequency" {
  type    = string
  default = "FIFTEEN_MINUTES"
}

variable "enable_s3_logs" {
  type    = string
  default = "ENABLED"
}

variable "enable_kubernetes_audit_logs" {
  type    = string
  default = "DISABLED"
}

variable "enable_malware_protection_ebs" {
  type    = string
  default = "ENABLED"
}

variable "tags" {
  type = map(string)
  default = {
    Name = "GuardDuty"
  }
}

variable "topic_name" {
  type    = string
  default = "Guardduty-alert-topic "
}

variable "email_address" {
  type    = string
  default = "mohit.kumar.snaatak@mygurukulam.co"
}
