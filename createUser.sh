# !/bin/bash

printf "Enter username: "
read username

# echo $username

sudo useradd $username

# echo $username:$username | sudo passwd $username
(echo $username; echo $username) | sudo passwd $username
