$users = Get-ChildItem (Join-Path -Path $env:SystemDrive -ChildPath 'Users') -Exclude 'Public', 'ADMINI~*'
if ($null -ne $users) {
    foreach ($user in $users) {
        $progPath = Join-Path -Path $user.FullName -ChildPath "AppData\Local\Microsoft\Teams\Current\Teams.exe" #Here change the app path; Notice that path must start with AppData
        if (Test-Path $progPath) {
            if (-not (Get-NetFirewallApplicationFilter -Program $progPath -ErrorAction SilentlyContinue)) {
                $ruleName = "Teams.exe for user $($user.Name)" #Here change the rule name; Notice that rule name has to be unique
                "UDP", "TCP" | ForEach-Object { New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Profile Any -Program $progPath -Action Allow -Protocol $_ } #Here change -Profile to Private, Public or Domain if you want to update just one Firewall profile
                Clear-Variable ruleName
            }
        }
        Clear-Variable progPath
    }
}