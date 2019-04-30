variable "usernames" {
    type = "list"
    description = "The IAM username"
}

variable "iampath" {
    description = "The IAM path for this user"
    default = "/"
}

variable "keybase_pgp_public_key" {
    description = "Keybase PGP key to encrypt the user password"
    default = ""
}

variable "create_profile" {
  default = false
}
