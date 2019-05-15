#!/usr/bin/expect -f


# grab the password
stty -echo
send_user -- "Password: "
expect_user -re "(.*)\n"
send_user "\n"
stty echo
set password $expect_out(1,string)
set N [lindex $argv 0]
if { $N ne 1 && $N ne 2 && $N ne 3 && $N ne 4 && $N ne 5 } { set N 2 }
set host pub${N}
# login
spawn ssh -Y mops22 -J ${host}
expect "bastian@pub${N}.zeuthen.desy.de's password: " { send "$password\n" }
expect "bastian@mops22's password: " { send "$password\n"; interact }  
#expect "bastian@mops22's password: " { send "$password\n"}
#expect "$ " { send "LabDAQ.py -o test\r"}
#expect "$ " { send "exit"}
