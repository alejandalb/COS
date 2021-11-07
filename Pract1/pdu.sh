while getopts ":h10an:f:u:" arg; do
    case ${arg} in                     
        h)
            echo"
            -1:  Encender 
            -0: Apagar 
        <salidas> la/s salida/s afectada/s:  
            -a: Todas las salidas 
            -n x: La salida x 
            -d x: Desde la salida x 
            –u y: Hasta la salida y "
            ;;
        1)
            operacion="1"
            ;;
        0)
            operacion="2"
            ;;
        a)
            { printf “practica\ncos\n1\n9\n$operacion\nyes\n\n\033\0334\n”; } | telnet 158.42.181.26
	    exit 1
            ;;
        n) 
            objetivo=$OPTARG
            { printf “practica\ncos\n1\n$objetivo\n$operacion\nyes\n\n\033\0334\n”; } | telnet 158.42.181.26 
            exit 1
            ;;
        f)
            from=$OPTARG
            for (( i=$from; i<=$until; i++ ))
            do
	    $objetivo = "$i"
            { printf “practica\ncos\n1\n$objetivo\n$operacion\nyes\n\n\033\0334\n”; } | telnet 158.42.181.26 
            done
	    exit 1
            ;;
        u)
            until=$OPTARG
            ;;
        \?) 
           echo"
            -1:  Encender 
            -0: Apagar 
        <salidas> la/s salida/s afectada/s:  
            -a: Todas las salidas 
            -n x: La salida x 
            -d x: Desde la salida x 
            –u y: Hasta la salida y "
            ;;
            exit 1
            ;;
    esac
done


