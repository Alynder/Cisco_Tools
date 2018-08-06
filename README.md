## Cisco_Tools
-------------------------------
Ansible Cisco Tools   
-------------------------------------
   

_Note: I do have an inventory script for these but there's too many properitary work things in it to just drop it out in the open. I'll be adding it at a later time with less stuff in it.

Each of these is using network cli the suggested set up for the inventor log in is below.
I dropped in a timeout due to some of the commands/functions taking a decent amount of time that being said you don't want it to automatically timeout. The base time out will always be 10.


**Upgrade.yaml:**

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

    



**pass_change.yaml:**  

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
ansible_connection=local  
user=username   
pass=password   

```


Some things to note about the odd things in the playbook. ASA module isn't owned by ansible(yet) there is a bug I threw in with the two dev's involved in this. The command for username change requires the actuall name typed in I used *admin* for this example as a place holder. No one has responded to the bug yet, but the last workshop with ansible I was in they said there's going to be an updated module or maybe they would take that one. ASA's are fairly important for vpn and firewall so I imagine it would be considtered important to pick up at some point.   
The wlc connection has to be ansible connection where the ASA has to be set up with just the word connection. I don't really know why past, it is what it is?



