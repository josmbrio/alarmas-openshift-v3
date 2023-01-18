oc rsh -n app-storage $(oc get pods -n app-storage| grep heketi | cut -f 1 -d " ") heketi-cli topology info | egrep '(csn|Free)' | tac | awk -F: '{sumfree+=$NF;sumsize+=$(NF-2)} {if ( $2 ~ "csn") {print "Tamaño: "sumsize" GB - Libre: "sumfree" GB  - Usado: "int(100-(sumfree*100/sumsize))"% -" $2 ; sumfree=0;sumsize=0}}' > /respaldo-openshift/AlarmasCluster/EspacioStorage.txt

mail -s "Informacion de espacio en Storage" -S smtp=192.168.35.61:25 -r openshift_desa@claro.com.ec -a /respaldo-openshift/AlarmasCluster/EspacioStorage.txt "jbrionev@claro.com.ec,btamayog@claro.com.ec,jlarrosa@claro.com.ec"<<< "Se adjunta la informacion del espacio disponible en Storage.

Todos los nodos de storage deben tener espacio Libre. En caso de que uno ya este en 0 eliminar PVC no utilizados o comunicarse con TIC INFR Serv para la gestión de más almacenamiento.

Ej: Si requiere 5GB debe haber 5GB libres en todos los nodos.
"
