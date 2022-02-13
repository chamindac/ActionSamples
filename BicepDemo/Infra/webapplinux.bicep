param webappName string
param planId string
param linuxFxVersion string


resource webapplinux 'Microsoft.Web/sites@2018-11-01' = {
  name: webappName
  location: resourceGroup().location
  
  identity:{
    type:'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig:{
      linuxFxVersion:linuxFxVersion
    }
  }
}

output servicePrincipalId string = webapplinux.identity.principalId
