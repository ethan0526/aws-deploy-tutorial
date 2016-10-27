# 安裝 Ruby on Rails 環境
# 更新系統
apt-get update
apt-get upgrade -y

# 安裝 Rails 相依套件
apt-get install -y build-essential git-core bison openssl libreadline6-dev curl zlib1g \
zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3  autoconf libc6-dev libmysqlclient-dev \
libpq-dev libpcre3-dev curl libcurl4-nss-dev libxml2-dev libxslt-dev imagemagick nodejs libffi-dev

# 安裝 Ruby
apt-get install -y --force-yes software-properties-common
apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update
apt-get install -y ruby2.3 ruby2.3-dev

# install MariaDB
## apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
## add-apt-repository 'deb [arch=amd64,i386] http://mirrors.accretive-networks.net/mariadb/repo/10.1/ubuntu xenial main'
## export DEBIAN_FRONTEND=noninteractive

## debconf-set-selections <<< "mariadb-server-10.0 mysql-server/data-dir select ''"
## debconf-set-selections <<< "mariadb-server-10.0 mysql-server/root_password password deploy"
## debconf-set-selections <<< "mariadb-server-10.0 mysql-server/root_password_again password deploy"

## apt-get install -y mariadb-server

## sed -i '/^bind-address/s/bind-address.*=.*/bind-address = */' /etc/mysql/my.cnf
#mysql --user="root" --password="deploy" -e "GRANT ALL ON *.* TO root@'127.0.0.1' IDENTIFIED BY 'deploy';"
#mysql --user="root" --password="deploy" -e "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'deploy';"
## service mysql restart

#mysql --user="root" --password="deploy" -e "CREATE USER 'aws_ec2'@'127.0.0.1' IDENTIFIED BY 'deploy';"
#mysql --user="root" --password="deploy" -e "GRANT ALL ON *.* TO 'aws_ec2'@'127.0.0.1' IDENTIFIED BY 'deploy' WITH GRANT OPTION;"
#mysql --user="root" --password="deploy" -e "GRANT ALL ON *.* TO 'aws_ec2'@'%' IDENTIFIED BY 'deploy' WITH GRANT OPTION;"
#mysql --user="root" --password="deploy" -e "FLUSH PRIVILEGES;"

# Set Character Set

## echo "" >> /etc/mysql/my.cnf
## echo "[mysqld]" >> /etc/mysql/my.cnf
## echo "character-set-server = utf8" >> /etc/mysql/my.cnf

# Create The Initial Database If Specified

## mysql --user="root" --password="deploy" -e "CREATE DATABASE deploy;"



# install PostgreSQL

## apt-get install -y postgresql

# Configure Postgres For Remote Access

## sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.5/main/postgresql.conf
## echo "host    all             all             0.0.0.0/0               md5" | tee -a /etc/postgresql/9.5/main/pg_hba.conf
## sudo -u postgres psql -c "CREATE ROLE ubuntu LOGIN UNENCRYPTED PASSWORD 'deploy' SUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;"
## service postgresql restart

# Create The Initial Database If Specified

## sudo -u postgres /usr/bin/createdb --echo --owner=ubuntu deploy


# 安裝 Nginx + Passenger
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

apt-get install -y --force-yes apt-transport-https ca-certificates

# Add APT repository
sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'

apt-get update

# Install Passenger + Nginx
apt-get install -y nginx-extras passenger

service nginx restart

# install latest git
apt-add-repository ppa:git-core/ppa -y
apt-get update
apt-get install -y git

# install latest nodejs
curl --silent --location https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs

# install Bundler, Rails
gem install bundler --no-ri --no-rdoc
gem install rails --no-ri --no-rdoc


sed -i "s/user www-data;/env PATH;\nuser www-data;/g" /etc/nginx/nginx.conf
sed -i "s/# include \/etc\/nginx\/passenger.conf;/include \/etc\/nginx\/passenger.conf;/g" /etc/nginx/nginx.conf

service nginx restart

