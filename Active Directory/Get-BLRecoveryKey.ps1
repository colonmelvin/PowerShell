function Get-BLRecoveryKey {
    # Obtain Bitlocker recovery key from Active Directory
    param(
    [Parameter(Mandatory=$true)]
    [string]
    $computer
    )
    $adobject = get-adcomputer  -Filter "Name -like '*$computer*'" 
    $key = get-ADObject -Credential (Get-Credential) -ldapfilter "(msFVE-Recoverypassword=*)" -Searchbase $adobject.distinguishedname -properties msfve-recoverypassword |
    Select-Object @{Label="Recovery Key";Express={$_.'msfve-recoverypassword'}}
    $key
}