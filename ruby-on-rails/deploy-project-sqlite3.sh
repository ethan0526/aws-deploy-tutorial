# build rails project nginx config
cat > /etc/nginx/sites-enabled/project << EOF
server {
  listen 8080;
  server_name 52.193.77.141; # 還沒 domain 的話，先填 IP 位置

  root /home/ubuntu/project/public;

  passenger_enabled on;

  passenger_min_instances 1;

  location ~ ^/assets/ {
    expires 1y;
    add_header Cache-Control public;
    add_header ETag "";
    break;
   }
}
EOF

# deploy project
cd /home/ubuntu
git clone https://github.com/ethan0526/aws-rails.git project
cd project

bundle install --deployment --without test development

RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:precompile

# restart nginx service
service nginx restart

