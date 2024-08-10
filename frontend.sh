echo -e "\e[33m install nginx \e[0m"
dnf install nginx -y &>>/tem/roboshop.log

echo -e "\e[33m removing nginx content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tem/roboshop.log

echo -e "\e[33m downloading frontend content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tem/roboshop.log

echo -e "\e[33m copy and extract the frontend content \e[0m"
cd /usr/share/nginx/html &>>/tem/roboshop.log
unzip /tmp/frontend.zip &>>/tem/roboshop.log

 echo -e "\e[33m Update frontend configuration \e[0m"
 cp roboshop.conf /etc/nginx/default.d/roboshop.conf &>>/tem/roboshop.log


echo -e "\e[33m start nginx service \e[0m"
systemctl enable nginx &>>/tem/roboshop.log
systemctl restart nginx &>>/tem/roboshop.log



