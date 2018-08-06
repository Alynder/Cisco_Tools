# Cisco_Tools
Ansible Cisco Tools

Each of these is using network cli the suggested set up for the inventor log in is below.
I dropped in a timeout due to some of the commands/functions taking a decent amount of time that being said you don't want it to automatically timeout. The base time out will always be 10

connection: network_cli   
ansible_user: current_user   
ansible_ssh_pass: password   
ansible_become: yes   
ansible_become_method: enable   
ansible_network_os: ios   
ansible_persistent_command_timeout: 5000   



Upgrade.yaml:
Does 3850 upgrades from the http server based on what install is required. Not all of the same hardware version takes the same commands. This checks to see if a bin expend needs to happen versus the full install command.
