resource "aws_acm_certificate" "prod-acm" {
  domain_name               = var.domain_name
  subject_alternative_names = ["*.${var.domain_name}"]
  validation_method         = "DNS"
}

resource "local_file" "cname_name" {
  content  = "Name: ${tolist(aws_acm_certificate.prod-acm.domain_validation_options)[0].resource_record_name}\nValue: ${tolist(aws_acm_certificate.prod-acm.domain_validation_options)[0].resource_record_value}"
  filename = "${var.domain_name}_cname.txt"
}