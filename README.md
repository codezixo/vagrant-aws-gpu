# AWS GPU Instance with Vagrant

* Instance Type: g2.2xlarge
* Region: ap-northeast-1
* Base Image: ubuntu 14.04
* Installed Packages: cuda libraries, miniconda, tensorflow (gpu), keras (with tensorflow as backend)

## Prerequisites

* Vagarnt
* vagrant-aws
* vagrant-env
* Private key: `keys/default.pem`

## Setup

Run `bootstrap.sh` to install vagrant and its plugins:

```sh
$ ./bootstrap.sh
```

Make `.env` file:

```
ACCESS_KEY_ID=[your access key id of aws]
SECRET_ACCESS_KEY=[your secret access key of aws]
HOSTNAME=[your hostname of instance]
```

TODO: Setup other settings for aws defined in `Vagrantfile`.

* keypair_name
* region
* security_groups
* tags (name)

## Usage

### Provision only

```sh
$ vagrant up --provision; vagrant halt
```

Or just:

```sh
$ ./provision.sh
```

Use `wait_stopping.sh` to wait until your stopping instance is stopped.

```sh
$ ./wait_stopping.sh ; vagrant up --provision; vagrant halt
```

### Train the autofpop model

Append `.env` file:

```
# ...

GH_TOKEN=[your github token]
BASE_BRANCH=[your base branch to train]
```

Run:

```sh
$ vagrant up; ./train.sh; vagrant halt  # Create or start the instance, train the model and push it, and shutdown the instance
```
