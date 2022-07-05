
resource "azurerm_application_insights_web_test" "fcs_availability_test" {
  count                   = var.fcs_count
  name                    = "${var.name_prefix}-webtest-${var.webtest_name[count.index]}"
  location                = var.location
  resource_group_name     = var.fcs_resource_group
  application_insights_id = var.application_insight_id
  kind                    = var.kind
  frequency               = var.test_frequency[count.index]
  timeout                 = var.timeout[count.index]
  enabled                 = var.enabled
  retry_enabled           = var.retry_enabled
  geo_locations           = var.locations

configuration = <<XML
<WebTest Name="WebTest${count.index}" Id="ABD48585-0831-40CB-9069-682EA6BB3583" Enabled="True" CssProjectStructure="" CssIteration="" Timeout="${var.timeout[count.index]}" WorkItemIds="" xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" Description="Availability Alerts" CredentialUserName="${var.login}" CredentialPassword="${var.password}" PreAuthenticate="True" Proxy="default" StopOnError="False" RecordedResultFile="" ResultsLocale="">
  <Items>
    <Request Method="GET" Guid="a5f10126-e4cd-570d-961c-cea43999a200" Version="1.1" Url="${var.url[count.index]}" ThinkTime="0" Timeout="${var.timeout[count.index]}"
    ParseDependentRequests="${var.parsedependents[count.index]}" FollowRedirects="True" RecordResult="True" Cache="False" ResponseTimeGoal="0" Encoding="utf-8"
    ExpectedHttpStatusCode="${var.httpcode[count.index]}" ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="False" />
   </Items>
</WebTest>
XML
}

resource "azurerm_monitor_metric_alert" "fcs_avaibl_alert" {
  count               = var.fcs_count
  name                = "${var.name_prefix}-avlalert-${var.webtest_name[count.index]}"
  resource_group_name = var.fcs_resource_group
  scopes              = [azurerm_application_insights_web_test.fcs_availability_test[count.index].id, var.application_insight_id]
  description         = "Availability Alert for ${var.webtest_name[count.index]}"
  application_insights_web_test_location_availability_criteria {
        web_test_id             = azurerm_application_insights_web_test.fcs_availability_test[count.index].id
        component_id            = var.application_insight_id
        failed_location_count   = var.failed_location_count[count.index]
  }

  frequency          = var.frequency[count.index]
  window_size        = var.window_size[count.index]
  severity           = var.severity[count.index]
  / * action {
    action_group_id = data.azurerm_monitor_action_group.fcs_monitor_action_group.id
  }
  */
}
