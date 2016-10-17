# 安裝 Ruby on Rails 環境
# 更新系統
apt-get update
apt-get upgrade -y

# 安裝 Rails 相依套件
apt-get install -y build-essential git-core bison openssl libreadline6-dev curl zlib1g \
zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3  autoconf libc6-dev \
libpcre3-dev curl libcurl4-nss-dev libxml2-dev libxslt-dev imagemagick nodejs libffi-dev

# 用套件快速安裝 Ruby
apt-get install -y --force-yes software-properties-common
apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update
apt-get install -y --force-yes ruby2.3 ruby2.3-dev

# 安裝 Bundler gem
gem install bundler

# 安裝 Nginx + Passenger
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7 -y

apt-get install -y --force-yes apt-transport-https ca-certificates

# Add our APT repository
sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'

apt-get update

# Install Passenger + Nginx
apt-get install -y --force-yes nginx-extras passenger

service nginx restart

