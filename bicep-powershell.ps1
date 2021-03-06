# Method 1 PowerShell
Connect-AzAccount
New-AzResourceGroupDeployment -TemplateFile main.bicep -ResourceGroupName ATA

Get-AzResourceGroupDeployment -ResourceGroupName ATA 
Remove-AzResource -ResourceName ata2021bicepdiskstorage -ResourceGroupName ATA -ResourceType "Microsoft.Storage/storageAccounts" -WhatIf


# Method 2 - Azure CLI
az login
az account set --subscription "Pay-As-You-Go"
az account list --refresh --query "[?contains(name, 'Pay-As-You-Go')].id" --output table
az account set --subscription
az configure --defaults group=ATA

az deployment group create --resource-group ATA --template-file main.bicep
az resource delete -g ATA -n ata2021bicepdiskstorage  --resource-type "Microsoft.Storage/storageAccounts"
