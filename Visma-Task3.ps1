Write-Output "Starting the script"
Set-Location D:\Sources
$repository_location = Get-ChildItem 

foreach($object in $repository_location){
    Write-Output $object
    if(Test-Path -Path $object -PathType Leaf){
        Write-Output "This is not a directory. This is just a file. Aborting."
    } else {
        #Check if the directorys have .git folder inside to be considered GitHub repositories.
        Set-Location .\$object
        $current_location = Get-Location
        Write-Output "The current location is '$current_location'"

        if(Test-Path -Path $current_location\.git){
            Write-Output "This is a GitHub Repository. Proceeding to pulling the current branch."
            $branch = &git rev-parse --abbrev-ref HEAD 
            Write-Output "The current checked out branch is '$branch'. Pulling the branch."
            git pull origin $branch
        } else {
            Write-Output ".git folder does not exist. This is not a GitHub Repository."
        }

        Set-Location ..
    }
}

Write-Output "End of the script."
