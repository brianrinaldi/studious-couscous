# Deployment

Prerequisites:
* Install terraform https://learn.hashicorp.com/terraform/getting-started/install.html
* Install gcloud https://cloud.google.com/sdk/install

1. Create GCP project and enable APIs required by terraform

```
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable sqladmin.googleapis.com
```
2. Update variables.tf and add values for variables below "REQUIRED" comment
3. Deploy app via terraform
```
terraform init
terraform plan
terraform apply
```
