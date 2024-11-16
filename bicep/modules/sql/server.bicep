@description('Resource Name.')
param sql_server_name string

@description('Resource Location.')
param sql_server_location string = resourceGroup().location

@description('The administrator login username for the server.')
param sql_server_admin_username string

@description('The administrator login password for the server.')
@secure()
param sql_server_admin_password string

resource sql_server 'Microsoft.Sql/servers@2023-08-01-preview' = {
  name: sql_server_name
  location: sql_server_location
  properties: {
    administratorLogin: sql_server_admin_username
    administratorLoginPassword: sql_server_admin_password
  }
}

// Enable public access for SQL Server
resource symbolicname 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = {
  name: 'allow_all_inbound'
  parent: sql_server
  properties: {
    endIpAddress: '255.255.255.255'
    startIpAddress: '0.0.0.0'
  }
}

output name string = sql_server.name
