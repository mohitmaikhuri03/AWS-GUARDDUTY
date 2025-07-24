variable "enable_guardduty" {
  type = bool
}

variable "finding_publishing_frequency" {
  type = string
}

variable "enable_s3_logs" {
  type = string
}

variable "enable_kubernetes_audit_logs" {
  type = string
}

variable "enable_malware_protection_ebs" {
  type = string
}

variable "tags" {
  type = map(string)
}
