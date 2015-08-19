Graylog Image w/ automagic installation of content packs
========================================================

[![](https://badge.imagelayers.io/kimble/graylog2-docker:latest.svg)](https://imagelayers.io/?images=kimble/graylog2-docker:latest 'Get your own badge on imagelayers.io')

This is a fork of https://github.com/Graylog2/graylog2-images/tree/master/docker adding 
automagic installation of content packs. This is super useful for test / development environments where
you want to add application specific streams, inputs and dashboards. 

**Login credentials:** `admin:admin`


Usage
-----
Create your own Dockerfile inhereting from `kimble/graylog2-docker` and add a `content-packs` directory
in the same folder containing all your content packs in json format. These content-packs will be installed 
and enabled when Graylog starts for the first time inside the container. You will obviously have to re-build 
your image every time you add new content packs.. 
