Introducción a XML
==================

XML, siglas en inglés de *eXtensible Markup Language* (lenguaje de marcas extensible), es un lenguaje de marcas desarrollado por el World Wide Web Consortium (W3C) utilizado para almacenar datos en forma legible. Deriva del lenguaje SGML y permite definir la gramática de lenguajes específicos (de la misma manera que HTML es a su vez un lenguaje definido por SGML) para estructurar documentos grandes. A diferencia de otros lenguajes, XML da soporte a bases de datos, siendo útil cuando varias aplicaciones deben comunicarse entre sí o integrar información.

XML no ha nacido sólo para su aplicación para Internet, sino que se propone como un estándar para el intercambio de información estructurada entre diferentes plataformas. Se puede usar en bases de datos, editores de texto, hojas de cálculo y casi cualquier cosa imaginable.

XML es una tecnología sencilla que tiene a su alrededor otras que la complementan y la hacen mucho más grande y con unas posibilidades mucho mayores. Tiene un papel muy importante en la actualidad ya que permite la compatibilidad entre sistemas para compartir la información de una manera segura, fiable y fácil.

Historia
--------

XML proviene de un lenguaje inventado por IBM en los años setenta, llamado GML (Generalized Markup Language), que surgió por la necesidad que tenía la empresa de almacenar grandes cantidades de información y compartirla en otros SO y plataformas. Este lenguaje gustó a la ISO, por lo que en 1986 trabajaron para normalizarlo, creando SGML (Standard Generalized Markup Language), capaz de adaptarse a un gran abanico de problemas. A partir de él se han creado otros sistemas para almacenar información.

En el año 1989 Tim Berners Lee creó la web, y junto con ella el lenguaje HTML. Este lenguaje se definió en el marco de SGML y fue de lejos la aplicación más conocida de este estándar. Los navegadores web sin embargo siempre han puesto pocas exigencias al código HTML que interpretan y así las páginas web son caóticas y no cumplen con la sintaxis. Estas páginas web dependen fuertemente de una forma específica de lidiar con los errores y las ambigüedades, lo que hace a las páginas más frágiles y a los navegadores más complejos.

Otra limitación del HTML es que cada documento pertenece a un vocabulario fijo, establecido por el DTD. No se pueden combinar elementos de diferentes vocabularios. Asimismo es imposible para un intérprete (por ejemplo un navegador) analizar el documento sin tener conocimiento de su gramática (del DTD). Por ejemplo, el navegador sabe que antes de una etiqueta ``<div>`` debe haberse cerrado cualquier ``<p>`` previamente abierto. Los navegadores resolvieron esto incluyendo lógica *adhoc* para el HTML, en vez de incluir un analizador genérico. Ambas opciones, de todos modos, son muy complejas para los navegadores.

Se buscó entonces definir un subconjunto del SGML que permita:

-  Mezclar elementos de diferentes lenguajes, es decir, que los lenguajes sean extensibles.
-  La creación de analizadores simples, sin ninguna lógica especial para cada lenguaje.
-  Empezar de cero y hacer hincapié en que no se acepte nunca un documento con errores de sintaxis.
-  Para hacer esto XML deja de lado muchas características de SGML que estaban pensadas para facilitar la escritura manual de documentos. XML en cambio está orientado a hacer las cosas más sencillas para los programas automáticos que necesiten interpretar el documento.

HTML vs. XML
------------

Veamos primero un trozo de código HTML:

.. code-block:: html

   <h1>
     Comedor
   </h1>
   <ul>
     <li>
       <b>Mesa redonda de madera de arce</b>.
       El fabricante es <i>Muebles Albacete</i> y su precio 4000.
     </li>
     <li>
       <b>Dos sillas de madera de arce</b>,
       de excelente calidad, con un coj&iacute;n azul cada una.
     </li>
     <li>
       <b>3 sillas de madera de roble</b>.
     </li>
   </ul>

.. figure:: /imagenes/10_introduccion_xml/01_ejemplo_html.png
   :align: center

   HTML interpretado por el navegador.

HTML es un lenguaje de presentación. Define un conjunto de etiquetas y atributos válidos, una utilización válida de estos elementos y un significado visual para cada elemento del lenguaje.

Ahora veamos un trozo de código XML:

.. code-block:: xml

   <comedor>
     <mesa tipo="redonda" madera="arce">
       <fabricante>Muebles Albacete</fabricante>
       <precio>4000</precio>
     </mesa>
     <silla madera="arce">
       <cantidad>2</cantidad>
       <calidad>excelente</calidad>
       <cojin incluido="si">
         <color>azul</color>
       </cojin>
     </silla>
     <silla madera="roble">
       <cantidad>3</cantidad>
       <calidad>normal</calidad>
     </silla>
   </comedor>

.. figure:: /imagenes/10_introduccion_xml/02_ejemplo_xml.png
   :align: center

   XML cargado en un navegador, sin hoja de estilos.

XML está orientado a los datos en sí mismos. No define las etiquetas ni cómo se utilizan, sólo define unas pocas reglas sintácticas para crear documentos. Por eso XML es un metalenguaje (un lenguaje para definir otros lenguajes).

XML y HTML son complementarios.

Principales usos
----------------

XML aplicado a los sitios web
   Permite separar el contenido de la presentación y que los mismos datos se puedan mostrar de varias formas distintas sin demasiado esfuerzo.
XML para la comunicación entre aplicaciones
   Representación de los datos muy simple y fácil de transmitir por la red.
Aplicaciones heredadas
   Acceso a datos de aplicaciones que ya no están en uso o incompatibles por diferencias entre versiones.
