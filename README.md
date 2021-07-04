
<h1>Drupal for Test</h1>

 * Drupal: 8
 * PHP: 7.4
 * MariaDB: latest
 * Traefik: v2.4

## Install ##

### 1) Changing your hosts file (MANDATORY) ###
You need to go to your **/etc/hosts** <br/>
(Using Administrator Account)

MAC/LINUX: /etc/hosts <br/>
Windows: Windows\System32\Drivers\etc\hosts

ADD the line below:
```
#Drupal 8 Test
127.0.0.1 local.drupal8test.com
127.0.0.1 local.mariadb.com
```

### 2) Execute Bash: ###
```bash
./install.sh dev
```

### Finished!! :rocket:

![myImage](https://media.giphy.com/media/FACfMgP1N9mlG/giphy.gif)