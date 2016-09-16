Repo Info
=========
Builds a [Docker] mail relay server image using [Postfix] provisioned using [Ansible].  
Based on Alpine Linux.

Usage
-----
```
docker run -d -p 25:25 -e POSTFIX_REWRITE_DOMAIN=example.com \
-e POSTFIX_RELAYHOST=smtp.example.org \
-e POSTFIX_MYNETWORKS="127.0.0.0/8 192.168.0.0/16 172.16.0.0/12 10.0.0.0/8" \
mrlesmithjr/postfix:alpine
```
Variables
---------
`POSTFIX_RELAYHOST` - Define a relay host if required  
`POSTFIX_REWRITE_DOMAIN` - Define your rewrite domain if required  
`POSTFIX_MYNETWORKS=127.0.0.0/8` - Networks to allow relaying from

Notes
-----
It is also possible to use this image as a mail server not functioning as a
mail relay server as well.

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]


[Ansible]: <https://www.ansible.com/>
[Docker]: <https://www.docker.com>
[Postfix]: <http://www.postfix.org/>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
