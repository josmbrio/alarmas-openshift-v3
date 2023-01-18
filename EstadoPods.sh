 oc get pods --all-namespaces | egrep -v "^NAMESPACE" | awk '{POD=$2; split(POD,a,"-"); lastFilter= a[length(a)]; if(($4!="Running") &&(lastFilter!="deploy") && (lastFilter!="build")){print "NAMESPACES: "$1 " - POD_NAME: "$2" - READY: "$3" - STATUS: "$4" - RESTARTS "$5" - AGE: "$6}}'  > /respaldo-openshift/AlarmasCluster/InformacionPods.txt

if [ -s /respaldo-openshift/AlarmasCluster/InformacionPods.txt ]
then
 mail -s "Alerta Estado de Pods" -S smtp=192.168.35.61:25 -r openshift_desa@claro.com.ec -a /respaldo-openshift/AlarmasCluster/InformacionPods.txt  "jbrionev@claro.com.ec,btamayog@claro.com.ec,jlarrosa@claro.com.ec"<<< "De la informacion adjunta favor revisar los Pods de los proyectos presentados.
En caso de que los Pods listados no pertenezcan a los proyectos desplegados por Claro, favor comunicarlo al area de infraestructura"
else
echo No hay Pods
fi
