resource "yandex_compute_instance" "mongo-router" {
  name        = "mongo-router"
  platform_id = "standard-v3"
  zone = "ru-central1-a"

  scheduling_policy {
    preemptible = true
  }
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      type     = "network-hdd"
      size     = "20"
      image_id = "fd8lk4dibrqmhmn8rbc4"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.mongo-subnet-a.id
    nat = true
  }
  metadata = {
    user-data = templatefile("cloud-init.tftpl", {
      username = local.username,
      ssh-key  = local.ssh-key
    })
  }
}