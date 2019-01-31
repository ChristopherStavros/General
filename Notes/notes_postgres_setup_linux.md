# Quick and dirty postgres setup on Ubuntu 18.04

```bash
#install postgres server
sudo apt update
sudo apt install postgres

#install pgadmin3 UI tool
sudo apt install pgadmin3

#switch to postgres user
sudo -i -u postgres

#enter pql
psql

#set postgres user password
/password postgres
<enter password>
```

# Sources

http://connect.boundlessgeo.com/docs/suite/4.6/dataadmin/pgGettingStarted/firstconnect.html
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04