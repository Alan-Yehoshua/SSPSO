@echo off
echo Hello World
echo.

:: Listar contenido del directorio actual
echo Listando el contenido del directorio actual:
dir
echo.

:: Crear subdirectorio Test
echo Creando el subdirectorio Test...
mkdir Test
echo.

:: Cambiarse al subdirectorio Test
cd Test
echo Cambiado al subdirectorio Test.
echo.

:: Listar contenido del subdirectorio Test
echo Listando el contenido del subdirectorio Test:
dir