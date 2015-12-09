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
KEYPAIR_NAME=[your keypair name]
SECURITY_GROUPS=[your security_groups]
HOSTNAME=[your hostname of instance]
```

If you want to change the region, you should change the region, the ami (base image), and maybe also `ssh.username`.

```ruby
# ...

Vagrant.configure("2") do |config|
  config.vm.provider :aws do |aws, override|

    # ...

    aws.ami = "ami-936d9d93"  # Should be changed
    override.ssh.username = "ubuntu" # Should be changed
    aws.region = "ap-northeast-1" # Should be changed

    # ...

  end

  # ...

end

# ...
```

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

### Destroy the instance

```sh
$ vagrant destroy -f
```
