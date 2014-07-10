jenkins-master-slave
====================

##Prerequisites:
- Install ansible
- Make sure there is passwordless ssh connections between host and remote machines (to run ansible)
- Make sure all remote machines are java installed to run jenkins

##Steps to bring up Jenkins Master-Slave:
- Clone jenkins-master-slave

`git clone https://github.com/DemandCube/jenkins-master-slave.git
cd jenkins-master-slave`

- update jenkins_global_vars.yml.
```
vi ./jenkins_global_vars.yml
#variables to update
#===================
#jenkinsgitusername (github repo username)
#jenkinsgitpassword (github repo password)
#jenkinsgitemail (github repo email)
#configGitLocation (git url where Jenkins-config reside eg: github.com/username/Jenkins-configs)
#subFolder (folder name of jenkins backup files which is in Jenkins-configs project)
#jenkins_home (jenkins home location for jenkins slave eg: /var/lib/jenkins)
#jenkins_master_url (jenkins master url eg: http://jenkinsmaster:8080/)
#jenkins_username (jenkins username)
#jenkins_password (jenkins password)
#jenkins_master_sshPublicKey (jenkins master ssh public key eg: ssh-rsa xxxxxxx jenkins@master)

```
- Run ./setup_JenkinsMasterSlave.sh
```
./setup_JenkinsMasterSlave.sh -m <masterhost> -s <slavehost1>,<slavehost2>...
#Usage:
#	-m, --master     set master (either hostname or ip)
#	-s, --slave		 set slave (either hostname or ip | multiple ip's can be given as comma seperated values )
#	-h, --help		 print this help message
```
##Dependencies
jenkins-master-slave is depend on Jenkins-configs and DemandCubePlaybook projects
