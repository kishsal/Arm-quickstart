$projectName = Read-Host -Prompt "Enter a project name with 12 or less letters or numbers that is used to generate Azure resource names"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$adminUserName = Read-Host -Prompt "Enter the virtual machine administrator account name"
$adminPassword = Read-Host -Prompt "Enter the virtual machine administrator password" -AsSecureString
$dnsLabelPrefix = Read-Host -Prompt "Enter the DNS label prefix (i.e. myapp)"

$resourceGroupName = "${projectName}-rg"
$templateUri = "https://raw.githubusercontent.com/kishsal/Arm-quickstart/main/Microsoft.Compute/vm-simple-windows/azuredeploy.json"

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri $templateUri -projectName $projectName -location $location -dnsLabelPrefix $dnsLabelPrefix -adminUsername $adminUsername -adminPassword $adminPassword -Verbose

Write-Host "Press [ENTER] to continue."