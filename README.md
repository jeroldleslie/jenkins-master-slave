jenkins-master-slave
====================

#How to bring up Jenkins

##digitalOcean
Prerequisites:
- Install vagrant-flow
    - Follow ALL the instructions here https://github.com/DemandCube/vagrant-flow

```
git clone https://github.com/DemandCube/jenkins-master-slave.git
cd jenkins-master-slave

#Before running this script, you'll need to update
#multiinitconfig.yml with your digitalocean api key and client id and also make sure your ssh private key path is correct
./setup_digitalOcean.sh
```
Now you should be able to reach http://jenkinsdp.demandcube.com:8080 and see Jenkins.  

(This may take a minute, as DNS needs to refresh)

Backing up jobs and configs
=======
- Navigate to ```http://yourJenkinsAddress:8080/job/Push_Jenkins_CI_Changes/``` 
- Click "Build with parameters" on the right hand pane
- Enter in your commit message
- You jobs and configurations will now be backed up into git
- Builds themselves will not be backed up
    - I.e If you have a job that compiles code and creates an executable that is stored on Jenkins, your job/steps/build process will be backed up, but no runs of that job nor executables will be backed up

Plugins
=========
- [Github oAuth Plugin] (https://wiki.jenkins-ci.org/display/JENKINS/Github+OAuth+Plugin)
- [Github Integration Plugin] (https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin)
- [Github Pull Request] (https://wiki.jenkins-ci.org/display/JENKINS/GitHub+pull+request+builder+plugin)

