# 安裝 Ruby on Rails 環境
# 更新系統
apt-get update
apt-get upgrade -y

# 安裝 Rails 相依套件
apt-get install -y build-essential git-core bison openssl libreadline6-dev curl zlib1g \
zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3  autoconf libc6-dev \
libpcre3-dev curl libcurl4-nss-dev libxml2-dev libxslt-dev imagemagick nodejs libffi-dev

# 安裝 Ruby
apt-get install -y --force-yes software-properties-common
apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update
apt-get install -y ruby2.3 ruby2.3-dev

# install mysql
#apt-get install mysql-common mysql-client libmysqlclient-dev


# install postgreSql
#apt-get install postgresql libpq-dev postgresql-contrib

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

# install bundler
gem install bundler

echo "
server {
  listen 80;
  server_name 52.196.9.32; # 還沒 domain 的話，先填 IP 位置

  root /home/ubuntu/deploy/public;
  # 如果是自動化部署，位置在 root /home/deploy/your_project_name/current/public;

  passenger_enabled on;

  passenger_min_instances 1;

  location ~ ^/assets/ {
    expires 1y;
    add_header Cache-Control public;
    add_header ETag "";
    break;
   }
}
" >> /etc/nginx/site-enabled/deploy

