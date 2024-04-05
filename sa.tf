# Définition d'un identifiant aléatoire
resource "random_id" "random_id" {
  keepers = {
    resource_group = azurerm_resource_group.main.name
  }
  byte_length = 8
}

# Définition d'un compte de stockage Azure
resource "azurerm_storage_account" "main" {
  name                     = "diag${random_id.random_id.hex}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
root@TP3-Serveur:/home/azureuser/mon_projet_TP3# cat version.tf
terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
root@TP3-Serveur:/home/azureuser/mon_projet_TP3# cat sa.tf
# Définition d'un identifiant aléatoire
resource "random_id" "random_id" {
  keepers = {
    resource_group = azurerm_resource_group.main.name
  }
  byte_length = 8
}

# Définition d'un compte de stockage Azure
resource "azurerm_storage_account" "main" {
  name                     = "diag${random_id.random_id.hex}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
