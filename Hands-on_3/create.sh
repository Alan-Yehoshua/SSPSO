#/bin/bash

echo "Hola Mundo" > mytext

echo "El contenido de mytext es: "
cat mytext

echo "Creando carpeta"
mkdir backup

echo "Mover mytext a backup"
mv mytext backup/

echo "Listando contenido de backup: "
ls backup

rm backup/mytext

rmdir backup
