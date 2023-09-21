# cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay
**CMS’ ISPG (Information Security and Privacy Group) decided to discontinue funding the customization of MITRE’s Security Automation Framework (SAF) for CMS after September 2023. This repo is now in archive mode, but still accessible. For more information about SAF with current links, see https://security.cms.gov/learn/security-automation-framework-saf**

InSpec profile overlay to validate the secure configuration of Oracle Java Runtime Environment (JRE) 8 on UNIX against [DISA's](https://iase.disa.mil/stigs/Pages/index.aspx) Oracle JRE 8 UNIX STIG Version 1 Release 3 tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html) for CMS systems categorized as Moderate.

#### Container-Ready: Profile updated to adapt checks when the running against a containerized instance of JRE8, based on reference container: (docker pull registry1.dso.mil/ironbank/opensource/gradle/gradle-jre8@latest)

## Getting Started  

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

The latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment
The following inputs must be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
# Set to true if this system is on the SIPRNET
is_on_siprnet: false

# Java version allowed (e.g.: '1.8.0_212')
java_version: <latest_version>

# Java deployment.config file (change to actual path)
deployment_config_file: '/etc/.java/deployment/deployment.config'

# Java deployment.properties file (change to actual path)
deployment_properties_file: '/etc/.java/deployment/deployment.properties'

# Java deployment/exception.sites file (change to actual path)
deployment_exception_sites_file: '/etc/.java/deployment/exception.sites'
```

## Running This Overlay Directly from Github

Against a _**locally-hosted**_ instance (i.e., InSpec installed on the target)
```
inspec exec https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay/archive/master.tar.gz --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json>
```
Against a _**docker-containerized**_ instance (i.e., InSpec installed on the node hosting the container):
```bash
inspec exec https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay/archive/master.tar.gz -t docker://instance_id --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json> 
```

### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy 

If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.)

When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay.git
inspec archive cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay
inspec exec <name of generated archive> --target=ssh://<your_target_host_name_or_ip_address> --user=<target_account_with_administrative_privileges> --password=<password_for_target_account> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay
git pull
cd ..
inspec archive cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay --overwrite
inspec exec <name of generated archive> --target=ssh://<your_target_host_name_or_ip_address> --user=<target_account_with_administrative_privileges> --password=<password_for_target_account> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors
* Eugene Aronne - [ejaronne](https://github.com/ejaronne)
* Danny Haynes - [djhaynes](https://github.com/djhaynes)

## Special Thanks
* Aaron Lippold, MITRE - [aaronlippold](https://github.com/aaronlippold)
* Alicia Sturtevant - [asturtevant](https://github.com/asturtevant)
* Shivani Karikar - [karikarshivani](https://github.com/karikarshivani)


## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/CMSgov/cms-ars-3.1-moderate-oracle-java-runtime-environment-8-unix-stig-overlay/issues/new).

### NOTICE

© 2018-2020 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

### NOTICE 

MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.

### NOTICE 

DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx
