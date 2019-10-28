function Get-LAPS {
    # Retrieve LAPS password from Active Directory Machine Object
    param(
    [parameter(Mandatory=$true)]
    [string]
    $computer
    )
    Write-Host "Enter Admin Credentials"
    $results = get-adcomputer -Credential (Get-Credential) $computer -Properties * | Select-Object @{Label="Password";Expression={$_.'ms-Mcs-AdmPwd'}}, 
    @{Label="Expiration";Expression={[datetime]::FromFileTime($_.'ms-Mcs-AdmPwdExpirationTime')}}
    $results
}