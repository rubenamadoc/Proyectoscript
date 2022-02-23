# Explicación

A través de un menú, este script nos permitirá crear copias de seguridad y restaurarlas de los usuarios deseados de nuestro sistema.
Para ello nos proporciona cinco opciones (seis si contamos con la de salida):

1. Nos preguntará un nombre de usuario para posteriormente comprobar su existencia. Si no existe se saldrá del mismo.
2. Esta opción comprobará la conectividad del mismo usuario. Para continuar el usuario deberá estar conectado.
    Debido a que si está conectado en el momento de la copia podrá acarrear un problemas.
3. Para realizar la copia nos pedirá una ruta de destino. Al introducirla, si ya existe, se iniciará la copia. En caso de que no exista,
    nos preguntará si queremos crearla.
4. Preguntará que copia de seguridad deseamos restaurar.
5. Nos muestra las copias de seguridad existentes.
6. Sale del script.


Os proporciono el código completo [aquí](https://github.com/rubenamadoc/Proyectoscript/blob/b7e922e386da74a2f6ad0b55289bbee9f9ba8106/codigo.sh).
