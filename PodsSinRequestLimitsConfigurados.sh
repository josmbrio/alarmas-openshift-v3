oc describe nodes | grep "0 (0%)" | egrep -v '(^  openshift|^  kube|^  app-storage|^  default|^  cpu|^  memory|\-deploy )'  > /respaldo-openshift/AlarmasCluster/PodsSinRequestLimits.txt

if [ -s /respaldo-openshift/AlarmasCluster/PodsSinRequestLimits.txt ]
then
echo "  Namespace                     Pod Name                              CPU Requests  CPU Limits  Memory Requests  Memory Limits" >  /respaldo-openshift/AlarmasCluster/PodsSinRequestLimits.txt
echo "  ---------                     --------                              ------------  ----------  ---------------  -------------" >> /respaldo-openshift/AlarmasCluster/PodsSinRequestLimits.txt
 oc describe nodes | grep "0 (0%)" | egrep -v '(^  openshift|^  kube|^  app-storage|^  default|^  cpu|^  memory|\-deploy )'  >> /respaldo-openshift/AlarmasCluster/PodsSinRequestLimits.txt
 mail -s "Informacion Pods sin Request/Limits" -S smtp=192.168.35.61:25 -r openshift_desa@claro.com.ec -a /respaldo-openshift/AlarmasCluster/PodsSinRequestLimits.txt  "jbrionev@claro.com.ec,btamayog@claro.com.ec,jlarrosa@claro.com.ec"<<< "En la informacion adjunta se presentan los Pods cuyo DC no tiene configurado Request y/o Limits.
Es necesario realizar esta configuracion para un mejor manejo de los recursos de la plataforma."

else 
echo No Pods sin Req y Limit
fi 
