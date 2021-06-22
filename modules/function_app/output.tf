output "defaultHostName" {
    value = "${azurerm_function_app.fn.default_hostname}"
}