variable "keyname" {
  description = "Name of keypair"
  type        = string
  default     = "demokey"
}

variable "eip_id" {
  description = "AllocationID of Elastic IP, will associate to EC2"
  type        = string
  default     = "eipalloc-02c293f055ffff65b"
}