source .env
oc get events --all-namespaces| grep -v " Normal" | grep -v "NAMESPACE" > /tmp/EventosProyectos.txt

if [ -s /tmp/EventosProyectos.txt ]
then
oc get events --all-namespaces| grep -v " Normal"  > /tmp/EventosProyectos.txt
mail -s "Informacion de eventos no Normales en todos los Proyectos" -S smtp=$SMTP_ADDRESS:$SMTP_PORT -r $FROM_ADDRESS -a /tmp/EventosProyectos.txt  "$DEST_ADDRESS"<<< "Se adjunta la informacion de los eventos que no son de tipo Normal de todos los Proyectos de OpenShift.
En caso de que los eventos presentados no sean de los proyectos desplegados por Claro favor comunicarlo al area de infraestructura."
else
echo No hay eventos no Normales
fi
