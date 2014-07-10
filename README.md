jenkins-master-slave
====================

##How to bring up Jenkins Master-Slave setup

Prerequisites:
- Install ansible

```
git clone https://github.com/DemandCube/jenkins-master-slave.git
cd jenkins-master-slave
```
#Before running this script, you'll need to follow the steps.

- variables to update in jenkins_global_vars.yml
    - jenkinsgitusername (github repo username)
    - jenkinsgitpassword (github repo password)
    - jenkinsgitemail (github repo email)
    - configGitLocation (git url where Jenkins-config reside eg: github.com/username/Jenkins-configs)
    - subFolder (folder name of jenkins backup files which is in Jenkins-configs project)
    - jenkins_home (jenkins home location for jenkins slave eg: /var/lib/jenkins)
    - jenkins_master_url (jenkins master url eg: http://jenkinsmaster:8080/)
    - jenkins_username (jenkins username)
    - jenkins_password (jenkins password)
    - jenkins_master_sshPublicKey (jenkins master ssh public key eg: ssh-rsa xxxxxxx jenkins@master)
    
After updating jenkins_global_vars.yml run
```
./setup_JenkinsMasterSlave.sh -m <masterhost> -s <slavehost1>,<slavehost2>...

```

