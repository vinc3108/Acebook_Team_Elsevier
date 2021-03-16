cd ~
echo "installing maven";
sudo yum install -y maven
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
echo "installing node";
nvm install node
echo "installing postgresql";
sudo yum install -y postgresql postgresql-server
sudo service postgresql-setup initdb
echo "starting postgresql";
sudo service postgresql start
echo "creating user";
sudo -u postgres createuser -s ec2-user
echo "creating database";
createdb acebook_springboot_development
echo "starting springboot";
mvn spring-boot:run