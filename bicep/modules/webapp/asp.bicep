@description('Resource Name.')
param asp_name string

@description('Resource Location.')
param asp_location string = resourceGroup().location

@description('For Windows app service plan `false`, `true` for Linux.')
param asp_reserved bool

@description('Name of the SKU capability.')
param asp_sku string

resource app_service_plan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: asp_name
  location: asp_location
  properties: {
    reserved: asp_reserved
  }
  sku: {
    name: asp_sku
  }
}

output id string = app_service_plan.id
