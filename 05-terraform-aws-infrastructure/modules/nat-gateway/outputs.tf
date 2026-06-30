output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "elastic_ip_allocation_id" {
  description = "Elastic IP Allocation ID"
  value       = aws_eip.nat.id
}