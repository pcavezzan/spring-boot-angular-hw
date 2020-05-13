# Install al on your machine using docker-compose

This tutorial will set up everything like it is describe on [Agola Try It](https://agola.io/tryit/) just with using docker-compose.

For that purpose, we will create everything on localhost and export all tools on local port.

## Run

```bash
docker container run --detach --rm --name gitea -p 3000:3000 -p 22:22 gitea/gitea:latest
docker container run --detach --rm --name agolademo \
-v /var/run/docker.sock:/var/run/docker.sock \
-p 8000:8000 \
sorintlab/agolademo \
serve --embedded-etcd --components all-base,executor
```

## Configure

### Gitea

Just follow gitea instructions when you connect for the first time and only change gitea url to `http://gitea.localdoamin`.
Then create you first account (admin account) and create OAuth application Agolia:

1) Profil --> SSH Key --> Add your public key
1) Profil --> Configuration --> Applications
2) Add OAuth2 application: `Name=Agola` and `Callback url=http://172.17.0.1:8000/oauth2/callback`

_Note: please note somwhere clientId and clientSecret_

### Agola

After having added Agola application on your Git Server (eg: gitea) 
you can run the following commands:

```bash
docker container exec agolademo agola --token "admintoken" --gateway-url http://localhost:8000 remotesource create \
--name gitea \
--type gitea \
--api-url http://172.17.0.1:3000 \
--auth-type oauth2 \
--clientid $GITEA_APP_CLIENTID \
--secret $GITEA_APP_CLIENTSECRET \
--skip-ssh-host-key-check
