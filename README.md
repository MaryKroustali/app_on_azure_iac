## App on Azure using Infrastructure as Code
This repository configures [Record Store Application](https://github.com/MaryKroustali/record_store_app) for deployment on Azure. It leverages Bicep, an Infrastructure as Code (IaC) language, to set up and manage the infrastructure needed. The main resources include:
- `Azure App Service Plan`: A scalable hosting environment for the application.
- `Azure App Service`: Hosts the ASP.NET MVC Record Store application.
- `Azure SQL Database`: A database service for the application’s data.
- `Azure SQL Server`: A server that hosts the SQL Database.

### Bicep

The Bicep configuration is organized within the `bicep/` folder, making resource management easy to maintain.
- `bicep/modules/`: Separate parameterized Bicep files for each resource type.
- `bicep/main.bicep`: Orchestration file organizing and deploying resources by referencing the modules files.
- `bicep/main.bicepparam`: A parameter file providing values for `main.bicep`.

### Infrastructure Deployment

To deploy the resources to resource group scope, use [az deployment group create](https://learn.microsoft.com/en-us/cli/azure/deployment/group?view=azure-cli-latest#az-deployment-group-create):

```
az deployment group create \
    --resource-group 'rg-record-store' \
    --template-file 'bicep/main.bicep' \
    --parameters 'bicep/main.bicepparam'
```

### Application Configuration

### Database Configuration

## Next Steps
[app_on_azure_cicd](app_on_azure_cicd): Automating the deployment and configuration of the Record Store application using Github Actions.
