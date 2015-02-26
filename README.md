graylog2-docker
===============

This docker image is a ready-to-run graylog2 server instance.

Configuration
--------------
In order to login you must provide the admin password at startup, you can set it using the environment variables with docker using `-e "GRAYLOG_PASSWORD=mypassword"`

Running
-------------
To start an instance simply that will be removed after shutdown and you can login to with `admin` / `password` simply run:
```
docker run -t --rm -e "GRAYLOG_PASSWORD=password" kimble/graylog2-docker
```
