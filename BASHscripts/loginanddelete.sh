#!/usr/bin/expect -f

set time [lindex $argv 0]

### login
spawn ssh mops22
expect "bastian@pub1.zeuthen.desy.de's password: " { send "Emmy1sc00l0!\n" }

expect "bastian@mops22's password: " { 
                    send "Emmy1sc00l0!\n" 
                    sleep 1
                    send "cp -r /scratch/bastian/LabDAQ /scratch/bastian/Old_Versions_LabDAQ/LabDAQ_$time \n" 
                    send "rm -r /scratch/bastian/LabDAQ \n"
                    send "exit\n"
}                                                                          
interact




