oc project default
oc rsh $(oc get pods -n default| grep docker | cut -f 1 -d " " ) df -h /registry  > /respaldo-openshift/AlarmasCluster/EspacioRegistry.txt
mail -s "Informacion de espacio en Registry" -S smtp=192.168.35.61:25 -r openshift_desa@claro.com.ec -a /respaldo-openshift/AlarmasCluster/EspacioRegistry.txt "jbrionev@claro.com.ec,btamayog@claro.com.ec,jlarrosa@claro.com.ec"<<< "Se adjunta la informacion del espacio disponible en el Registry.
En caso de que este valor supere el 80% notificar al area de Infraestructura para realizar una depuracion de imagenes, builds y deployments.

Referencia:

1. Depurar los builds (oc adm prune  builds --confirm=true).
2. Depurar los deployments (oc adm prune  deployments --confirm).
3. Depurar las imagenes (oc adm prune images --confirm=true --registry-url registry.openshift-apps.dev.conecel.com).

"
