echo "              REQUEST    LIMITS" > /respaldo-openshift/AlarmasCluster/InformacionRequestsLimitsNodos.txt
 oc describe nodes | grep -e Hostname -e memory -e cpu| grep -e Hostname -e % >> /respaldo-openshift/AlarmasCluster/InformacionRequestsLimitsNodos.txt 
 mail -s "Informacion Requests y Limits de Nodos" -S smtp=192.168.35.61:25 -r openshift_desa@claro.com.ec -a /respaldo-openshift/AlarmasCluster/InformacionRequestsLimitsNodos.txt  "jbrionev@claro.com.ec,btamayog@claro.com.ec,jlarrosa@claro.com.ec"<<< "Se adjunta la informacion de los Requests y Limits en los Nodos.
En la informacion adjunta favor revisar lo correspondiente a los nodos de aplicacion (dgdc-ocp-node*.dev.conecel.com), en caso de que el Request de CPU o Memory supere el 90% es necesario revisar los Pods desplegados en los nodos afectados.
En el caso de los demas tipos de nodos superen los valores indicados favor notificarlo al area de infraestructura."
