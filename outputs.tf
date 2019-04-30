output "private-key" {
  value = "${tls_private_key.self.*.private_key_pem}"
}

output "public-key" {
  value = "${tls_private_key.self.*.public_key_openssh}"
}

output "user-name" {
    value = "${aws_iam_user.self.*.name}"
}

output "user-arn" {
    value = "${aws_iam_user.self.*.arn}"
}

output "user-unique_id" {
    value = "${aws_iam_user.self.*.unique_id}"
}

output "user-access-key-secret" {
    value = "${aws_iam_access_key.self.*.secret}"
}

output "user-access-key-id" {
    value = "${aws_iam_access_key.self.*.id}"
}