param planName string
param planSKUName string
param planSKUCapacity int
param planKind string

resource plan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: planName
  location: resourceGroup().location
  sku: {
    name: planSKUName
    capacity: planSKUCapacity
    
  }
  kind:planKind

  properties: {
    reserved: true
  }
}

output planId string = plan.id
