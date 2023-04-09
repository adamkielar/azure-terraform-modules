name     = "openai"
location = "East US"
kind     = "OpenAI"
sku      = "S0"
deployments = [
  {
    name : "chatgpt"
    model : {
      format : "OpenAI"
      name : "gpt-4"
      version : "0314"
    }
    scaleSettings : {
      scaleType : "Standard"
    }
  }
]