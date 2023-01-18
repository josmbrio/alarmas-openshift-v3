oc get events --all-namespaces| grep -v " Normal" | grep -v "NAMESPACE" > /respaldo-openshift/AlarmasCluster/EventosProyectos.txt

if [ -s /respaldo-openshift/AlarmasCluster/EventosProyectos.txt ]
then
oc get events --all-namespaces| grep -v " Normal"  > /respaldo-openshift/AlarmasCluster/EventosProyectos.txt
mail -s "Informacion de eventos no Normales en todos los Proyectos" -S smtp=192.168.35.61:25 -r openshift_desa@claro.com.ec -a /respaldo-openshift/AlarmasCluster/EventosProyectos.txt  "jbrionev@claro.com.ec,btamayog@claro.com.ec,jlarrosa@claro.com.ec"<<< "Se adjunta la informacion de los eventos que no son de tipo Normal de todos los Proyectos de OpenShift.
En caso de que los eventos presentados no sean de los proyectos desplegados por Claro favor comunicarlo al area de infraestructura."
else
echo No hay eventos no Normales
fi
