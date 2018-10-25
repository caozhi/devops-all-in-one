# devops-all-in-one

A repo for experimenting devops.

## DEV

Simple way to init a dev environment. See README under dev.

## PREPARE

Two Dockerfile to build ansible image and tomcat image. The two images will be used for mocking a cluster in CICD. Images are also available on Docker Hub: https://hub.docker.com/u/caozhi/

The reason why I didn't use public tomcat image is the public official tomcat image doesn't support ssh. I need to install ssh by myself. I was thinking why I just created one. 

## CICD

See README under cicd folder.
