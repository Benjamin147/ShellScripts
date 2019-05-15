#!/usr/bin/expect -f


# grab the password
stty -echo
send_user -- "Password: "
expect_user -re "(.*)\n"
send_user "\n"
stty echo
set password $expect_out(1,string)

# login
spawn ssh -Y bastian@pub1.zeuthen.desy.de
expect "bastian@pub.zeuthen.desy.de's password: " { send "$password\n"; interact }

