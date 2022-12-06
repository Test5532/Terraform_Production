resource "aws_iam_instance_profile" "s3_Full_Access_For_EC2_Instance_Profile" {
  name = "s3_Full_Access_For_Instance_Profile"
  role = aws_iam_role.s3_Full_Access_Role_For_EC2.name
}

resource "aws_iam_role" "s3_Full_Access_Role_For_EC2" {
  name = "s3_Full_Access_Role_For_EC2_Role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}