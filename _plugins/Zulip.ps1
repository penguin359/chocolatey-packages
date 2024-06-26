# Author: Loren M. Lang <lorenl@north-winds.org>
# Last Change: 2023-12-17
<#
.SYNOPSIS
  Publishes the package update status to Zulip.

.PARAMETER WebHookUrl
  This is the custom webhook URL created through Zulip integrations.

.PARAMETER MessageFormat
  The format of the message that is meant to be published on Zulip.
  {0} = The total number of automated packages.
  {1} = The number of updated packages,
  {2} = The number of published packages.
  {3} = The number of failed packages.
  {4} = The URL to the Github gist.
#>
param(
  $Info,
  [string]$WebHookUrl,
  [string]$botEmail = '',
  [string]$botApiKey = '',
  [string]$Type = 'stream',
  [string]$Channel = '',
  [string]$Topic = '',
  [string]$MessageFormat = "[Update Status:{0} packages.`n  {1} updated, {2} Published, {3} Failed]({4})"
)


if (!$WebHookUrl) { return } # If we don't have a webhookurl we can't push status messages, so ignore.

$WebHookUrl = $WebHookURl.TrimEnd('/') + "/api/v1/messages"

$updatedPackages   = @($Info.result.updated).Count
$publishedPackages = @($Info.result.pushed).Count
$failedPackages    = $Info.error_count.total
$gistUrl           = $Info.plugin_results.Gist -split '\n' | Select-Object -Last 1
$packageCount      = $Info.result.all.Length

$zulipMessage     = ($MessageFormat -f $packageCount, $updatedPackages, $publishedPackages, $failedPackages, $gistUrl)

[securestring]$secStringPassword = ConvertTo-SecureString $botApiKey -AsPlainText -Force
[pscredential]$credential = New-Object System.Management.Automation.PSCredential ($botEmail, $secStringPassword)

$request = @{
  type             = $Type
  to               = $Channel
  topic            = $Topic
  content          = $zulipMessage
}

$arguments = @{
  Body             = $request
  UseBasicParsing  = $true
  Uri              = $WebHookUrl
  Credential       = $credential
  ContentType      = 'application/x-www-form-urlencoded'
  Method           = 'Post'
}

"Submitting message to Zulip"
Invoke-RestMethod @arguments
"Message submitted to Zulip"
