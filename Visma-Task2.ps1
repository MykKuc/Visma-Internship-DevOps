# GitHub is recommending using Personal Access Token for Authentification.
# This token has to be generated in the GitHub Settings -> Developer Settings -> Personal access tokens

Write-Output "Starting script."
$users_pat = Read-Host "Please enter your Personal Access Token."

$B64Pat = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("`:$users_pat"))


# Authenticating for cloning a new repo.
$entered_value = Read-Host "Please enter 'clone' or 'existing'"

# Authenticating for cloning a new repo.
if ('clone' -eq $entered_value){
    $github_username = Read-Host "Please enter your GitHub Username."
    $github_repository = Read-Host "Please enter your GitHub Repository."
    git -c http.extraHeader="Authorization: Basic $B64Pat" clone https://github.com/$github_username/$github_repository  
}

# Authenticating for existing repo.
if ('existing' -eq $entered_value){
   $git_repository_location = Read-Host "Enter the location of Git repository."
   Set-Location $git_repository_location
   $github_username = Read-Host "Please enter your GitHub Username."
   $github_repository = Read-Host "Please enter your GitHub Repository."
   git remote remove origin
   git remote add origin https://($github_username):$B64Pat@github.com/$github_username/$github_repository
}

Write-Output "End of the script."