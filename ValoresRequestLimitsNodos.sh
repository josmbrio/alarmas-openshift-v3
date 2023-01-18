source .env
echo "              REQUEST    LIMITS" > /tmp/InformacionRequestsLimitsNodos.txt
 oc describe nodes | grep -e Hostname -e memory -e cpu| grep -e Hostname -e % >> /tmp/InformacionRequestsLimitsNodos.txt 
 mail -s "Informacion Requests y Limits de Nodos" -S smtp=$SMTP_ADDRESS:$SMTP_PORT -r $FROM_ADDRESS -a /tmp/InformacionRequestsLimitsNodos.txt  "$DEST_ADDRESS"<<< "Se adjunta la informacion de los Requests y Limits en los Nodos.
En la informacion adjunta favor revisar lo correspondiente a los nodos de aplicacion (dgdc-ocp-node*.dev.conecel.com), en caso de que el Request de CPU o Memory supere el 90% es necesario revisar los Pods desplegados en los nodos afectados.
En el caso de los demas tipos de nodos superen los valores indicados favor notificarlo al area de infraestructura."
