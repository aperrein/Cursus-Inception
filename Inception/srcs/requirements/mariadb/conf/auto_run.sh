service mysql start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'aperrein.42.fr' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#mysql -e "CREATE DATABASE IF NOT EXISTS \`database1\`;"
#mysql -e "CREATE USER IF NOT EXISTS 'user1'@'aperrein.42.fr' IDENTIFIED BY 'mdpuser1';"
#mysql -e "GRANT ALL PRIVILEGES ON \`database1\`.* TO 'user1'@'%' IDENTIFIED BY 'mdpuser1';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Motdepasse1';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
#mysql -u root -pMotdepasse1 -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
#mysqladmin -u root -pMotdepasse1 shutdown
exec mysqld_safe
