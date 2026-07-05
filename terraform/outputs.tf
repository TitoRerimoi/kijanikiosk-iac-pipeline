output "server_public_ips" {
  description = "Public IP addresses of all KijaniKiosk servers"

  value = {
    for server, instance in module.app_server :
    server => instance.public_ip
  }
}

output "server_instance_ids" {
  description = "EC2 Instance IDs"

  value = {
    for server, instance in module.app_server :
    server => instance.instance_id
  }
}
