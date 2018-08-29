# !/bin/bash

printf "To: "
read toemail
echo 
ps -e >> allproc.txt
echo "Your processes in Ubuntu system running currently are: " | mail -s "All Processes List from your system" $toemail -A allproc.txt

