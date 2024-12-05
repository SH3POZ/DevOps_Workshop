resource "tls_private_key" "jumper_to_private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "jumper_to_private_key_pair" {
  key_name   = "jumper-to-private-key"
  public_key = tls_private_key.jumper_to_private_key.public_key_openssh
}

resource "aws_key_pair" "rizk" {
  key_name   = "rizk-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCd7Sg459Trr29W32e3JJMazfIKlUZM4WulaWLGvOKYLZHOlF2I8hdMBqobBaEnF8owqfhTX0wz9qF2zDiHouMcEfNHDjRkP6jZxWQrHKsuJzCoa6ImXWHiZw+3FbEEiJxbmWek2cL9eyAuA590KcOEspw023p4Pr6v/uGbGsPmmHnxsBDQGlDpsZSSLIa/TSo0/i3U0ze8gUTalgrVnt86A1TVsmtiqTFXxotmCvlPwbVaCK3qOt+MRY6bd49L0oY539XjnHkDWppVY3rwz4gyS9JGiPZYaMQCfigxQxskq3afZ9aHTbpsNRh0zbfiRjZa8r7d5S1su9lhd/SKNoMKHseD8QBqRBwmfnENe3SIkclQMAqcI1beMjcKN9BLlM0YFJxH/CHj31Mt5sniW3uctXxnI/6CHVXW6j518ihjVNxgfbSU6kYR9BLTzlu7EBdOesSzUrrRiDx163JYw+RlFYamupm8/Bs8+C1XbyYIvEuLH4NJSClBY146oqbHD/rF8iBV6VDyNLJ/NPa+ak/eGBRKFlovouKFh7g6tg5wFAA3cMJEp+y9EHWtXmFRra8iYmfLzPKzgjOkp1LswrxGp/oGPgmLm+2epca4bFhbIlh+sReFealB9yeIH1PiE+4ar8Tq4TQvHOJ0hzh47sfIaUbhhW6IG5MFZ9FcIIq3aw== hassan_mecho@hotmail.com"
}
