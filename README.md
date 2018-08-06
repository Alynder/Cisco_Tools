## Cisco_Tools
-------------------------------
Ansible Cisco Tools   
-------------------------------------
   

Each of these is using network cli the suggested set up for the inventor log in is below.
I dropped in a timeout due to some of the commands/functions taking a decent amount of time that being said you don't want it to automatically timeout. The base time out will always be 10.


Upgrade.yaml:

> Example inventory configuration
``` 
[all:vars]     
connection=network_cli   
ansible_user=current_user   
ansible_ssh_pass=password   
ansible_become=yes   
ansible_become_method=enable   
ansible_network_os=ios   
ansible_persistent_command_timeout=5000   


[IOS]  
10.0.0.0  
```

Does 3850 upgrades from the http server based on what install is required. Not all of the same hardware version takes the same commands. This checks to see if a bin expend needs to happen versus the full install command.

    



pass_change.yaml:  

> Example inventory configuration   

```
[all:vars]  
new_pass = newpasswordhere

[devices:children]   
ios   
iosxr   
nxos   
asa   
wlc  

[iosxr]    
x.x.x.x  
x.x.x.x  

[iosxr:vars]  
connection=network_cli   
ansible_user=current_user   
ansible_ssh_pass=password   
ansible_become=yes   
ansible_become_method=enable   
ansible_network_os=iosxr   
ansible_persistent_command_timeout=5000 

[ios]    
x.x.x.x  
x.x.x.x  

[ios:vars]  
connection=network_cli   
ansible_user=current_user   
ansible_ssh_pass=password   
ansible_become=yes   
ansible_become_method=enable   
ansible_network_os=ios   
ansible_persistent_command_timeout=5000 

[nxos]    
x.x.x.x  
x.x.x.x  

[nxos:vars]  
connection=network_cli   
ansible_user=current_user   
ansible_ssh_pass=password   
ansible_become=yes   
ansible_become_method=enable   
ansible_network_os=nxos   
ansible_persistent_command_timeout=5000 

[asa]    
x.x.x.x  
x.x.x.x  

[asa:vars]  
connection=local  
user=username   
pass=password   


[wlc]    
x.x.x.x  
x.x.x.x  

[wlc:vars]  
connection=local  
user=username   
pass=password   

```






