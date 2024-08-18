output "instances_addresses" {
  value = [
    yandex_compute_instance.mongo-router.network_interface.0.nat_ip_address,
    yandex_compute_instance.mongo-router.network_interface.0.ip_address,
    join(" ", [for i in yandex_compute_instance.mongo-shard : i.network_interface[0].ip_address])
  ]
}