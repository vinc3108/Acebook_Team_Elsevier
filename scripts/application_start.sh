cd ~
sudo yum install -y maven
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
sudo yum install -y postgresql postgresql-server
sudo service postgresql initdb
sudo service postgresql start
sudo -u postgres createuser -s ec2-user
createdb acebook_springboot_development
mvn spring-boot:run