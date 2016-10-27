apt-get update
apt-get install -y git

git clone https://github.com/ethan0526/aws-deploy-tutorial.git

cd aws-deploy-tutorial

bash ruby-on-rails/install.sh
bash tensorflow-python3/install.sh
bash ruby-on-rails/deploy-project-sqlite3.sh
bash ruby-on-rails/ruby-on-rails/deploy-project-mysql.sh


# install ruby on rails
# wget https://raw.githubusercontent.com/ethan0526/aws-deploy-tutorial/master/ruby-on-rails/install.sh
# bash install.sh

# install tensorflow
# wget https://raw.githubusercontent.com/ethan0526/aws-deploy-tutorial/master/tensorflow-python3/install.sh
# bash install.sh

# install project-sqlite3
# wget https://raw.githubusercontent.com/ethan0526/aws-deploy-tutorial/master/ruby-on-rails/deploy-project-sqlite3.sh
# bash deploy-project-sqlite3.sh

# install project-mysql
# wget https://raw.githubusercontent.com/ethan0526/aws-deploy-tutorial/master/ruby-on-rails/deploy-project-mysql.sh
# bash deploy-project-mysql.sh

