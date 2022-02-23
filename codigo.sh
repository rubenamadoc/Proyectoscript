#!/bin/bash
                                
#Variables:

control=0
lorca=1

#Funciones:

menu (){

    echo "*************************"
    echo " 	    Menu           "
    echo "*************************"
    echo "1.-Comprobar la existencia de un usuario"
    echo "2.-Comprobar la existencia del usuario"
    echo "3.-Realizar una copia de seguridad"
    echo "4.-Recuperar una copia de seguridad"
    echo "5.-Comprobar copias existentes"
    echo "6.-Salir"

}

opcion1 (){

    read -p "Introduzca un nombre de usuario:" usuario
	nombre_usuario=$(getent passwd|grep -wi "$usuario"|cut -d: -f1)
        if [ -z "$nombre_usuario" ]
        then
            read -p "El usuario no existe. Se va a disponer a crearlo. ¿Quiere hacerlo?:s/n " respuesta
                if [ $respuesta = s ]
                then
        		adduser $usuario
		else
			echo "Adiós"
			control=1
		fi
	else
		echo "El usuario existe. Puede continuar"
	fi
    lorca=0
}

opcion2 (){
if [ $lorca -eq 1 ]
then
opcion1
fi
comprobar_usuario=$(who|grep -wi "$usuario")
	if [ -n "$comprobar_usuario" ]
		then 
			echo "El usuario está conectado. NO puedo continuar"
			control=1
		else
			echo "El usuario está desconectado. Puede elegir otra opción"
    	fi
}

opcion3 (){
    if [ $lorca -eq 1 ]
    then
    opcion1
    fi
	read -p "Introduce la ruta de destino " destino
	ruta_copia=$(ls $destino)
	if [ -n "$ruta_copia" ]
	then
    		tar -zcvf $destino/$usuario.tar.gz /home/$usuario
   		 cat $destino
	else
		read -p "La ruta introducida no existe. ¿Desea crearla? s/n " answer
		if [ $answer = "s" ]
		then
			mkdir $destino
		fi
	fi

}

opcion4 (){

    if [ $lorca -eq 1 ]
    then
    opcion1
    fi
    read -p "Introduce la ruta abosulta del archivo a resaurar" archivo
    tar -zxvf $archivo -C /
	ls /home/$usuario
}

opcion5 (){
    if [ $lorca -eq 1 ]
    then
    opcion1
    fi
    cat $destino
}

#Bloque principal

clear
while [ $control -eq 0 ]
do
    clear
    menu
    read -p "Introduzca una opción:" opcion
        case $opcion in

            1)
                opcion1
            ;;

            2)   
                opcion2
            ;;

            3)
                opcion3
            ;;

            4)
                opcion4
            ;;

            5)
                opcion5
            ;;

            6)
                clear
                echo "Adiós"    
                exit 0 
                
            ;;

            *)
                echo "Opción incorrecta"
                exit 1 
            ;;
    esac
    read -p "Pulse intro para continuar" intro
done
