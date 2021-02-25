#!/usr/bin/env ruby

# Autor y versión: Daniel Escano, 1.0
# Descripción: Script para instalar/desinstalar software a través de un archivo

puts "============================"
puts "        Softwarectl         "
puts "  Creado por Daniel Escano  "
puts "============================"
puts "\n"

# PASO 1: Comprobar parámetro

# Si el script se ejecuta sin parámetros, se mostrará un mensaje 
# aconsejando usar la opción "--help" para ver la ayuda.

if ARGV[0].nil?
    puts "Utiliza el parámetro '--help' para mostrar la ayuda por pantalla\n"
    exit 1
end


# PASO 2: Parámetro de ayuda

# Si el script se ejecuta con el parámetro --help se mostrará la ayuda

if ARGV[0] == "--help"
	puts "Usage:"
	puts "      systemctml [OPTIONS] [FILENAME]"
	puts "Options:"
	puts "       --help, mostrar esta ayuda."
	puts "       --version, mostrar información sobre el autor del script y fecha de creacion."
	puts "       --status FILENAME, comprueba si puede instalar/desintalar."
	puts "       --run FILENAME, instala/desinstala el software indicado."
	puts "Description:"
	puts "       Este script se encarga de instalar/desinstalar"
	puts "       el software indicado en el fichero FILENAME."
	puts "       Ejemplo de FILENAME:"
	puts "       tree:install"
	puts "       nmap:install"
	puts "       atomix:remove"
	exit 0
end

# PASO 3: Parámetro version

# Si el script se ejecuta con la opción --version, se muestra en pantalla información
# del autor del script y la fecha de creación.

if ARGV[0] == "--version" 
    puts "Creation Date: 15/02/2021"
    puts "Author: Daniel Escano"
    puts "Version: 1.0"
    exit 0
end

# PASO 4: Parámetro status

# Si el script se ejecuta con la opción --status FILENAME, 
# entonces se lee el contenido del fichero FILENAME, 
# y para cada PACKAGENAME se muestra en pantalla su estado actual.

if ARGV[0] == "--status" 
    if ARGV[1].nil?
        puts "Parámetros erroneos\n"
        puts "Utiliza el parámetro '--help' para mostrar la ayuda por pantalla\n"
        exit 1
    end
    puts "Lista de paquetes: \n"
    a = `cat #{ARGV[1]}`
    b = a.split("\n")
    b.each do |i|
        c = i.split(":")
        d = `whereis #{c[0]} |grep bin |wc -l`.chop
            if d == "1"
                puts "#{c[0]}: (I) Installed"
            else
                puts "#{c[0]}: (U) Unistalled"
            end
    end
    exit 0
end

# PASO 5: Parámetro run

# Si el script se ejecuta con la opción --run FILENAME:
# Primero se comprueba que se seamos el usuario root. 
# En caso contrario se mostrará un mensaje de advertencia en pantalla 
# y se finaliza el script con error.
# Segundo se lee el contenido del fichero FILENAME, 
# y para cada PACKAGENAME se procede a ejecutar la acción asociada,
# que puede ser "install" o "remove".

if ARGV[0] == "--run" 
    if ARGV[1].nil?
        puts "Parámetros erroneos\n"
        puts "Utiliza el parámetro '--help' para mostrar la ayuda por pantalla\n"
        exit 1
    end
    a = `whoami`
    b = a.chop
    if b == "root"
        c = `cat #{ARGV[1]}`
        d = c.split("\n")
        d.each do |i|
            e = i.split(":")
            f = `whereis #{e[0]} |grep bin |wc -l`.chop
            if (f == "0" && e[1] == "remove")
               puts "El paquete #{e[0]} no se encuentra en el sistema, por tanto no se puede desinstalar.\n" 
            end
            if (f == "0" && e[1] == "install")
               puts "Comenzando instalacion de #{e[0]}..."
               system ("zypper install -y #{e[0]}")
               puts "\n"
            end
            if (f == "1" && e[1] == "remove")
               puts "Comenzando desinstalacion de #{e[0]}..."
               system ("zypper remove -y #{e[0]}")
               puts "\n"
            end
            if (f == "1" && e[1] == "install")
               puts "El paquete #{e[0]} ya esta instalado en el sistema.\n" 
            end
        end       
        exit 0
    else
        puts "Privilegios del superusuario (root) requeridos para ejecutar este comando. \n"
        exit 1
    end
end
