```bash
vagrant up
```

Then on web node, just following official instructions:
* [Install Posgres Node](https://concourse-ci.org/postgresql-node.html)

```bash
sudo apt install postgresql
sudo su postgres -c "createuser concourse"
sudo su postgres -c "createdb --owner=concourse concourse"
```

* [Install CLI](https://concourse-ci.org/concourse-cli.html), at that time, it is [v6.1.0](https://github.com/concourse/concourse/releases/tag/v6.1.0)
```bash
curl -LO https://github.com/concourse/concourse/releases/download/v6.1.0/concourse-6.1.0-linux-amd64.tgz
tar xfz concourse-6.1.0-linux-amd64.tgz
```

* [Generate keys]()
    * On worker node
```bash
cd concourse/bin
./concourse generate-key -t ssh -f ./worker_key
```

    * On web node
```bash
cd concourse/bin
./concourse generate-key -t rsa -f ./session_signing_key
./concourse generate-key -t ssh -f ./tsa_host_key
```

* [Run Web node](https://concourse-ci.org/concourse-web.html)

```bash
./concourse web \
  --add-local-user=admin:secret \
  --main-team-local-user=admin \
  --session-signing-key=./session_signing_key \
  --tsa-host-key=./tsa_host_key \
  --tsa-authorized-keys=./tsa_authorized_keys \
  --postgres-host=localhost \
  --postgres-port=5432 \
  --postgres-user=concourse \
  --postgres-password=concourse \
  --postgres-database=concourse \
  --external-url=192.168.60.0

```