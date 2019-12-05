vhost-apache
===================================

A Docker image based on Ubuntu, serving Apache.

Tags
-----

* latest: Ubuntu (LTS), Apache 2.4

Usage
------

Clone the http_config and/or https_config apache configs to create your virtual host settings as per standard conventions.

Make sure that you put all of your virtual hosts in separate webfolders in the `/home/user/vhosts` folder and point to them in the apache configs.


```bash
$ docker run -d -p 8080:80 \
    -v /home/user/vhosts:/var/www \
    GarretSidzaka/vhost-apache
```

* `-v [local path]:/var/www` maps the container's webroot to a folder where you keep your virtual hosts'sites
* `-p [local port]:80` maps a local port to the container's HTTP port 80, alternatively you may map 443 if using TLS


### Access apache logs

Apache is configured to log both access and error log to STDOUT. So you can simply use `docker logs` to get the log output:

`docker logs -f container-id`




