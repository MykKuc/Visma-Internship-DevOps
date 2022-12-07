Write-Output "Start of the script."

Install-Module -Name SqlServer

$server_name = Read-Host "Please enter the name of the server Instance"

$DB = Invoke-SqlCmd -ServerInstance $server_name -Database master -Query "SELECT [name] AS [Database] FROM sys.databases  ORDER BY 1 DESC;"
$Query = "SELECT * FROM Products"

$DB | ForEach-Object{
             $DB = $_.Database;
             Invoke-Sqlcmd -ServerInstance $server_name -Database $DB -Query $Query
}
  
Write-Output "-----End of the script."
