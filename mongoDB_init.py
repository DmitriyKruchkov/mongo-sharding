import python_terraform
# from ansible import context, vars
# from ansible.cli import CLI
# from ansible.executor.playbook_executor import PlaybookExecutor
from utils import create_ssh_keys, clear_address


t = python_terraform.Terraform(working_dir="terraform")

t.init()

code, stdout, stderr = t.apply(skip_plan=True)
output_list = stdout.split("Outputs:")[-1].split()
print(output_list)
addrs = [clear_address(i) for i in output_list[3:-1]]
router_addr = addrs[0]
config_addr, shards_addr = addrs[1], addrs[2:]

# playbook_path = "./playbook.yml"
# playbook = PlaybookExecutor(playbooks=[playbook_path])
# playbook.run()
