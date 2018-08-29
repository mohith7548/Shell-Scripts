# !/bin/bash

printf "To: "
read toemail
echo 
printf "Subject: "
read subject
echo 
printf "Message: "
read message
echo 
echo $message | mail -s $subject $toemail
