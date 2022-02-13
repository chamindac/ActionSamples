targetScope='subscription'
param rgName string = 'rg-chbicepdemo-001'
param rgLocation string = 'eastus'

param planName string = 'plan-bicepdemo-001'
param planSKUName string = 'B3'
param planSKUCapacity int = 1
param planKind string = 'linux'

param webappName string = 'app-bicepdemo-001'
param linuxFxVersion string = 'node|14-lts'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: rgLocation
  tags:{
    'tag': 'bicepdemo'   
  }
}

module webappplan 'pricingplan.bicep' = {
  name: 'plan'
  scope:rg
  params:{
    planKind:planKind
    planName:planName
    planSKUCapacity:planSKUCapacity
    planSKUName:planSKUName
  }
}

module webapp 'webapplinux.bicep' = {
  name: 'webapp'
  scope:rg
  params:{
    linuxFxVersion:linuxFxVersion
    planId:webappplan.outputs.planId
    webappName:webappName
  }
}
