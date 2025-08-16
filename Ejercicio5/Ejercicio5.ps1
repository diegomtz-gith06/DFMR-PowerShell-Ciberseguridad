Clear-Host
function Validar-Archivo{
    param ([string]$Ruta)

    try{
        if (Test-Path $Ruta){
            $contenido = Get-Content $Ruta -ErrorAction Stop
            return "Archivo encontrado y accesible: $Ruta"

        }else{
            throw "El archivo no existe"

        }
    }
    catch{
        return "Error: $_"
    }
    finally{
        Write-Host "Validacion finalizada para: $Ruta" -ForegroundColor Cyan
    }
    
}

#Prueba de la funcion
Validar-Archivo -Ruta "C:\Archivo_inexistente.txt"

#Asegurate de crear un archivo txt con el nombre archivo en el Escritorio
Validar-Archivo -Ruta "$env:USERPROFILE\Escritorio\archivo.txt"

Validar-Archivo -Ruta "C:\Users\diego\OneDrive\Escritorio\archivo.txt"