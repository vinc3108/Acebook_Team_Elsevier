# cd ~
# echo 'installing maven'
# sudo yum install -y maven
# sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# . ~/.nvm/nvm.sh
# echo 'installing node'
# nvm install node
# echo 'installing postgresql'
# sudo yum install -y postgresql postgresql-server
# sudo service postgresql-setup initdb
# echo 'starting postgresql'
# sudo service postgresql start
# echo 'creating user'
# sudo -u postgres createuser -s ec2-user
# echo 'creating database'
# createdb acebook_springboot_development
# echo 'starting springboot'
# mvn spring-boot:run
cd ~
sudo yum install -y java-1.8.0-openjdk-devel.x86_64
sudo alternatives --config java
cd /usr/local/lib/
sudo wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar -xzvf apache-maven-3.6.3-bin.tar.gz
sudo mv apache-maven-3.6.3 /opt/
cd /opt/
sudo ln -s /opt/apache-maven-3.6.3 apache-maven
cd
echo 'MVN_HOME=/opt/apache-maven' >>~/.bash_profile
echo 'PATH=$MVN_HOME/bin:$PATH:$HOME/.local/bin:$HOME/bin' >>~/.bash_profile
source .bash_profile
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
. ~/.nvm/nvm.sh
sudo nvm install node
sudo amazon-linux-extras install -y epel
sudo tee /etc/yum.repos.d/pgdg.repo<<EOF
[pgdg13]
name=PostgreSQL 13 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
EOF
sudo yum install -y postgresql13 postgresql13-server
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
sudo systemctl enable --now postgresql-13
sudo -u postgres createuser -s ec2-user
createdb acebook_springboot_development
sudo chmod -R 777 /home/ec2-user/src/main/resources/static/
mvn spring-boot:run &> /dev/null &
















