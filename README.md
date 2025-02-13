certbot-dns-powerdns
============

PowerDNS DNS Authenticator plugin for [Certbot](https://certbot.eff.org/).

Compatibility:
* PowerDNS Authoritative Server API
* PowerDNS-Admin API

This plugin is built from the ground up and follows the development style and life-cycle
of other `certbot-dns-*` plugins found in the
[Official Certbot Repository](https://github.com/certbot/certbot).

Installation
------------

```
pip install --upgrade certbot
pip install certbot-dns-powerdns
```

Verify:

```
$ certbot plugins --text

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
* certbot-dns-powerdns:dns-powerdns
Description: Obtain certificates using a DNS TXT record (if you are using
PowerDNS for DNS.)
Interfaces: IAuthenticator, IPlugin
Entry point: dns-powerdns = certbot_dns_powerdns.dns_powerdns:Authenticator

...
...
```

Configuration
-------------

The credentials file e.g. `~/pdns-credentials.ini` should look like this:

```
dns_powerdns_api_url = https://api.mypowerdns.example.org
dns_powerdns_api_key = AbCbASsd!@34
```

Usage
-----


```
certbot ... \
        --authenticator dns-powerdns  \
        --dns-powerdns-credentials ~/pdns-credentials.ini \
        certonly
```

FAQ
-----

##### Why such long name for a plugin?

This follows the upstream nomenclature: `certbot-dns-<dns-provider>`.

Releasing
---------

Releases are published automatically when a tag is pushed to GitHub.

```bash

   # Set next version number
   export RELEASE=x.x.x

   # Create tags
   git commit --allow-empty -m "Release $RELEASE"
   git tag -a $RELEASE -m "Version $RELEASE"

   # Push
   git push origin --tags

```

Docker
------

Build a docker-image based on the official certbot-image

```bash

python3 -m build
docker build . -t certbot/certbot-powerdns

```

Development
-----------

Create a virtualenv, install the plugin (`editable` mode),
spawn the environment and run the test:

```
virtualenv -p python3 .venv
. .venv/bin/activate
pip install -e .
docker-compose up -d
./test/run_certonly.sh test/pdns-credentials.ini
```

License
--------

Copyright (c) 2019 [DT Pan-Net s.r.o](https://github.com/pan-net-security)
