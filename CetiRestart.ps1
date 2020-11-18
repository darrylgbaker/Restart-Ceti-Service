#################################################################################
# CetiRestart.ps1 v.1                                                           #
#                                                                               #
#  CetiRestart.ps1 is intended to monitor last events and restart Ceti service  #
#  if no events have been logged in 24 hrs.                                     # 
#                                                                               #
#                     WRITTEN BY: Darryl G. Baker, CISSP, CCSP                  #
#                                     for                                       #
#                         ALSID for AD Environments                             #
#################################################################################


Param(

[string]$uri = "",
[string]$key = ""
)

$token = @{'x-api-key'=$key}

While($true){
    $date = Get-Date
    $last = Invoke-RestMethod -Uri ($uri + "/api/events/last") -Method GET -Headers $token
        
        if($last.date -lt ($date.AddHours(-24))){
           Get-Service alsid_Ceti | Restart-Service   
           Start-Sleep -Seconds 86400    
        }
        
 }
 
  