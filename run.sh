# Connect to the Docker API on localhost port 4243 and format the JSON output
DOCKER_HOST=tcp://localhost:4243 ./docker.py --pretty

# Any container's ssh port exposed on 0.0.0.0 will be mapped to
# another IP address (where Ansible will attempt to connect via SSH)
DOCKER_DEFAULT_IP=192.0.2.5 ./docker.py --pretty

# Run as input to a playbook:
ansible-playbook -i ~/projects/ansible/contrib/inventory/docker.py docker_inventory_test.yml

# Simple playbook to invoke with the above example:

    - name: Test docker_inventory
      hosts: all
      connection: local
      gather_facts: no
      tasks:
        - debug: msg="Container - {{ inventory_hostname }}"