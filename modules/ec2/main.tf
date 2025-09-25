

resource "aws_instance" "ec2" {
  count = 1

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnets, count.index)
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-${element(["public", "private"], count.index)}"
    }
  )
}