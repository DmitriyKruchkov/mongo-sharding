variable "mongod_instances" {
  type = map(object({
    name_id       = string
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number
    type          = string
    size          = string
    image_id      = string
    zone = string
  }))

  default = {
  first: {
    name_id       = "1"
    platform_id   = "standard-v3"
    cores         = 2
    memory        = 1
    core_fraction = 20
    type          = "network-hdd"
    size          = "20"
    image_id      = "fd8lk4dibrqmhmn8rbc4"
    zone          = "ru-central1-a"
  } ,
    second: {
    name_id = "2"
    platform_id = "standard-v3"
    cores = 2
    memory        = 1
    core_fraction = 20
    type = "network-hdd"
    size = "20"
    image_id = "fd8lk4dibrqmhmn8rbc4"
    zone = "ru-central1-b"
    }
  }
}