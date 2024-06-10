terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.21.2"
    }
  }
}

provider "linode" {
    token = "${var.linode_token}"
}

resource "linode_firewall" "LDS" {
  label = "${var.linode.label}"

  inbound {
    label    = "FTP"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "21"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "FTP-DATA"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "20"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "FTP-PASV-1"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "60000"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "FTP-PASV-2"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "60001"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "FTP-PASV-3"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "60002"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "FTP-PASV-4"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "60003"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "FTP-PASV-5"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "60004"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "SSH"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = var.linode_firewall
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.Akamai-LDS.id]
}

resource "linode_instance" "Akamai-LDS" {
    label = "${var.linode.label}"
    image = "${var.linode_instance.image}"
    region = "${var.linode.region}"
    type = "${var.linode_instance.type}"
    authorized_keys = ["${var.authorized_keys}"]
    root_pass = "${var.root_password}"
    stackscript_id = var.stackscript_id
    stackscript_data = {
      ftpuser = var.ftp_username
      ftppassword = var.ftp_password
      hostname = var.stackscript_data.hostname
    }
}

resource "linode_volume" "lds_volume" {
  label = "${var.linode_volume.label}"
  linode_id = "${linode_instance.Akamai-LDS.id}"
  size = "${var.linode_volume.size}"
  region = "${var.linode.region}"
}