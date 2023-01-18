source .env
oc describe nodes | grep "0 (0%)" | egrep -v '(^  openshift|^  kube|^  app-storage|^  default|^  cpu|^  memory|\-deploy )'  > /tmp/PodsSinRequestLimits.txt

if [ -s /tmp/PodsSinRequestLimits.txt ]
then
echo "  Namespace                     Pod Name                              CPU Requests  CPU Limits  Memory Requests  Memory Limits" >  /tmp/PodsSinRequestLimits.txt
echo "  ---------                     --------                              ------------  ----------  ---------------  -------------" >> /tmp/PodsSinRequestLimits.txt
 oc describe nodes | grep "0 (0%)" | egrep -v '(^  openshift|^  kube|^  app-storage|^  default|^  cpu|^  memory|\-deploy )'  >> /tmp/PodsSinRequestLimits.txt
 mail -s "Informacion Pods sin Request/Limits" -S smtp=$SMTP_ADDRESS:$SMTP_PORT -r $FROM_ADDRESS -a /tmp/PodsSinRequestLimits.txt  "$DEST_ADDRESS"<<< "En la informacion adjunta se presentan los Pods cuyo DC no tiene configurado Request y/o Limits.
Es necesario realizar esta configuracion para un mejor manejo de los recursos de la plataforma."

else 
echo No Pods sin Req y Limit
fi 
