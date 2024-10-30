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

To deploy the resources [az deployment sub create](https://learn.microsoft.com/en-us/cli/azure/deployment/sub?view=azure-cli-latest#az-deployment-sub-create) can be used:

```
az deployment sub create \
    --location 'northeurope' \
    --template-file 'bicep/main.bicep' \
    --parameters 'bicep/main.bicepparam'
```

### Application Configuration

The application code can be deployed to Azure App Service manually via the Deployment Center:
- Set `Source` to `External Git`.
- Provide repository [Record Store Application](https://github.com/MaryKroustali/record_store_app) details.

### Database Configuration

To manually import data from the repository's [chinook.sql](https://github.com/MaryKroustali/record_store_app/blob/main/SQL/chinook.sql) file to the newly created SQL database:

- Get the `sql` file by cloning the repository:
```
git clone https://github.com/MaryKroustali/record_store_app.git
```
- Navigate in the file's location and run below command with `{db_username}` and `{db_password}` as defined in [main.bicepparam](bicep/main.bicepparam)
```
sqlcmd -S sql-record-store.database.windows.net -i chinook.sql -d chinook -U {db_username} -P {db_password}
```

## Next Steps
[app_on_azure_cicd](app_on_azure_cicd): Automating the deployment and configuration of the Record Store application using Github Actions.
