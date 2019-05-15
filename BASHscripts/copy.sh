#!/usr/bin/expect -f


set path1 [lindex $argv 0]
set path2 [lindex $argv 1]
set pswd [lindex $argv 2]

spawn scp -r $path1 $path2
expect "bastian@pub1.zeuthen.desy.de's password: " { send "$pswd\n" }
expect "bastian@mops22's password: " { send "$pswd\n"; interact } 

