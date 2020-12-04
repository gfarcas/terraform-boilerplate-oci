resource "oci_core_instance" "oracle" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = "VM.Standard.E2.1.Micro"
    source_details {
        source_id = var.source_id
        source_type = "image"
    }

    # Optional
    display_name = "owncloud"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = var.subnet_id
    }
    metadata = {
        ssh_authorized_keys = file("/root/tf-compute/oracle.pub") 
} 
    preserve_boot_volume = false
}
