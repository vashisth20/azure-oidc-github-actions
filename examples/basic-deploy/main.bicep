resource stg 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'oidcdemostorage'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
