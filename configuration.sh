#! /bin/bash

aws s3 cp --recursive s3://jenkinsconfigtemplate/JenkinsMasterTemplatenew/jenkins_new .
sed -i "s/Url><\/jenkinsUrl/Url>http:\/\/$LBDns\/<\/jenkinsUrl/g" config.xml
sed -i "s/Url><\/jenkinsUrl/Url>http:\/\/$LBDns\/<\/jenkinsUrl/g" jenkins.model.JenkinsLocationConfiguration.xml
sed -i "s/tunnel><\/tunnel/tunnel>$LBDns:50000<\/tunnel/g" config.xml
sed -i "s/cluster><\/cluster/cluster>arn:aws:ecs:$Region:$Accountid:cluster\/$Clustername<\/cluster/g" config.xml
sed -i "s/taskDefinitionArn><\/taskDefinitionArn/taskDefinitionArn>arn:aws:ecs:$Region:$Accountid:task-definition\/jenkins-slave:1<\/taskDefinitionArn/g" config.xml
sed -i "s/regionName><\/regionName/regionName>$Region<\/regionName/g" config.xml
