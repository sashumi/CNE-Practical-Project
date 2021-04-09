# CNE-Practical-Project

This project was created for the purpose of QA training Cloud 
Native Engineering Practical Project.The purpose of this 
document is to outline the project's goal,specification and 
achievements.  The expectation is to successful completion of
tasks within certain guidelines to engineer a Continuous 
Integration pipeline that encompasses all of the technologies
learned during the training. The application is a simple 
Flask application, built in Python, that makes use of a 
microservice architecture comprising of 2 separate services.

This Project is due on April 9,2021. 

## Table of contents

1. [Resources link](https://github.com/sashumi/CNE-Practical-Project/tree/main#resources-link)
2. [Jira-Agile board](https://github.com/sashumi/CNE-Practical-Project#jira-agile-board)
3. [Architecture-diagrams](https://github.com/sashumi/CNE-Practical-Project#architecture-diagrams)
    * [List of Technologies.png](https://github.com/sashumi/CNE-Practical-Project#list-of-technologiespng)
    * [High level architecture.png](https://github.com/sashumi/CNE-Practical-Project#high-level-architecturepng)
    * [EKS details.png](https://github.com/sashumi/CNE-Practical-Project#3-eks-detailspng)
4. [Risk Assessment](https://github.com/sashumi/CNE-Practical-Project/tree/main#risk-assessment)
5. [Version control Github](https://github.com/sashumi/CNE-Practical-Project#version-control-github)
6. [Local docker set up & Jenkins VM](https://github.com/sashumi/CNE-Practical-Project#local-docker-set-up--jenkins-vm)
    * [Manual steps](https://github.com/sashumi/CNE-Practical-Project#manual-steps)
7. [Jenkins-github](https://github.com/sashumi/CNE-Practical-Project#jenkins-github)
8. [Jenkins-pipeline](https://github.com/sashumi/CNE-Practical-Project#jenkins-pipeline)
9. [Deployment](https://github.com/sashumi/CNE-Practical-Project#deployment)   
10. [Project Retrospective](https://github.com/sashumi/CNE-Practical-Project/tree/main#Project-Retrospective)
    * [Notable Achievements](https://github.com/sashumi/CNE-Practical-Project#notable-achievements)
    * Project Shortcomings
    * Future Improvements
12. [Author](https://github.com/sashumi/CNE-Practical-Project/tree/main#Author)


## Resources link

* CNE Practical project presentation [Link](https://docs.google.com/presentation/d/1hXuTTOvhEixon15tFNLaWaY7T-18X_8m9qRHqRZG_DI/edit?usp=sharing)
* Risk assessment [Link](https://github.com/sashumi/CNE-Practical-Project/blob/2e88d50a40b0ff07ce053c6de22130048b3b0ca1/Risk%20assessment-%20CNE%20practical%20project.pdf)

### Jira-Agile board
    Some sample screnshots from Jira-agile board are below:
   ![1. Learning plan.png](https://github.com/sashumi/CNE-Practical-Project/blob/632cc724a3510ea122bff6b81259986129e34f1d/docs/Jira/1.%20Learning%20plan.png)
   ![2. Linux learning.png](https://github.com/sashumi/CNE-Practical-Project/blob/632cc724a3510ea122bff6b81259986129e34f1d/docs/Jira/2.%20Linux%20learning.png)
   ![3. Ansible.png](https://github.com/sashumi/CNE-Practical-Project/blob/632cc724a3510ea122bff6b81259986129e34f1d/docs/Jira/3.%20Ansible.png)
   ![4. Jenkins set up.png](https://github.com/sashumi/CNE-Practical-Project/blob/632cc724a3510ea122bff6b81259986129e34f1d/docs/Jira/4.%20Jenkins%20set%20up.png)
   ![5. Image build and test planning.png](https://github.com/sashumi/CNE-Practical-Project/blob/632cc724a3510ea122bff6b81259986129e34f1d/docs/Jira/5.%20Image%20build%20and%20test%20planning.png)
   ![6. All epics overview.png](https://github.com/sashumi/CNE-Practical-Project/blob/632cc724a3510ea122bff6b81259986129e34f1d/docs/Jira/6.%20All%20epics%20overview.png)

## Architecture-diagrams

### List of Technologies.png
   ![1. List of Technologies.png](https://github.com/sashumi/CNE-Practical-Project/blob/77475cb52286b34decc896aa10ad9cf14c135189/docs/diagrams/1.%20List%20of%20Technologies.png)
### High level architecture.png
   ![2. High level architecture.png](https://github.com/sashumi/CNE-Practical-Project/blob/77475cb52286b34decc896aa10ad9cf14c135189/docs/diagrams/2.%20High%20level%20architecture.png)
### 3. EKS details.png
   ![3. EKS details.png](https://github.com/sashumi/CNE-Practical-Project/blob/77475cb52286b34decc896aa10ad9cf14c135189/docs/diagrams/3.%20EKS%20details.png)


## Risk Assessment
   The risk assessment for this project can be found here: [Link](https://github.com/sashumi/CNE-Practical-Project/blob/2e88d50a40b0ff07ce053c6de22130048b3b0ca1/Risk%20assessment-%20CNE%20practical%20project.pdf)
   Here is a screen shot of the risk assessment:
![risk assessment](https://github.com/sashumi/CNE-Practical-Project/blob/34934c3ca4ada1b942d75fba5f16b63bd51da4a9/docs/Risk%20assessment/Risk%20assessment.png)

## Version control Github
   ![1-branch_view.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/1-branch_view.PNG)
   

## Local docker set up & Jenkins VM 
### Manual steps:

   1. Creating docker container for local development
   2. Login to the docker container and get the ssh scripts etc.
   3. Run terraform code to deploy VPC, EC2 VM which will use for Jenkins
   4. Run ansible script to provision the Jenkins VM
   5. Run Ansible script to put an elb in front of jenkins.

![2-create_iam_user_to_deploy_jenkins.png](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/2-create_iam_user_to_deploy_jenkins.png)
![3-create_access_keys_form_iam_user_for_jenkins.png](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/3-create_access_keys_form_iam_user_for_jenkins.png)
![4-docker-compose-to-bringup-local-docker.png](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/4-docker-compose-to-bringup-local-docker.png)
![5-docker-compose-up.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/5-docker-compose-up.PNG)
![8-docker-service-dev.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/8-docker-service-dev.PNG)
![9-jenkins-and-nginx.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase1/images/9-jenkins-and-nginx.PNG)


## Jenkins-github
   ![1.1-jenkins_blue_ocean_pat.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase2/images/1.1-jenkins_blue_ocean_pat.PNG)
   ![jenkins-aws-credentials.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase2/images/jenkins-aws-credentials.PNG)
   ![jenkins-masternode-conig-jenkins.PNG](https://github.com/sashumi/CNE-Practical-Project/blob/f73d400c719d2c016115427ac6c4bdb0e17a69ae/docs/phase2/images/jenkins-masternode-conig-jenkins.PNG)

## Jenkins-pipeline
   ![1. create jenkins-git pipeline.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/1.%20create%20jenkins-git%20pipeline.png)
   ![2. all infrastructure pipelines.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/2.%20all%20infrastructure%20pipelines.png)
   ![3. Final 2 pipelines.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/3.%20Final%202%20pipelines.png)
   ![4. new pipeline start message.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/4.%20new%20pipeline%20start%20message.png)
   ![5. pipeline after several runs.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/5.%20pipeline%20after%20several%20runs.png)
   ![6. pipeline initiated by github webhook.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/6.%20pipeline%20initiated%20by%20github%20webhook.png)
   ![7. infrastructure build by terraform.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/7.%20infrastructure%20build%20by%20terraform.png)
   ![8. successfull terraform run.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/8.%20successfull%20terraform%20run.png)
   ![9. Ansible configuration.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/9.%20Ansible%20configuration.png)
   ![10. ansible task.png](https://github.com/sashumi/CNE-Practical-Project/blob/3929bdfd42706be0738ec7d64047af799f88cb03/docs/jenkins-pipeline/10.%20ansible%20task.png)
   
## Deployment
![1. build,test and deployment.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/1.%20build,test%20and%20deployment.png)
![2. image build and push.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/2.%20image%20build%20and%20push.png)
![3. create backend container in pytest vm.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/3.%20create%20backend%20container%20in%20pytest%20vm.png)
![4. ansible configure pytest vm.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/4.%20ansible%20configure%20pytest%20vm.png)
![5. adding sleep 30.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/5.%20adding%20sleep%2030.png)
![6. backend test pass.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/6.%20backend%20test%20pass.png)
![7. Frontend test pass.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/7.%20Frontend%20test%20pass.png)
![8.image clean up.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/8.image%20clean%20up.png)
![9.publish final image.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/9.publish%20final%20image.png)
![10. deploy to eks.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/10.%20deploy%20to%20eks.png)
![11. all containers ready.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/11.%20all%20containers%20ready.png)
![12. Load balancer Ip address.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/12.%20Load%20balancer%20Ip%20address.png)
![13. build 15 blue ocean view.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/13.%20build%2015%20blue%20ocean%20view.png)
![14. build 15 classic view.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/14.%20build%2015%20classic%20view.png)
![15. build 15 source code change.png](https://github.com/sashumi/CNE-Practical-Project/blob/7afb151f19fb5724af4d81a18083d00ac35f9683/docs/deployment/15.%20build%2015%20source%20code%20change.png)

## Project Retrospective

### Notable Achievements

* Fully functional CI pipeline
* Rolling out update to the system without interrupting user experience
* Github private repository used for version control
* Credential store in AWS S3. Also encryted using ansible vault.
* Database has multiple availability zones.

### Project Shortcomings
* No integration between Jira board and github.

### Future Improvements
* Develop integration between Jira and github.

## Acknowledgements

I would like to express my special thanks gratitude to the QA trainers Nathan Forester, Reece Elder and the QA Academy Cloud Native
Engineering Feb-21 cohort who supported me through this journey.

## Author

Shamsi Ara Shumi
   
