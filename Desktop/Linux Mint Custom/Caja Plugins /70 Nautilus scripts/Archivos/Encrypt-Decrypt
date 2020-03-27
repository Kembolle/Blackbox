#!/bin/sh
 #Title=Crypt
 #Title[es]=Cifrar
IFS='
'

cifrar()
{
	# ingresar password
	pass1=$(zenity --entry --hide-text \
			--text="Ingrese password" --title="Password:")

	pass2=$(zenity --entry --hide-text \
			--text="Repita password" --title="Password:")
	if [ "${pass1}" = "${pass2}" ]; then
		pass=${pass1}
	else
		zenity --error --text="Las contraseñas no son iguales"
		exit 1
	fi

	for this_path in $(echo "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"); do
		input_file=$(basename "${this_path}")

		if [ -d "$this_path" ]; then
		# directory
			zenity --info --text="Por el momento no podemos cifrar directorios"
			exit 0
		else
		# not directory
			output_file="${input_file}.enc"
			openssl aes-256-cbc -in ${input_file} -out ${output_file} -k ${pass}
		fi
	done
}

descifrar()
{
	# ingresar password
	pass=$(zenity --entry --hide-text \
			--text="Ingrese password" --title="Password:")

	for this_path in $(echo "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"); do
		input_file=$(basename "${this_path}")

		output_file=${input_file%%.enc}
		output_path="${this_path}/${output_file}"
		openssl aes-256-cbc -d -in ${input_file} -out ${output_file} -k ${pass}
	done
}

dialogo_principal()
{
	#Cifrar o descifrar
	opcion=$( zenity --list --radiolist --title="Cifrar o descifrar" \
					--column='Pick' --column='Opción'  \
					'FALSE' 		"descifrar" \
					'FALSE' 		"cifrar" )
}

inicio()
{
	dialogo_principal
	if [ ${opcion} = 'cifrar' ]; then
		cifrar
	elif [ ${opcion} = 'descifrar' ]; then
		descifrar
	else
		echo "Error en selección."
		exit 1
	fi
}

#Llamado a función principal
inicio
zenity --notification --text="Archivo ${output_file} generado."
exit 0

