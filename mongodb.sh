echo -e "\e[33m copy the mongodb repofile \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tem/roboshop.log

echo -e "\e[33m Install mongodb \e[0m"
dnf install mongodb-org -y &>>/tem/roboshop.log

echo -e "\e[33m Update listen address \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>/tem/roboshop.log

echo -e "\e[33m Start the mongodb service \e[0m"
systemctl enable mongod &>>/tem/roboshop.log
systemctl restart mongod &>>/tem/roboshop.log