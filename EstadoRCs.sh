source .env
 oc get dc --all-namespaces | grep -v NAME | awk '{if($4!=0 && ($4!=$5) && ($3!=0)){print "NAMESPACES: "$1 " - DC: "$2" - REVISION:"$3" - DESIRED: "$4" - CURRENT: "$5}}' > /tmp/InformacionRCs.txt
 mail -s "Informacion Estado de Replication Controllers" -S smtp=$SMTP_ADDRESS:$SMTP_PORT -r $FROM_ADDRESS -a /tmp/InformacionRCs.txt  "$DEST_ADDRESS"<<< "Se adjunta la informacion  del  estado de los Replication Controllers.
Los Deployments presentados en el archivo tiene una ultima version (REVISION) QUE NO ESTA EJECUTANDO (CURRENT=0) (DESIRED=numero de replicas).
Se recomienda revisar en desarrollo, pues el DC o no esta dando servicio o esta trabajando en una version de deployment menor a la ultima desplegada"
