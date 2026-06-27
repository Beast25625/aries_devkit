#!/bin/bash



echo '-----*****-----'
echo 'Setup_check Bash Script Running*********'
echo '------*****-----'
echo "Hostname is:  $(hostname)"
echo "Current user is  $USER"
echo "Date today is: $(date)"
echo "OS version is:  $(hostnamectl | grep "Operating System")"

echo 'Loop starts here'
for i in git python3 pip3 ros2; do
	if command -v $i &>/dev/null; then
		echo "$i, [OK]"
	else echo "$i, [MISSING]"
	fi
done
echo 'Checking disk space now'


space=$(df -h / | awk 'NR==2 {print $4}' | tr -d 'G' | cut -d. -f1)

if [ "$space" -lt 5 ]; then
    echo "[LOW DISK]"
else
    echo "[GOOD TO GO]"
fi




echo 'ALL CHECKS DONE'
echo 'QUITTTING...... THX FOR RUNNING'
echo '*******************************'


