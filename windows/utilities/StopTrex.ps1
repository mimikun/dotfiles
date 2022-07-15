. C:\Users\dzdzb\TrexPasswordClass.ps1
$MyClass = New-Object MyClass;
$LoginPassword = $MyClass.GetPassword(); 

$LoginUrl = "http://127.0.0.1:4067/login?password=$($LoginPassword)"

$LoginResponse = Invoke-WebRequest $LoginUrl
$SessionId = $LoginResponse.Content | jq -r .sid

$TrexMinerShutdownUrl = "http://127.0.0.1:4067/control?command=shutdown&sid=$($SessionId)"

Invoke-WebRequest $TrexMinerShutdownUrl
