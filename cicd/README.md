# Experimenting the CICD process with Jenkins Pipeline and Ansible

Implemented a Jenkins Pipeline to mock a whole pipeline from prepare to production. 
Using ansible to implement the deployment process.

## Starting Up a Cluster

```shell
./mock.sh
```

The script will using docker compose to start a cluster with 6 containers. Then init the cluster like init pass-free env from ansible host to other servers.

## jenkins/Jenkinsfile

Jenkins pipeline. Read the code, you’ll know how it works.

## Ansbile Folder

Ansible project for production deployment. Allow two option:
ansible-playbook deploy.yml -e action=upgrade
ansible-playbook deploy.yml -e action=rollback
