Clear-Host
Import-Module AuditoriaBasica

Write-Host "=== Auditoria basica de usuarios y servicios==="
Write-Host "1. Mostrar usuarios inactivos"
Write-Host "2.Mostrar servicios externos activos"
$opcion = Read-Host "Selecciona una opcion (1 o 2)"

switch ($opcion){
    "1"{
        $usuarios = Get-UsuariosInactivos
        $usuarios | Format-Table Name,  Enabled, LastLogon -AutoSize
        $usuarios | Export-Csv -Path "C:\Users\diego\OneDrive\Escritorio\users_inac.csv" -NoTypeInformation # "$env:USERPROFILE\Desktop\ussers_inac.csv" -NoTypeInformation
        Write-Host "`n Reporte generado: users_inac.csv"
    }

    "2"{
        $usuarios = Get-ServiciosExternos
        $usuarios | Format-Table DisplayName, Status, StartType -AutoSize
        $usuarios | ConvertTo-Html | Out-File "C:\Users\diego\OneDrive\Escritorio\serv_e.html" #"$env:USERPROFILE\Desktop\serv_e.html"
        Write-Host "`n Reporte generado: serv_e.html"
    }

    default{
        Write-Host "no jala"
    }

}