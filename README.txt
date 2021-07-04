
<h1>Drupal for Test</h1>

 * Drupal: 8
 * PHP: 7.4
 * MariaDB: latest
 * Traefik: v2.4

### Install ###

##1) Changing your hosts file (MANDATORY)##
You need to go to your **/etc/hosts** <br/>
(Using Administrator Account)

MAC/LINUX: /etc/hosts <br/>
Windows: Windows\System32\Drivers\etc\hosts

ADD the line below:
```
#CraftCMS Test
127.0.0.1 local.craftcmstest.com
```

##2) Execute Bash:##
```bash
./install.sh dev
```