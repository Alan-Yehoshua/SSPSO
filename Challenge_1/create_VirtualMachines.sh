#!/bin/bash

# Verificar si se proporcionaron todos los argumentos necesarios
if [ "$#" -ne 7 ]; then
    echo "Uso: $0 <Nombre_VM> <Tipo_Sistema> <CPUs> <RAM_GB> <VRAM_MB> <Tamaño_Disco_GB> <Nombre_Controlador>"
    exit 1
fi

# Recoger los argumentos
NOMBRE_VM=$1
TIPO_SISTEMA=$2
CPUS=$3
RAM_GB=$4
VRAM_MB=$5
DISCO_GB=$6
CONTROLADOR=$7

# Convertir RAM y disco a los tamaños necesarios (MB y MB respectivamente)
RAM_MB=$((RAM_GB * 1024))
DISCO_MB=$((DISCO_GB * 1024))

# Crear la máquina virtual
echo "Creando máquina virtual $NOMBRE_VM con sistema $TIPO_SISTEMA..."
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_SISTEMA" --register

# Configurar número de CPUs, RAM y VRAM
echo "Configurando CPUs, RAM y VRAM..."
VBoxManage modifyvm "$NOMBRE_VM" --cpus $CPUS --memory $RAM_MB --vram $VRAM_MB

# Crear el disco duro virtual
DISCO_PATH="$HOME/VirtualBox VMs/$NOMBRE_VM/$NOMBRE_VM.vdi"
echo "Creando disco duro virtual de $DISCO_GB GB en $DISCO_PATH..."
VBoxManage createhd --filename "$DISCO_PATH" --size $DISCO_MB --format VDI

# Crear y asociar el controlador SATA al disco duro virtual
echo "Creando y configurando el controlador SATA..."
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR-SATA" --add sata --controller IntelAHCI
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR-SATA" --port 0 --device 0 --type hdd --medium "$DISCO_PATH"

# Crear y asociar el controlador IDE para CD/DVD
echo "Creando y configurando el controlador IDE para CD/DVD..."
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR-IDE" --add ide
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR-IDE" --port 0 --device 0 --type dvddrive --medium emptydrive

# Mostrar la configuración creada hasta el momento
echo "Configuración final de la máquina virtual $NOMBRE_VM:"
VBoxManage showvminfo "$NOMBRE_VM" --details

echo "Máquina virtual $NOMBRE_VM creada y configurada con éxito."
