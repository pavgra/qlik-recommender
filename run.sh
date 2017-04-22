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

pio build # to update the engine
pio train # to train a predictive model with training data
nohup pio deploy & # to deploy the engine as a service to 8000 port