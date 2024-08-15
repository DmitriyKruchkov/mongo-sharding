import python_terraform
import re

t = python_terraform.Terraform()

# t.init()

code, stdout, stderr = t.apply(skip_plan=True)

output_list = stdout.split("Outputs:")[-1].split()
router_ip = output_list[2].replace('"', '')
shards_ips = [i.replace('"', '') for i in output_list[5:]]
print(router_ip)
print(shards_ips)

