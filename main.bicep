resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'ata2021_bicep'
  location: 'uksouth'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}