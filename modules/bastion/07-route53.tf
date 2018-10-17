data "aws_route53_zone" "default" {
  count = "${var.base_domain != "" ? 1 : 0}"
  name  = "${var.base_domain}"
}

resource "aws_route53_record" "default" {
  count   = "${var.base_domain != "" ? 1 : 0}"
  zone_id = "${data.aws_route53_zone.default.zone_id}"
  name    = "${var.name}-${var.suffix}.${data.aws_route53_zone.default.name}"
  type    = "A"
  ttl     = 300
  records = [
    "${aws_eip.default.public_ip}"
  ]
}