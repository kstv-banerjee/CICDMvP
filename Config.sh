
cp config.xml configtemp.xml
sed -i "s/Url><\/jenkinsUrl/Url>http:\/\/$LBDns\/<\/jenkinsUrl/g" config.xml
sed -i "s/tunnel><\/tunnel/tunnel>$LBDns:50000<\/tunnel/g" config.xml
sed -i "s/cluster><\/cluster/cluster>arn:aws:ecs:$Region:$Accountid:cluster\/$Clustername<\/cluster/g" config.xml
sed -i "s/regionName><\/regionName/regionName>$Region<\/regionName/g" config.xml




values to be saved as environment variables

1. LB DNS name
2. Account id
3. Region name
4. Cluster name 
