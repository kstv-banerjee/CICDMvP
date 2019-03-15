
aws s3 cp s3://jenkinsconfigtemplate/jenkins_homeACtemplate . --recursive
sed -i "s/Url><\/jenkinsUrl/Url>http:\/\/$LBDns\/<\/jenkinsUrl/g" config.xml
sed -i "s/tunnel><\/tunnel/tunnel>$LBDns:50000<\/tunnel/g" config.xml
sed -i "s/cluster><\/cluster/cluster>arn:aws:ecs:$Region:$Accountid:cluster\/$Clustername<\/cluster/g" config.xml
sed -i "s/regionName><\/regionName/regionName>$Region<\/regionName/g" config.xml
