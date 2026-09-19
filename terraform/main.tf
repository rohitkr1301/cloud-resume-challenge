resource "azurerm_resource_group" "cloudresume" {
  name = "rg-cloudresume-dev-aueast"
  location = "Australia East"
}

resource "azurerm_storage_account" "cloudresumestorage" {
  resource_group_name = "rg-cloudresume-dev-aueast"
  name = "stcloudresumedev001"
  location = "Australia East"
  account_replication_type = "LRS"
  account_tier = "Standard" 
  default_to_oauth_authentication  = true
  shared_access_key_enabled = false

  custom_domain {
    name = "resume.rohitkumar.design"
    use_subdomain = false
  }

  tags = { 
      Environment = "Dev" 
      ManagedBy = "Azure Portal" 
      Owner = "Rohit" 
      Project = "Cloud Resume Challenge" 
      "Purpose "  = "Static Website" 
    }
  
}

resource "azurerm_storage_account_static_website" "cloudresumestaticwebsite" {
  storage_account_id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stcloudresumedev001"
  index_document = "index.html"
  error_404_document = "404.html"
}

resource "azurerm_storage_account" "functionappstorage" {
  name = "stfunccloudresumedev001"
  location = "Australia East"
  resource_group_name = azurerm_resource_group.cloudresume.name
  account_replication_type = "LRS"
  account_tier = "Standard"
  default_to_oauth_authentication  = true
  shared_access_key_enabled = false
}

resource "azurerm_user_assigned_identity" "managedidentity" {
  resource_group_name = azurerm_resource_group.cloudresume.name
  location = "Australia East"
  name = "func-cloudresume-dev-uami"
}

resource "azurerm_service_plan" "functionappserviceplan" {
  resource_group_name = azurerm_resource_group.cloudresume.name
  sku_name = "FC1"
  location = "Australia East"
  os_type = "Linux"
  name = "ASP-rgcloudresumedevaueast-96c2"  
}

resource "azurerm_function_app_flex_consumption" "functionapp" {
  service_plan_id = azurerm_service_plan.functionappserviceplan.id
  storage_container_type = "blobContainer"
  resource_group_name = azurerm_resource_group.cloudresume.name
  location = "Australia East"
  runtime_version = "3.12"
  name = "func-cloudresume-dev"
  storage_authentication_type ="UserAssignedIdentity"
  runtime_name = "python"
  storage_container_endpoint = "https://stfunccloudresumedev001.blob.core.windows.net/stfunccloudresumedev001"
  https_only                                     = true
  client_certificate_mode                        = "Required"
  instance_memory_in_mb                          = 512
  maximum_instance_count                         = 100
  webdeploy_publish_basic_authentication_enabled = false

  storage_user_assigned_identity_id = azurerm_user_assigned_identity.managedidentity.id

  identity {
    type = "UserAssigned"
  
    identity_ids = [
      azurerm_user_assigned_identity.managedidentity.id
    ]
  }

  site_config {
    cors {
      allowed_origins = [
        "https://portal.azure.com"
      ]
  
      support_credentials = false
    }
  }
  
  lifecycle {
    ignore_changes = [
      app_settings
      
    ]
  }
  }

resource "azurerm_cosmosdb_account" "cosmosdb" {
  name = "cosmosdb-cloudresume-dev"
  automatic_failover_enabled               = true
  geo_location {
    failover_priority = 0
    location = "australiasoutheast"
  }
  consistency_policy {
    consistency_level = "Session"
  }
  location = "Australia Southeast"
  resource_group_name = azurerm_resource_group.cloudresume.name
  offer_type = "Standard"

  tags = {

    "Environment"             = "Dev" 
    "Owner"                   = "Rohit" 
    "Project "                = "Cloud Resume" 
    "defaultExperience"       = "Core (SQL)" 
    "hidden-cosmos-mmspecial" = ""
    "hidden-workload-type"    = "Learning"
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdatabase" {
  name = "cloudresume-db"
  account_name = azurerm_cosmosdb_account.cosmosdb.name
  resource_group_name = azurerm_resource_group.cloudresume.name
  
}
  
resource "azurerm_cosmosdb_sql_container" "cosmosdbcontainer" {
  name = "visitors"
  resource_group_name = azurerm_resource_group.cloudresume.name
  account_name = azurerm_cosmosdb_account.cosmosdb.name
  database_name = azurerm_cosmosdb_sql_database.cosmosdatabase.name
  partition_key_version = 2
  partition_key_paths = ["/id"]
}

resource "azurerm_role_assignment" "containercontributer" {
  principal_id = "4daaca00-bad7-4852-8f99-32a9a33a29b2"
  scope = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourcegroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001/blobServices/default/containers/stfunccloudresumedev001"
  role_definition_name = "Storage Blob Data Contributor"
}

resource "azurerm_role_assignment" "storageowner" {
  principal_id = "4daaca00-bad7-4852-8f99-32a9a33a29b2"
  scope = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourcegroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001"
  role_definition_name = "Storage Blob Data Owner"
}

resource "azurerm_storage_container" "functionstoragecontainer" {
  name = "stfunccloudresumedev001"
  storage_account_id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001"
}