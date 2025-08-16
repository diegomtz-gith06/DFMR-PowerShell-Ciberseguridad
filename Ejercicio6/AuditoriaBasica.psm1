#$env:PSModulePath checar que es
function Get-UsuariosInactivos{
    <#
       .SYNOPSIS
       Obtiene usuarios locales habilitados que nunca han iniciado sesion

       .DESCRIPTION
       Esta funcion busca cuentas locales habilitadas que no tienen fecha de ultimo inicio de sesion.

       .EXAMPLE
       Obtener-UsuariosInactivos

       .NOTES
       Puede ayudar a detectar cuentas innecesarias o riesgosas en auditorias basicas.
    #>
    Get-LocalUser | Where-Object {$_.Enabled -eq $true -and -not $_.LastLogon}

}


function Get-ServiciosExternos {
    <#
    .SYNOPSIS
    Obtiene servicios en ejecucion que no pertenecen explicitamente a windows.

    .DESCRIPTION
    Filtra servicios activos cuyo nombre descriptivo no contiene el termino "Windows"

    .EXAMPLE
    Obtener-ServiciosExternos

    .NOTES
    Util para detectar software de terceros corriendo en segundo plano.
    #>

    Get-Service | Where-Object {$_.Status -eq "Running" -and $_.DisplayName -notmatch "Windows"}
    #Export-ModuleMember -Function Get-UsuariosInactivos, Get-ServiciosExternos

}