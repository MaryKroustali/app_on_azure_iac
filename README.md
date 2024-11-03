## App on Azure using Infrastructure as Code
This repository configures [Record Store Application](https://github.com/MaryKroustali/record_store_app) for deployment on Azure. It leverages Bicep, an Infrastructure as Code (IaC) language, to set up and manage the infrastructure needed. The main resources include:
- `Azure App Service Plan`: A scalable hosting environment for the application.
- `Azure App Service`: Hosts the ASP.NET MVC Record Store application.
- `Azure SQL Database`: A database service for the application’s data.
- `Azure SQL Server`: A server that hosts the SQL Database.

### Bicep

The Bicep configuration, located in the `bicep/` folder, organizes resource deployment:
- `bicep/modules/`: Separate parameterized Bicep files for each resource type.
- `bicep/main.bicep`: Orchestration file organizing and deploying resources by referencing the modules files.
- `bicep/main.bicepparam`: A parameter file providing values for `main.bicep`.

### Infrastructure Deployment

Use the Azure CLI command below to deploy resources:
```
az deployment sub create \
    --location 'northeurope' \
    --template-file 'bicep/main.bicep' \
    --parameters 'bicep/main.bicepparam'
```

### Application Configuration

To deploy the application code to Azure App Service manually via the Deployment Center:
- Set **Source** to `External Git`.
- Provide repository details for the [Record Store Application](https://github.com/MaryKroustali/record_store_app).

### Database Configuration

To import data from [chinook.sql](https://github.com/MaryKroustali/record_store_app/blob/main/SQL/chinook.sql) to the SQL database:

- Clone the repository.
- Navigate to the file's location and run:
```
sqlcmd -S sql-record-store.database.windows.net -i chinook.sql -d chinook -U {db_username} -P {db_password}
```
Replace `{db_username}` and `{db_password}` with values from [main.bicepparam](bicep/main.bicepparam).

### Application Usage

Using a browser, navigate to [https://app-record-store.azurewebsites.net/](https://app-record-store.azurewebsites.net/), where `app-record-store` is the name of the App Service resource.

## Next Steps
[app_on_azure_cicd](https://github.com/MaryKroustali/app_on_azure_cicd): Automating the deployment and configuration of the Record Store application using Github Actions.
