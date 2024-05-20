$config = Get-Content -Raw "$($PSScriptRoot)\config\clipotp.json" | ConvertFrom-Json

$vault_name = $config.vault_name
$item_id = $config.vault_item_id
# $Env:OP_SERVICE_ACCOUNT_TOKEN = ""

$otpcode = op item get $item_id --vault $vault_name --otp
Set-Clipboard $otpcode
$bodyText = 'OTP saved to clipboard.'

$ToastText01 = [Windows.UI.Notifications.ToastTemplateType, Windows.UI.Notifications, ContentType = WindowsRuntime]::ToastText01
$TemplateContent = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]::GetTemplateContent($ToastText01)
$TemplateContent.SelectSingleNode('//text[@id="1"]').InnerText = $bodyText
$AppId = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($AppId).Show($TemplateContent)