# Introducción a XML  

XML, siglas en inglés de eXtensible Markup Language ('lenguaje de marcas extensible'), es un lenguaje de marcas desarrollado por el World Wide Web Consortium (W3C) utilizado para almacenar datos en forma legible. Deriva del lenguaje SGML y permite definir la gramática de lenguajes específicos (de la misma manera que HTML es a su vez un lenguaje definido por SGML) para estructurar documentos grandes. A diferencia de otros lenguajes, XML da soporte a bases de datos, siendo útil cuando varias aplicaciones deben comunicarse entre sí o integrar información.

XML no ha nacido sólo para su aplicación para Internet, sino que se propone como un estándar para el intercambio de información estructurada entre diferentes plataformas. Se puede usar en bases de datos, editores de texto, hojas de cálculo y casi cualquier cosa imaginable.

XML es una tecnología sencilla que tiene a su alrededor otras que la complementan y la hacen mucho más grande y con unas posibilidades mucho mayores. Tiene un papel muy importante en la actualidad ya que permite la compatibilidad entre sistemas para compartir la información de una manera segura, fiable y fácil.

## Historia  

XML proviene de un lenguaje inventado por IBM en los años setenta, llamado GML (Generalized Markup Language), que surgió por la necesidad que tenía la empresa de almacenar grandes cantidades de información y compartirla en otros SO y plataformas. Este lenguaje gustó a la ISO, por lo que en 1986 trabajaron para normalizarlo, creando SGML (Standard Generalized Markup Language), capaz de adaptarse a un gran abanico de problemas. A partir de él se han creado otros sistemas para almacenar información.

En el año 1989 Tim Berners Lee creó la web, y junto con ella el lenguaje HTML. Este lenguaje se definió en el marco de SGML y fue de lejos la aplicación más conocida de este estándar. Los navegadores web sin embargo siempre han puesto pocas exigencias al código HTML que interpretan y así las páginas web son caóticas y no cumplen con la sintaxis. Estas páginas web dependen fuertemente de una forma específica de lidiar con los errores y las ambigüedades, lo que hace a las páginas más frágiles y a los navegadores más complejos.

Otra limitación del HTML es que cada documento pertenece a un vocabulario fijo, establecido por el DTD. No se pueden combinar elementos de diferentes vocabularios. Asimismo es imposible para un intérprete (por ejemplo un navegador) analizar el documento sin tener conocimiento de su gramática (del DTD). Por ejemplo, el navegador sabe que antes de una etiqueta `<div>` debe haberse cerrado cualquier `<p>` previamente abierto. Los navegadores resolvieron esto incluyendo lógica ad hoc para el HTML, en vez de incluir un analizador genérico. Ambas opciones, de todos modos, son muy complejas para los navegadores.

Se buscó entonces definir un subconjunto del SGML que permita:

- Mezclar elementos de diferentes lenguajes. Es decir que los lenguajes sean extensibles.
- La creación de analizadores simples, sin ninguna lógica especial para cada lenguaje.
- Empezar de cero y hacer hincapié en que no se acepte nunca un documento con errores de sintaxis.
- Para hacer esto XML deja de lado muchas características de SGML que estaban pensadas para facilitar la escritura manual de documentos. XML en cambio está orientado a hacer las cosas más sencillas para los programas automáticos que necesiten interpretar el documento.

## HTML vs. XML

Veamos primero un trozo de código HTML:  

![Fragmento de HTML](imagenes/PROGRAMACION_XML_html_3e8c014f.png)

![HTML interpretado por el navegador](imagenes/PROGRAMACION_XML_html_30efee4e.png)  

HTML es un lenguaje de presentación. Define un conjunto de etiquetas y atributos válidos, una utilización válida de estos elementos y un significado visual para cada elemento del lenguaje.

Ahora veamos un trozo de código XML:  

![Fragmento de XML](imagenes/PROGRAMACION_XML_html_m7b472e49.png)

![XML cargado en un navegador, sin hoja de estilos](imagenes/PROGRAMACION_XML_html_m451e59f8.png)

XML está orientado a los datos en sí mismos. No define las etiquetas ni cómo se utilizan, sólo define unas pocas reglas sintácticas para crear documentos. Por eso XML es un metalenguaje (un lenguaje para definir otros lenguajes).

XML y HTML son complementarios.

## Principales usos  

XML aplicado a los sitios web
: Permite separar contenido y presentación, y que los mismos datos se puedan mostrar de varias formas distintas sin demasiado esfuerzo.

XML para la comunicación entre aplicaciones
: Representación de los datos muy simple, fácil de transmitir por la red, estándar.

Aplicaciones heredadas
: Acceso a datos de aplicaciones que ya no están en uso, o por diferencias entre versiones.

## Principales características  

- Es una arquitectura más abierta y extensible. No se necesita versiones para que puedan funcionar en futuros navegadores.

- Mayor consistencia, homogeneidad y amplitud de los identificadores descriptivos del documento con XML.

- La extensibilidad e integración de los datos de las fuentes mas dispares. Se podrá hacer el intercambio de documentos entre las aplicaciones tanto en el propio PC como en una red local o extensa.

- Los motores de búsqueda devolverán respuestas más adecuadas y precisas.

- El concepto de *hipertexto* se desarrollará ampliamente (permitirá denominación independiente de la ubicación, enlaces que pueden especificarse y gestionarse. Creado a través del Lenguaje de enlaces extensible (XLL).

- Exportabilidad a otros formatos de publicación (PDF, HTML, etc)

## Componentes de XML  

El metalenguaje XML consta de cuatro especificaciones:

DTD *(Document Type Definition)*
: Es un documento con un conjunto de reglas que especifican la estructura lógica del documento XML. En tareas sencillas no es necesario construir una DTD, ya que es algo opcional.

XSL *(eXtensible Stylesheet Language)*
: Define o implementa el lenguaje de estilo de los documentos escritos para XML. Permite modificar el aspecto de un documento. Y, por otro lado, se considera más potente que las hojas de estilo en cascada (CSS, *Cascading Style Sheets*)

XLL *(eXtensible Linking Languge)*
: Define el modo de enlace entre diferentes enlaces. Este lenguaje de enlaces extensible tiene dos importantes componentes: Xlink y el Xpointer.

XUA *(XML User Agent)*
: Estandarización de navegadores XML. Se aplicará a los navegadores para que compartan todos las especificaciones XML.
