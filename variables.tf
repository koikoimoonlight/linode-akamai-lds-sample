variable "linode" {
    default = {
        label = "Akamai-LDS"
        region = "ap-northeast"
    }
}

variable "linode_token" {
    type = string
}

variable "authorized_keys" {
    type = string
}

variable "root_password" {
    type = string
}

variable "ftp_username" {
    type = string
}

variable "ftp_password" {
    type = string
}

variable "linode_firewall" {
    default = [
        "192.168.0.1/32",
        "192.168.0.2/32"
    ]
}

variable "linode_instance" {
    default = {
        label = "LDS"
        image = "linode/ubuntu24.04"
        type = "g6-nanode-1"
    }
}

variable "linode_volume" {
    default = {
        label = "lds_volume"
        size = 10
    }
}

variable "stackscript_id" {
	default = "1389569"
}

variable "stackscript_data" {
	default = {
        hostname = "LDS"
	}
}