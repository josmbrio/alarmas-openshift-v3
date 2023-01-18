source .env

for node in $(oc get nodes| grep ocp | cut -d " " -f 1); do echo $node ; ssh $node df -h /var/lib/docker; done    > /tmp/EspacioServidores.txt
mail -s "Informacion de espacio en los Servidores" -S smtp=$SMTP_ADDRESS:$SMTP_PORT -r $FROM_ADDRESS -a   /tmp/EspacioServidores.txt  "$DEST_ADDRESS"<<< 'Se adjunta la informacion del espacio utilizado por el directorio usado por los Pods en los servidores.
Solicitar una limpieza de imagenes en el nodo afectado al area de Infraestructura.

Referencia:

OPCION #1
1. En el caso de los nodos worker, ingresar por ssh.
2. Depurar las imagenes no referenciadas ce docker: docker rmi $(docker images -q -f dangling=true) 

OPCION #2
1. Deshabilitar Nodo (oc adm manage-node NOMBRE_NODO --schedulable=false).
2. Desalojar pods del Nodo (oc adm drain NOMBRE_NODO --ignore-daemonsets).
3. Depurar imagenes en Nodo (docker rm -f $(docker ps -aq); docker rmi $(docker images -q).
4. Habilitar Nodo (oc adm manage-node NOMBRE_NODO --schedulable=true).'
