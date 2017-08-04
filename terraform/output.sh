#This script will simply produce the final output after terraform and ansible runs.
#!/bin/bash
#Get the host ip address from ansible hosts file
wordpress_vm_ip=`grep [0-9] ansible/hosts`
echo "=============================================="
echo "----------------------------------------------"
printf "Use http://$wordpress_vm_ip to load and configure your\n\tWordPress Instance\n"
echo "----------------------------------------------"
echo "==============================================="
