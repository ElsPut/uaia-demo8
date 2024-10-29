resource mysa 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: saname
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  } 
}

@allowed([
  'WestEurope'
  'NorthEurope'
])
param location string = 'WestEurope'

var saname = 'sa${uniqueString(resourceGroup().id)}'

resource myip 'Microsoft.Network/publicIPAddresses@2024-01-01' = {
  name: 'pip1'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  location: location
}
