
<a href="https://stackoverflow.com/users/1755598"><img src="https://stackexchange.com/users/flair/1951642.png" width="208" height="58" alt="profile for CodeWizard on Stack Exchange, a network of free, community-driven Q&amp;A sites" title="profile for CodeWizard on Stack Exchange, a network of free, community-driven Q&amp;A sites"></a>
<a href="https://github.com/nirgeier/AnsibleLabs/actions/workflows/000-build-lab-images.yaml"><img src="https://img.shields.io/github/actions/workflow/status/nirgeier/AnsibleLabs/000-build-lab-images.yaml?branch=main&style=flat" style="height: 20px;"></a> ![Visitor Badge](https://visitor-badge.laobi.icu/badge?page_id=nirgeier) [![Linkedin Badge](https://img.shields.io/badge/-nirgeier-blue?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/nirgeier/)](https://www.linkedin.com/in/nirgeier/) [![Gmail Badge](https://img.shields.io/badge/-nirgeier@gmail.com-fcc624?style=plastic&logo=Gmail&logoColor=red&link=mailto:nirgeier@gmail.com)](mailto:nirgeier@gmail.com) [![Outlook Badge](https://img.shields.io/badge/-nirg@codewizard.co.il-fcc624?style=plastic&logo=microsoftoutlook&logoColor=blue&link=mailto:nirg@codewizard.co.il)](mailto:nirg@codewizard.co.il)

---

![](../../resources/images/helm-k8s-lab.png)

---

# Lab 000 - Setup

- In this Lab we will get a bit of background about helm and its use cases.
- In this lab we will install HELM and test it.

---

## Pre-Requirements

Clone the repository and start playing with it

**Option 1:**
  - Linux machine
  - A running Kubernetes cluster

**Option 2:** 

  [![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://console.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/nirgeier/HelmLabs)
  
  - Clicking on the `Open in Google Cloud Shell` button.
  - It will clone the repository into free Cloud instance
  - **<kbd>CTRL</kbd> + click to open in new window** 

**Option 3:** 
  - Open the scenario in [Killercoda](https://killercoda.com/kubernetes/scenario/playground)
  - **<kbd>CTRL</kbd> + click to open in new window** 

---

### Table of Contents

- [Lab 000 - Setup](#lab-000---setup)
  - [Pre-Requirements](#pre-requirements)
    - [Table of Contents](#table-of-contents)
  - [Lab: Introduction to HELM Charts](#lab-introduction-to-helm-charts)
    - [Objectives](#objectives)
    - [What is a HELM Chart?](#what-is-a-helm-chart)
    - [Why should we use HELM Chart?](#why-should-we-use-helm-chart)
    - [Uses of HELM Charts](#uses-of-helm-charts)
    - [Structure of a HELM Chart](#structure-of-a-helm-chart)
  - [Task 01. Installing HELM](#task-01-installing-helm)
  - [Task 02. Verify Installation](#task-02-verify-installation)
  - [Task 03. Create a new chart](#task-03-create-a-new-chart)

---
## Lab: Introduction to HELM Charts

### Objectives

  - Understand the purpose and structure of HELM charts.
  - Create, customize, and deploy a HELM chart.
  - Learn the origin of the name "HELM" and its connection to Kubernetes.

---

### What is a HELM Chart?

  > **HELM**:  
  > - The name continues Kubernetes' nautical theme. *Kubernetes* (κυβερνήτης) is Greek for "helmsman," the person who steers a ship.   
  > 
  > - The name *Kubernetes* was chosen because it was a term that described the role of the system: it would automate the deployment, scaling, and operations of application containers.

  > - **Helm** refers to the steering mechanism, positioning the tool as the "helm" for Kubernetes clusters.
  - **Helm** is a package manager for Kubernetes that uses charts to define, install, and upgrade even the most complex Kubernetes applications.
  - A **HELM chart** is a **packaging format** for `Kubernetes` applications. 
  - A chart is a collection of files that describe a related set of Kubernetes resources.
  -  **HELM chart** contains all the necessary Kubernetes resource definitions (e.g., Deployments, Services, ConfigMaps) along with metadata and configuration templates. 
  
### Why should we use HELM Chart?

  - **Deployment**: Bundle all components into a single package.
  - **Versioning**: Track versions of your application.
  - **Customization**: Parameterize configurations using variables.
  - **Dependency Management**: Include subcharts for complex apps.

### Uses of HELM Charts
  
  - **Standardize Deployments**: Define a repeatable process for deploying apps.
  - **Simplify Complexity**: Manage multi-component applications (e.g., web servers, databases).
  - **Share Applications**: Publish charts to repositories for team or public use.
  - **Rollback Safely**: Revert to previous versions if issues arise.

### Structure of a HELM Chart
  
  - A typical chart directory includes:

  ```yaml
  mychart/
  ├── Chart.yaml        # Metadata (name, version, dependencies)
  ├── charts/           # Subcharts/dependencies
  ├── values.yaml       # Default configuration values
  └── templates/        # Kubernetes manifest templates
    ├── deployment.yaml
    ├── service.yaml
    └── ...
  ```

---

## Task 01. Installing HELM

  - In order to install HELM all we need is to fetch the auto installation script
  - We will use `curl` to download the script and `bash` to execute it.
    
    ```sh
    # Download and install the latest version of Helm
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
    
    # Sample output of "upgrading" and installing the latest version of HELM
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100 11913  100 11913    0     0  11535      0  0:00:01  0:00:01 --:--:-- 11543
  
    Helm v3.17.2 is available. Changing from version v3.13.1.
    Downloading https://get.helm.sh/helm-v3.17.2-darwin-arm64.tar.gz
    Verifying checksum... Done.
    Preparing to install helm into /usr/local/bin
    Password:
    helm installed into /usr/local/bin/helm
    ```

## Task 02. Verify Installation

  - Verify that the installation was successful by running the following command:
  - This command will display the version of Helm that is installed on your system.
    ```sh
    # Verify that the latest version of Helm is installed
    helm version

    ### Output would be something like this:
    version.BuildInfo{Version:"v3.17.2", GitCommit:"cc0bbbd6d6276b83880042c1ecb34087e84d41eb", GitTreeState:"clean", GoVersion:"go1.24.1"}
    ```

## Task 03. Create a new chart

  - Lets create a new chart using the following command:
    ```sh
    # Create a new chart
    helm create mychart

    ### OUtput: 
    Creating mychart

    ### Directory structure:
    ➜ tree mychart 
      mychart
      ├── Chart.yaml
      ├── charts
      ├── templates
      │   ├── NOTES.txt
      │   ├── _helpers.tpl
      │   ├── deployment.yaml
      │   ├── hpa.yaml
      │   ├── ingress.yaml
      │   ├── service.yaml
      │   ├── serviceaccount.yaml
      │   └── tests
      │       └── test-connection.yaml
      └── values.yaml
    ```
