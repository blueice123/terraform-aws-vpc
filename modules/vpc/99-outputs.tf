# output

output "name" {
  value = "${local.full_name}"
}

output "vpc_id" {
  value = "${aws_vpc.default.*.id}"
}

output "subnet_public_ids" {
  value = "${aws_subnet.public.*.id}"
}

output "subnet_private_ids" {
  value = "${aws_subnet.private.*.id}"
}

output "bastion_doamin" {
  value = "${aws_route53_record.bastion.*.name}"
}

output "bastion_ip" {
  value = "${aws_eip.bastion.*.public_ip}"
}
