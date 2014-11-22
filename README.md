#Linode bash API for CoreOS deployment 
This Linode BASH API is strongly influenced by [rwky/Linode-Bash-API](https://github.com/rwky/Linode-Bash-API) and it's adding possibility to deploy [CoreOS](https://coreos.com/) on [Linode](https://www.linode.com/) infrastructure.  

### Pre-requisites
You will need to have few programs installed on your machie to be able to use this api. List below.  
`curl`  
`pwgen`  
`sshpass`  
`sudo`  
`jq`  

Program will automatically check which programs are missing in your system and tell you to install them. So don't worry if you not sure at the moment if you have them installed. 

### Environmets.
You need evirinmental variables for Linode API access and GitHub for accessing your files that are not accessible to the public. For both please see Linode/GitHub documentation.  
[Linode API Key documentation](https://www.linode.com/api)  
[GitHub API Key documentation](https://developer.github.com/v3/oauth_authorizations/)  

Variables:  
`GITHUB_KEY=yourkey`  
`LINODE_KEY-yourkey`

you can easily export them by running in shell:  
`export GITHUB_KEY=yourkey`  
`export LINODE_KEY-yourkey`

Program will fetch them from your system. 

### Usage
When program is installed you can run it from terminal by typoing `linode`. For all available options type `--help` or `-h`.  

Options:  

| Command | Details | Importance |
|:--------|---------|:----------:|
|`--node_name`|Name for your node | **Required** |
|`--node_plan`|Plan of your choice. If not provided system will show you all available options. | **Required** |
|`--datacenter`|Datacenter in which your node should be deployed. If not provided system will show you all available options. | **Required** |
|`--config_local`|`yaml` config file path from local drive (If not provided, GitHub file need to be provided) | **Semi-Required** |
|`--config_github`|GitHub `yaml` file link.(If not provided `--config_local` need to be provided.). |**Semi-Required**|
|`--token`|ETCD Token Key for fleet deployment. If not provided program will generate one. |**Optional**|  

Quick lists:  

| Command | Details |
|---------|---------|
|`--list_plans`|List all available plans|
|`--list_datacenters`|List all available datacenters|  

### Examples 
Deploy node with your localfile `yaml` config and token for hooking up with already deployed fleet.   

`linode --node_name elasticsearch --node_plan 2 --datacenter 7 --token f0f727cdc75b55aa12de9085d7f444a1 --config_local ~/my_config.yaml`  

Deploy node with GitHub `yaml` config file and no ETCD token. (no fleet will be used in this exapmple)  

`linode --node_name logstash --node_plan 1 --datacenter 7 --config_github https://raw.githubusercontent.com/million12/linodeapi/master/cloud-config.yaml`  



---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.