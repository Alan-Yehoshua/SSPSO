@echo off
:: Crear archivo mytext.txt con "Hola Mundo"
echo Hola Mundo > mytext.txt
echo Archivo mytext.txt creado con la cadena "Hola Mundo".
echo.

:: Mostrar el contenido del archivo mytext.txt
echo Mostrando el contenido de mytext.txt:
type mytext.txt
echo.

:: Crear el subdirectorio backup
echo Creando el subdirectorio backup...
mkdir backup
echo.

:: Copiar mytext.txt al subdirectorio backup
echo Copiando mytext.txt al subdirectorio backup...
copy mytext.txt backup
echo.

:: Listar el contenido del subdirectorio backup
echo Listando el contenido del subdirectorio backup:
dir backup
echo.

:: Eliminar el archivo mytext.txt del subdirectorio backup
echo Eliminando mytext.txt del subdirectorio backup...
del backup\mytext.txt
echo.

:: Eliminar el subdirectorio backup
echo Eliminando el subdirectorio backup...
rmdir backup