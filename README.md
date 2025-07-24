# ✅ GuardDuty Monitoring with SNS & EventBridge — Terraform Setup

This Terraform setup enables [Amazon GuardDuty](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html) to detect threats, sends alerts via [Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/welcome.html), and routes findings using [Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html).

---

## 📦 Resources Used

| Terraform Resource | Purpose |
|--------------------|---------|
| [`aws_guardduty_detector`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | Enables GuardDuty in the AWS account |
| [`aws_guardduty_detector_feature`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector_feature) | Enables optional features like S3 logs, Kubernetes audit, EBS malware |
| [`aws_sns_topic`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | SNS topic to receive GuardDuty alerts |
| [`aws_sns_topic_subscription`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | Subscribes your email to the SNS topic |
| [`aws_cloudwatch_event_rule`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | Triggers on specific GuardDuty findings |
| [`aws_cloudwatch_event_target`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | Sends the event to the SNS topic |

---

## 🔗 Why Each Resource Is Used

### 🛡️ [`aws_guardduty_detector`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector)

- Enables the GuardDuty service to monitor your account.
- Detects threats like unusual API calls, reconnaissance, and port scans.

### 🔐 [`aws_guardduty_detector_feature`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector_feature)

- Enables advanced features like:
  - S3 protection
  - Kubernetes (EKS) audit logging
  - EBS malware scan
- Improves security depth and threat visibility.

### 📣 [`aws_sns_topic`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) & [`aws_sns_topic_subscription`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription)

- SNS is used to send alert notifications via email (or to Lambda, SQS, HTTPS endpoints).
- GuardDuty cannot directly send email or invoke Lambda — it **needs SNS or EventBridge as a bridge**.

### 📆 [`aws_cloudwatch_event_rule`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) & [`aws_cloudwatch_event_target`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target)

- GuardDuty **does not** directly push findings to SNS.
- [EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/what-is-amazon-eventbridge.html) is required to listen to findings.
- Captures events from source = `"aws.guardduty"` and routes to SNS or another target.

---

## ⚠️ Why SNS Alone Is Not Enough

- GuardDuty **doesn’t integrate directly** with SNS.
- It only publishes findings to **EventBridge**.
- So, EventBridge **must route findings** to SNS (or another downstream service).

---

## 📊 Why CloudWatch Is Not Enough

- CloudWatch collects metrics and logs.
- GuardDuty **does not publish findings** as CloudWatch Logs or Metrics by default.
- CloudWatch **can’t trigger alerts** for GuardDuty without a supported event source.
- That’s why **EventBridge is the preferred native integration point** for GuardDuty alerts.

---

## ✅ Summary

This setup ensures:
- **Real-time threat detection (GuardDuty)**
- **Flexible routing (EventBridge)**
- **Reliable alerting (SNS)**

> 🔐 Ensure you **confirm the email subscription** to SNS manually to start receiving alerts.

---
