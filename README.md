# Linode bash API for CoreOS deployment 

With this work you can easily deploy [CoreOS](https://coreos.com/) on [Linode](https://www.linode.com/) infrastructure. CoreOS is so far not available on Linode - with this script you can easily and quickly deploy CoreOS with your own cloud-config.

## Installation (with Docker)

```
docker pull million12/linode-coreos-api
```

Then simply run:  
`docker run --rm -t --env=GITHUB_KEY=$GITHUB_KEY --env=LINODE_KEY=$LINODE_KEY million12/linode-coreos-api`

To make it even easier, add an alias to your `.bashrc`, `.bash_profile` or `.profile` file:
``` bash
export GITHUB_KEY=yourkey  
export LINODE_KEY=yourkey
alias linode='docker run --rm -t --env=GITHUB_KEY=$GITHUB_KEY --env=LINODE_KEY=$LINODE_KEY million12/linode-coreos-api'
```

With this you can run simply `linode --help` or `linode --list_plans`. The Docker image has `ENTRYPOINT` set to `linode` script, therefore any extra param will be passed directly to `linode` script. 

## Installation (manual)

You will need to have few programs installed on your machine to be able to use this api. The list contains:  
* `curl`
* `pwgen`
* `sudo`
* `jq`
* `sshpass`  
    Mac Users install:  
    `brew install https://raw.github.com/eugeneoden/homebrew/eca9de1/Library/Formula/sshpass.rb`

You can install all above using `yum install NAME` (RHEL) or `apt-get install NAME` (Fedora, Debian, Ubuntu) or `brew install NAME` (OSX).

Once you have them all, run `./linode`. It will download required LinodeAPI macros. You can also symlink `linode` to your PATH to make it easily available everywhere.

## Environment variables
You need environmental variables with keys for Linode API access and GitHub for accessing your cloud-config file (which might be inside a private repository). Note: in the future we would like  See Linode/GitHub documentation.  
[Linode API Key documentation](https://www.linode.com/api)  
[GitHub API Key documentation](https://developer.github.com/v3/oauth_authorizations/)  

Variables:  
`GITHUB_KEY=yourkey`  
`LINODE_KEY=yourkey`

you can easily export them by running in shell:  
`export GITHUB_KEY=yourkey`  
`export LINODE_KEY=yourkey`

## Usage
When program is installed you can run it from terminal by typoing `linode`. For all available options type `--help` or `-h`.  

Options:  

| Command | Details | Importance |
|:--------|---------|:----------:|
|`--node-name`|Name for your node | **Required** |
|`--node-plan`|Plan of your choice. If not provided system will show you all available options. | **Required** |
|`--datacenter`|Datacenter in which your node should be deployed. If not provided system will show you all available options. | **Required** |
|`--cloud-config`|***Content*** of the user-data config. You can provide it using this trick:<br />`--cloud-config="$(< path/to/your/cloud-config.yaml)` | **Required** |
|`--token`|ETCD Token Key for fleet deployment. If not provided program will generate one. |**Optional**|  

Quick lists:  

| Command | Details |
|---------|---------|
|`--list_plans`|List all available plans|
|`--list_datacenters`|List all available datacenters|  

### Examples 
Deploy node with `cloud-config.yaml` config:  
`./linode --node-name=test1 --node-plan=2 --datacenter=3 --cloud-config="$(< path/to/cloud-config.yaml)"`


# Author(s)

Author: Przemyslaw Ozgo (<linux@ozgo.info>)  
Note: this work is strongly influenced by [rwky/Linode-Bash-API](https://github.com/rwky/Linode-Bash-API).

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
