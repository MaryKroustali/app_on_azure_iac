## App on Azure using Infrastructure as Code
This repository configures [Record Store Application](https://github.com/MaryKroustali/record_store_app) for deployment on Azure App Services. It leverages IaC to set up and manage App Service and SQL database.

### Bicep



### Deployment

To target the deployment to resource group scope, use [az deployment group create](https://learn.microsoft.com/en-us/cli/azure/deployment/group?view=azure-cli-latest#az-deployment-group-create):

```
az deployment group create \
    --resource-group 'rg-record-store' \
    --template-file 'bicep/main.bicep' \
    --parameters 'bicep/main.bicepparam'
```