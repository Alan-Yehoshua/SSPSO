#!/bin/bash

# Función para mostrar el menú
show_menu() {
    echo "===··Menu de Opciones··==="
    echo "1 -> Listar el contenido de una carpeta··"
    echo "2 -> Crear un archivo de texto con una línea de texto··"
    echo "3 -> Comparar dos archivos de texto··"
    echo "4 -> Mostrar el uso del comando awk··"
    echo "5 -> Mostrar el uso del comando grep··"
    echo "6 -> Salir··"
    echo "======================================"
    echo -n "··Seleccione una opcion: "
}

# Opción 1: Listar el contenido de un fichero (carpeta)
listar_contenido() {
    echo -n "Ingrese la ruta exacta  de la carpeta: "
    read ruta_carpeta
    if [ -d "$ruta_carpeta" ]; then
        echo "Contenido de la carpeta $ruta_carpeta:"
        ls "$ruta_carpeta"
    else
        echo "La ruta proporcionada no es una carpeta válida."
    fi
}

# Opción 2: Crear un archivo de texto con una línea de texto
crear_archivo() {
    echo -n "Ingrese la cadena de texto que desea almacenar en el archivo: "
    read texto
    echo -n "Ingrese el nombre del archivo: "
    read archivo
    echo "$texto" > "$archivo"
    echo "El archivo $archivo ha sido creado con éxito."
}

# Opción 3: Comparar dos archivos de texto
comparar_archivos() {
    echo -n "Ingrese la ruta del primer archivo a comparar: "
    read archivo1
    echo -n "Ingrese la ruta del segundo archivo a comparar: "
    read archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
        if [ $? -eq 0 ]; then
            echo "Los archivos son idénticos."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no existen."
    fi
}

# Opción 4: Mostrar el uso básico del comando awk
usar_awk() {
    echo "El comando awk se usa para procesar y analizar archivos de texto."
    echo "Por ejemplo, para mostrar la primera columna de un archivo de texto, use:"
    echo "awk '{print \$1}' nombre_archivo.txt"
}

# Opción 5: Mostrar el uso básico del comando grep
usar_grep() {
    echo "El comando grep se usa para buscar patrones de texto en archivos."
    echo "Por ejemplo, para buscar la palabra 'error' en un archivo de log, use:"
    echo "grep 'error' nombre_archivo.log"
}

# Bucle principal del menú
while true; do
    show_menu
    read opcion
    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) usar_awk ;;
        5) usar_grep ;;
        6) echo "····Saliendo···"; exit 0 ;;
        *) echo "··Opción no válida··" ;;
    esac
    echo ""
done
