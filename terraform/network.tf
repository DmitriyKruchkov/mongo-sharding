resource "yandex_vpc_network" "mongo-network" {
  name = "mongo-network"
}

resource "yandex_vpc_subnet" "mongo-subnet-a" {
  name           = "mongo-subnet-a"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.1.0.0/16"]
  network_id     = yandex_vpc_network.mongo-network.id
}

resource "yandex_vpc_subnet" "mongo-subnet-b" {
  name           = "mongo-subnet-b"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["10.2.0.0/16"]
  network_id     = yandex_vpc_network.mongo-network.id
}

resource "yandex_vpc_subnet" "mongo-subnet-d" {
  name           = "mongo-subnet-d"
  zone           = "ru-central1-d"
  v4_cidr_blocks = ["10.3.0.0/16"]
  network_id     = yandex_vpc_network.mongo-network.id
}