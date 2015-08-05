# Script to Start||Stop CrashPlanService
param([string]$command)
$crashPlanService = Get-Service CrashPlanService
$timestamp = Get-Date -format u
$errors = @()

if($command -eq "start")
{
  try
  {
    $crashPlanService.Start();
  }
  catch [InvalidOperationException]
  {
    $errors += $_.Exception.ToString();
  }
  finally
  {
    if($errors.Count -gt 0)
    {
      Write-Host "[$($timestamp)] CrashPlanService could not be started.  Current status is $((Get-Service CrashPlanService).Status)" -ForegroundColor Red
    }
    else
    {
      Write-Host "[$($timestamp)] CrashPlanService started" -ForegroundColor Green
    }
  }
}
elseif($command -eq "stop")
{
  try
  {
    $crashPlanService.Stop();
  }
  catch [InvalidOperationException]
  {
    $errors += $_.Exception.ToString();
  }
  finally
  {
    if($errors.Count -gt 0)
    {
      Write-Host "[$($timestamp)] CrashPlanService could not be stopped. Current status is $((Get-Service CrashPlanService).Status)" -ForegroundColor Red
    }
    else
    {
      Write-Host "[$($timestamp)] CrashPlanService stopped" -ForegroundColor Yellow
    }
  }
}
else
{
  Write-Host "[$($timestamp)] Unable to complete request. Exiting" -ForegroundColor Red
}

exit
