output "virtual-ip" {
  value = join(" ", [for i in yandex_compute_instance.mongo-shard: i.network_interface[0].ip_address])
}


output "mongo-router" {
  value = yandex_compute_instance.mongo-router.network_interface.0.nat_ip_address
}