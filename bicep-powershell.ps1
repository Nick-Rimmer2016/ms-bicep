# Method 1 PowerShell
$context = Get-AzSubscription -SubscriptionName 'Pay-As-You-Go'
Set-AzContext $context

Get-AzSubscription

Set-AzDefault -ResourceGroupName ATA
New-AzResourceGroupDeployment -TemplateFile main.bicep -ResourceGroupName ATA

Get-AzResourceGroupDeployment -ResourceGroupName ATA | Format-Table

# Method 2 - Azure CLI
az login
az account set --subscription "Pay-As-You-Go"
az account list --refresh --query "[?contains(name, 'Pay-As-You-Go')].id" --output table
az account set --subscription 19b3488b-1b19-4127-8f27-8cfb2b594615
az configure --defaults group=ATA

az deployment group create --template-file main.bicep