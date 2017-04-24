# Setup AMI:
# http://actionml.com/docs/awssetupguide

pwd
cd /home/aml/ur

nohup pio eventserver &
pio app new qlick-recommender
: '
[INFO] [HBLEvents] The table pio_event:events_3 doesnt exist yet. Creating now...
[INFO] [App$] Initialized Event Store for this app ID: 3.
 [INFO] [App$] Created new app:
[INFO] [App$]       Name: qlick-recommender
[INFO] [App$]         ID: 3
[INFO] [App$] Access Key: CT3TNcBbZ4gMMBC0NUEoHUGaqqSFwR95DSN7wOjVlg6kALWwiE31mCee9Zk_nYQu
'

# send some data
# configure engine.json

pio build # to update the engine
pio train # to train a predictive model with training data
nohup pio deploy & # to deploy the engine as a service to 8000 port

# Setup Nginx as reverse-proxy to enable CORS

: '
sudo apt-get install nginx
sudo apt-get install nginx-extras

sudo nano /etc/nginx/sites-available/default

# Set following config
# server {
#         listen 9090 default_server;
#         listen [::]:9090 default_server;

#         location / {
#           add_header 'Access-Control-Allow-Origin' '*';
# 			add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS, PUT, DELETE';
# 			add_header 'Access-Control-Allow-Credentials' 'true';
# 			add_header 'Access-Control-Allow-Headers' 'Origin,Content-Type,Accept';
# 			proxy_pass http://localhost:8000;
#         }
# }

sudo service nginx restart

'