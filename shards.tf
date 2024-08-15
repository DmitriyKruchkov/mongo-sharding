locals {
  ssh-key               = file("~/.ssh/id_rsa.pub")
  ssh-key-private-file  = "~/.ssh/id_rsa"
  ansible-playbook-name = "playbook.yml"
  username              = "kryuchkov"
}

resource "yandex_compute_instance" "mongo-shard" {
  for_each    = var.mongod_instances

  name        = "mongod-instance-${each.key}"
  platform_id = each.value.platform_id
  zone = each.value.zone

  scheduling_policy {
    preemptible = true
  }
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      type     = each.value.type
      size     = each.value.size
      image_id = each.value.image_id
    }
  }
  network_interface {
    subnet_id = each.value.zone == "ru-central1-a" ? yandex_vpc_subnet.mongo-subnet-a.id : (each.value.zone == "ru-central1-b" ? yandex_vpc_subnet.mongo-subnet-b.id : yandex_vpc_subnet.mongo-subnet-d.id)
  }
  metadata = {
    user-data = templatefile("cloud-init.tftpl", {
      username = local.username,
      ssh-key  = local.ssh-key
    })
  }
}
