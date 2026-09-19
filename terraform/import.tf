import {
    to = azurerm_resource_group.cloudresume
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast"
}

import {
    to = azurerm_storage_account.cloudresumestorage
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stcloudresumedev001"
}

import{
    to = azurerm_storage_account_static_website.cloudresumestaticwebsite
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stcloudresumedev001"
}

import {
    to = azurerm_storage_account.functionappstorage
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001"
    
}

import {
    to = azurerm_user_assigned_identity.managedidentity
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.ManagedIdentity/userAssignedIdentities/func-cloudresume-dev-uami"
}

import {
    to = azurerm_service_plan.functionappserviceplan
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Web/serverFarms/ASP-rgcloudresumedevaueast-96c2"
}

import {
    to = azurerm_function_app_flex_consumption.functionapp
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Web/sites/func-cloudresume-dev"
}

import {
    to = azurerm_cosmosdb_account.cosmosdb
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.DocumentDB/databaseAccounts/cosmosdb-cloudresume-dev"
}

import {
    to = azurerm_cosmosdb_sql_database.cosmosdatabase
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.DocumentDB/databaseAccounts/cosmosdb-cloudresume-dev/sqlDatabases/cloudresume-db"
}

import {
    to = azurerm_cosmosdb_sql_container.cosmosdbcontainer
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.DocumentDB/databaseAccounts/cosmosdb-cloudresume-dev/sqlDatabases/cloudresume-db/containers/visitors"
}

import {
    to = azurerm_role_assignment.containercontributer
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourcegroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001/blobServices/default/containers/stfunccloudresumedev001/providers/Microsoft.Authorization/roleAssignments/eef345c5-6368-5ef1-a26f-096ae041dda0"
}

import {
    to = azurerm_role_assignment.storageowner
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourcegroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001/providers/Microsoft.Authorization/roleAssignments/741034bf-80d8-58f6-89d0-977f6bba198f"
}

import {
    to = azurerm_storage_container.functionstoragecontainer
    id = "/subscriptions/65712c44-7443-442b-a825-e12cdd55af9f/resourceGroups/rg-cloudresume-dev-aueast/providers/Microsoft.Storage/storageAccounts/stfunccloudresumedev001/blobServices/default/containers/stfunccloudresumedev001"
}