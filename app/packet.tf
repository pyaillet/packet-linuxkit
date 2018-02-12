variable "auth_token" {
  type = "string"
}

variable "project_id" {
  type = "string"
}

# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.auth_token}"
}

# Create a device and add it to tf_project_1
resource "packet_device" "builder" {
  hostname         = "tftest"
  plan             = "baremetal_2a"
  facility         = "ams1"
  operating_system = "ubuntu_16_04"
  billing_cycle    = "hourly"
  project_id       = "${var.project_id}"
  user_data        = "${file("./cloud-config.yml")}"
}
