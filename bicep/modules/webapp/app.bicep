@description('Resource Name.')
param app_name string

@description('Resource Location.')
param app_location string = resourceGroup().location

@description('Resource ID of the associated App Service plan.')
param app_service_plan_id string

resource app_service 'Microsoft.Web/sites@2023-12-01' = {
  name: app_name
  location: app_location
  properties: {
    serverFarmId: app_service_plan_id
  }
}

output domain string = app_service.properties.defaultHostName
