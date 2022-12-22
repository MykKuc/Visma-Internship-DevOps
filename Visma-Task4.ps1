Write-Output "Beginning of the script."
$specify_directory_text = 'Please specify the directory in which YAML files will be searched. '
Write-Output ($specify_directory_text)
$specified_directory = Read-Host -Prompt 'Directory '
Write-Output "Your specified directory is '$specified_directory'"
$yaml_files_in_directory = Get-ChildItem -Path $specified_directory -Include *.yml, *.yaml -Recurse

foreach ($file in $yaml_files_in_directory){
    Add-Content -Path $file -Value "#Hello World"
    Write-Output "Added Hello World to '$file'"
}

Write-Output "End of the Script."


