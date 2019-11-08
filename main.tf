resource "aws_iam_user" "self" {
  count = length(var.usernames)
  name  = var.usernames[count.index]
  path  = var.iampath
}

resource "aws_iam_user_login_profile" "self" {
  count   = var.create_profile ? 1 : 0 * length(var.usernames)
  user    = element(aws_iam_user.self.*.name, count.index)
  pgp_key = var.keybase_pgp_public_key
}

resource "aws_iam_access_key" "self" {
  count = length(var.usernames)
  user  = element(aws_iam_user.self.*.name, count.index)
}

resource "tls_private_key" "self" {
  algorithm = "RSA"
}

resource "aws_iam_user_ssh_key" "self" {
  count      = length(var.usernames)
  username   = element(aws_iam_user.self.*.name, count.index)
  encoding   = "SSH"
  public_key = element(tls_private_key.self.*.public_key_openssh, count.index)
}

