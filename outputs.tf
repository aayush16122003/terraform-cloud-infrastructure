output "instance_id" {

  value = module.ec2.instance_id

}

output "public_ip" {

  value = module.ec2.public_ip

}

output "vpc_id" {

  value = module.networking.vpc_id

}

output "bucket_name" {

  value = module.s3.bucket_name

}