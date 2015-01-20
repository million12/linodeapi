# CoreOS deployment on Linode

With this work you can easily deploy [CoreOS](https://coreos.com/) on [Linode](https://www.linode.com/). As for today (Jan 2015) CoreOS is not available on Linode. With this work you can easily and quickly deploy CoreOS with your own cloud-config.

## Installation (with Docker)

This is the recommended - and the simplest, if you already familiar with Docker - way to use this tool. If you have you Docker daemon running, pull the image:
`docker pull million12/linode-coreos-api`

Then simply run:  
`docker run -t --env="LINODE_KEY=$LINODE_KEY" --rm million12/linode-coreos-api`

To make it even easier, add an alias to your `.bash_profile`:  
``` bash
export LINODE_KEY=yourkey
alias linode='docker run -t --env="LINODE_KEY=$LINODE_KEY" --rm million12/linode-coreos-api'
```

With this you can run simply `linode --help` or `linode --list-plans`. The Docker image has `ENTRYPOINT` set to `linode` script, therefore any extra param will be passed directly to `linode` script. 

## Installation (manual, the old way)

You will need to have few programs installed on your machine to be able to use this api. The list contains:  
* `curl`
* `pwgen`
* `sudo`
* `jq`
* `sshpass`  
    Mac Users install:  
    `brew install https://raw.github.com/eugeneoden/homebrew/eca9de1/Library/Formula/sshpass.rb`

You can install all above using `yum install NAME` (RHEL) or `apt-get install NAME` (Fedora, Debian, Ubuntu) or `brew install NAME` (OSX).

Once you have them all, run `./linode`. You can also symlink `linode` tool to your `$PATH` to make it available everywhere.

## Environment variables
You need environmental variables with keys for Linode API access and GitHub for accessing your cloud-config file (which might be inside a private repository). Note: in the future we would like  See Linode/GitHub documentation.  
[Linode API Key documentation](https://www.linode.com/api)  
[GitHub API Key documentation](https://developer.github.com/v3/oauth_authorizations/)  

Variables:  
`LINODE_KEY=yourkey`

You can easily export them by running in shell:  
`export LINODE_KEY=yourkey`

## Usage
When program is installed you can run it from terminal by typoing `linode`. For all available options type `--help` or `-h`.  

Options:  

| Command | Details | Importance |
|:--------|---------|:----------:|
|`--cloud-config`|***Content*** of the user-data config. You must provide it using this trick:<br />`--cloud-config="$(< path/to/your/cloud-config.yaml)` | **Required** |
|`--node-name`|Name for your node | **Required** |
|`--node-plan`|Plan of your choice. If not provided system will show you all available options. | Optional<br />Default: 1<br />(1CPU, 1GB RAM) |
|`--datacenter`|Datacenter in which your node should be deployed. If not provided system will show you all available options. | Optional<br />Default: 2<br />(Dallas, TX) |
|`--token`|ETCD Token Key for fleet deployment. If not provided program will generate one. |Optional|  
|`--swap-disk-size`|Swap size in MB. Set to 0 to disable. Must be an integer value. That will decrease the CoreOS system partition size by provided amount. |Optional<br />Default: 2048|
|`--extra-disk-size`|Extra partition (raw) size in MB to create next to default system partition. Must be an integer value. That will decrease the CoreOS system partition size by provided amount. |Optional<br />Default: 0|

Linode lists:

| Command | Details |
|---------|---------|
|`--list-plans`|List all available plans|
|`--list-datacenters`|List all available datacenters|  

### Examples 
Deploy node with `cloud-config.yaml` config:  
`linode --node-name=test1 --node-plan=1 --datacenter=3 --cloud-config="$(< path/to/cloud-config.yaml)"`


# Author(s)

Author: Przemyslaw Ozgo (<linux@ozgo.info>)  
Note: this work uses Linode API originally developed by [rwky/Linode-Bash-API](https://github.com/rwky/Linode-Bash-API).

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
