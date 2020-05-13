# Started 

## Purpose

This folder presents a quick installation to test a continous integration tools, **Agola**.

In this POC, for testing purpose, we will set up :
* [Agola](https://agola.io/)
* [Gitea](https://gitea.io/), for a testing git repository
* [Traefik](https://containo.us/traefik/), for local reverse proxy

## Run

Open `/etc/hosts` and add the following entries:

```text
127.0.0.1 agola.localdomain gitea.localdomain
```
Then:
```bash
docker-compose up -d
```

## Configure

### Gitea

Just follow gitea instructions when you connect for the first time and only change gitea url to `http://gitea.localdoamin`.
Then create you first account (admin account) and create OAuth application Agolia:

1) Profil --> Configuration --> Applications
2) Add OAuth2 application: `Name=Agola` and `Callback url=http://agola.localdomain/oauth2/callback`

_Note: please note somwhere clientId and clientSecret_

### Agola

After having added Agola application on your Git Server (eg: gitea) 
you can run the following commands:

```bash
docker container exec agola agola --token "admintoken" --gateway-url http://localhost:8000 remotesource create \
--name gitea \
--type gitea \
--api-url http://gitea.localdomain \
--auth-type oauth2 \
--clientid $GITEA_APP_CLIENTID \
--secret $GITEA_APP_CLIENTSECRET \
--skip-ssh-host-key-check
```


## Resources

### Tutorials

* [Agola Getting Started](https://agola.io/tryit/#agola-demo-image)
* [Gitea, Installation with Docker](https://docs.gitea.io/en-us/install-with-docker/)
* [Traefik, docker-compose basic example](https://docs.traefik.io/user-guides/docker-compose/basic-example/)
