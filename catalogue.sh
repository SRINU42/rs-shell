echo -e "\e[33m Enable nodjs18 \e[0m"
dnf module disable nodejs -y &>>/tem/roboshop.log
dnf module enable nodejs:18 -y&>>/tem/roboshop.log

echo -e "\e[33m Install nodejs \e[0m"
dnf install nodejs -y &>>/tem/roboshop.log

echo -e "\e[33m Add roboshop user \e[0m"
useradd roboshop &>>/tem/roboshop.log
mkdir /app &>>/tem/roboshop.log

echo -e "\e[33m Extract the catalogue content \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tem/roboshop.log
cd /app &>>/tem/roboshop.log

echo -e "\e[33m Downloading the content \e[0m"
unzip /tmp/catalogue.zip &>>/tem/roboshop.log
cd /app &>>/tem/roboshop.log

echo -e "\e[33m Install nodjs dependencies \e[0m"
npm install &>>/tem/roboshop.log

echo -e "\e[33m Setup Systemd service \e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tem/roboshop.log

echo -e "\e[33m enable the service \e[0m"
systemctl daemon-reload &>>/tem/roboshop.log
systemctl enable catalogue &>>/tem/roboshop.log
systemctl restart catalogue &>>/tem/roboshop.log

echo -e "\e[33m Extracting the mongodb repo \e[0m"
cp mongodb.repo etc/yum.repos.d/mongodb.repo &>>/tem/roboshop.log

echo -e "\e[33m Install the mongodb \e[0m"
dnf install mongodb-org-shell -y &>>/tem/roboshop.log

echo -e "\e[33m Load schema \e[0m"
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js &>>/tem/roboshop.log