DTDs
====

¿Qué es un DTD?
---------------

Un DTD (*Document Type Definition*) es un conjunto de reglas sintácticas para definir etiquetas. Nos indica qué etiquetas se pueden usar en un documento, en qué orden deben aparecer, cuáles pueden aparecer dentro de otras, cuáles tienen atributos, etc. Toda esta información se guarda en un archivo de texto con extensión ``.dtd``.

No es un documento XML y por lo tanto no necesita prólogo, salvo en ciertos casos especiales.

Crear una definición del tipo de documento (DTD) es como crear nuestro propio lenguaje de marcado para una aplicación específica. Pueden ser parte del documento XML, pero se suele colocar aparte para poder reutilizarlo.

Puesto que XML es un sistema para definir lenguajes, quien necesite usar XML para intercambio de datos debe definir su propio DTD.

Un problema que presentan los DTDs es que no siguen la sintaxis XML, sino una propia.

Definición de elementos
-----------------------

Los elementos permitidos se especifican con ``ELEMENT``, seguido del nombre y el tipo de elemento:

.. code-block:: dtd

   <!ELEMENT nombre_elemento tipo_elemento>

Los elementos que se pueden anidar dentro de otros se especifican entre paréntesis.

Si van separados por comas exigen que sigan exactamente ese orden:

.. code-block:: dtd

   <!ELEMENT libro (titulo, autor, capitulo)>

Según este ejemplo, ``libro`` debe contener un ``titulo``, un ``autor`` y un ``capitulo`` exactamente y por ese orden.

Si van separados por la barra vertical ``|`` no exigen ese orden, podrán aparecer en cualquier posición.

.. code-block:: dtd

   <!ELEMENT libro (titulo | autor | capitulo)>

Según este ejemplo, ``libro`` debe contener o un ``titulo``, o un ``autor`` o un ``capitulo`` y no en ese orden exactamente.

Si lo que nosotros necesitamos es que siempre aparezca uno de cada pero en diferente orden, pondríamos:

.. code-block:: dtd

   <!ELEMENT libro (titulo | autor | capitulo)+ >

Ahora con esta modificación si habrá por lo menos un elemento de cada y en orden aleatorio.

Incluso podríamos especificar subelementos, por ejemplo:

.. code-block:: dtd

   <!ELEMENT libro (titulo, autor, (fotografia|dibujo), capitulo)+ >

El tipo menos restrictivo es ``ANY``. Al ser un elemento que permite cualquier contenido, no tiene estructura alguna. Lo mejor es evitar este tipo de elementos.

.. code-block:: dtd

   <!ELEMENT cualquiera ANY>

Para datos de tipo texto, se usa ``#PCDATA``. Este dato puede incluso a llegar a ser vacío. Pero no puede contener ni gráficos ni elementos multimedia.

.. code-block:: dtd

   <!ELEMENT texto (#PCDATA)>

Para elementos vacíos, ``EMPTY``. No tienen contenido, solo podrían tener información en sus atributos.

.. code-block:: dtd

   <!ELEMENT img EMPTY>

Pueden utilizarse en el documento XML con dos etiquetas:

.. code-block:: html

   <img src="logotipo.gif"></img>

O solo con una:

.. code-block:: html

   <img src="logotipo.gif" />

Para opciones alternativas, separar con ``|``. Por ejemplo:

.. code-block:: dtd

   <!ELEMENT sexo (mujer | hombre)>
   <!ELEMENT parrafo (#PCDATA | lineas)>

Modificadores de número de ocurrencias:

+-----------------------------------------+----------------------------+
| Modificador                             | Significado                |
+=========================================+============================+
| ``()``                                  | Los paréntesis sencillos   |
|                                         | agrupan subetiquetas,      |
|                                         | contienen valores de       |
|                                         | atributo y claves.         |
+-----------------------------------------+----------------------------+
| ``,``                                   | Partícula “y” (AND). La    |
|                                         | coma indica la ordenación  |
|                                         | exacta de los elementos en |
|                                         | el orden establecido.      |
+-----------------------------------------+----------------------------+
| ``|``                                   | Partícula “o” (OR). La     |
|                                         | barra vertical significa   |
|                                         | que solamente se puede     |
|                                         | utilizar uno de los        |
|                                         | elementos propuestos.      |
+-----------------------------------------+----------------------------+
| ``?``                                   | Una vez o ninguna,         |
|                                         | ``[0,1]``.                 |
+-----------------------------------------+----------------------------+
| ``+``                                   | Al menos una vez,          |
|                                         | ``[1..n]``.                |
+-----------------------------------------+----------------------------+
| ``*``                                   | Cualquier número de veces  |
|                                         | o ninguna, ``[0,n]``.      |
+-----------------------------------------+----------------------------+
| (nada)                                  | Si aparece solo el nombre  |
|                                         | del elemento, exactamente  |
|                                         | una vez.                   |
+-----------------------------------------+----------------------------+

Ejemplo:

.. code-block:: dtd

   <!ELEMENT libro (titulo, autor+, capitulo+, apartados*, CD?)>

Un ``libro`` deberá tener, un ``titulo``, un ``autor`` como mínimo, un ``capitulo`` como mínimo, puede que haya o no ``apartados`` y por último si hay ``CD`` habrá uno solo.

Definición de atributos
-----------------------

Los atributos permitidos para un elemento se especifican con ``ATTLIST`` y el nombre del elemento seguido de los nombres de los atributos, con un tipo y modificador obligatorios.

.. code-block:: dtd

   <!ATTLIST nombre_elemento nombre_atributo tipo_atributo modificador>

Los tipos de definiciones de atributos que podemos encontrarnos son:

-  Definición de un atributo de tipo estándar, para cualquier valor, o una enumeración de los valores permitidos.

   .. code-block:: dtd

      <!ATTLIST libro ISBN CDATA #REQUIRED>

   En este ejemplo se define un atributo llamado ``ISBN`` para el elemento ``libro``, siendo obligatorio este atributo.

-  Definición de un atributo de valores enumerados.

   .. code-block:: dtd

      <!ATTLIST libro portada (foto | dibujo) #REQUIRED>

   En este ejemplo se define para el elemento Libro el atributo portada, que es obligatorio y con dos posibles valores.

-  Definición de varios atributos en una sola instrucción.

   .. code-block:: dtd

      <!ATTLIST
        autor nacionalidad CDATA #IMPLIED
        sexo (hombre | mujer) "mujer"
      >

Tipos de datos que puede contener un atributo:

``CDATA``
   Cualquier valor, o una enumeración de los valores permitidos.
``NMTOKEN``
   Para restringir el valor a un nombre XML válido (es decir, que empiece con una letra o guión de subrayado y contenga sólo letras, números, guiones de subrayado, guiones y puntos sin espacios)
``NMTOKENS``
   Múltiples atributos ``NMTOKEN``.
``ID``
   Además de las restricciones que impone ``NMTOKEN``, impone que el valor sea único en todo el documento.

   .. code-block:: dtd

      <!ATTLIST libro id ID #REQUIRED>

``IDREF``
   Una referencia a un ``ID`` declarado en alguna parte del DTD.

   .. code-block:: dtd

      <!ATTLIST libro referencia IDREF #REQUIRED>

``IDREFS``
   Múltiples ``IDREF``.
``ENTITY``
   Entidad binaria externa. (Hace referencia a un bloque de datos ya especificado).
``ENTITIES``
   Múltiples ``ENTITY`` separadas con espacios.
``NOTATION``
   Notación declarada en otra parte del DTD.

El modificador puede ser:

``#REQUIRED``
   Para atributos obligatorios.

   .. code-block:: dtd

      <!ATTLIST libro ISBN CDATA #REQUIRED>

``#IMPLIED``
   Para atributos opcionales.

   .. code-block:: dtd

      <!ATTLIST libro ISBN CDATA #IMPLIED>

``#FIXED``
   Para atributos con valores fijos.

   .. code-block:: dtd

      <!ATTLIST libro ISBN CDATA #FIXED>

También puede ser un valor por defecto:

.. code-block:: dtd

   <!ATTLIST autor sexo (hombre | mujer) "mujer">

Crear el DTD
------------

Para ello creamos un fichero de texto con extensión ``.dtd``.

Vamos describiendo cada elemento uno a uno desde el nodo raíz hasta el último elemento.

Declaración DOCTYPE
-------------------

Esta declaración es necesaria en el documento XML. Sirve para especificar a que DTD está unido el documento. Siempre debe ir colocado después del prólogo y antes del nodo raíz.

Aquí tenemos las tres formas de especificar un DTD:

``SYSTEM``
   Se utiliza en el caso de DTDs “personales”. Para especificar un fichero local:

   .. code-block:: dtd

      <!DOCTYPE nodo_raiz SYSTEM "fichero.dtd">

``PUBLIC``
   Se utiliza en el caso de una DTD pública.

   .. code-block:: dtd

      <!DOCTYPE nodo_raiz PUBLIC "-//OASIS//DTD Libro XML//EN" "../dtds/cap.dtd">

También es posible incrustar la DTD internamente en el documento XML:

.. code-block:: xml

   <?xml version="1.0" encoding="UTF-8" standalone="no" ?>
   <!DOCTYPE capitulo
     [<!ELEMENT capitulo (titulo, apartado+)>
      <!ELEMENT titulo (#PCDATA)>
      <!ELEMENT apartado (#PCDATA)>
     ]>
   <capitulo>
     <titulo>Introducción</titulo>
     <apartado>Primeros pasos con DTDs.</apartado>
   </capitulo>

Incluso es posible tener una DTD interna y otra externa (prevalece la interna).

Entidades
---------

Las entidades son una especie de comodines que sirven para reutilizar información. Ya sea un texto para mostrar en un documento de xml como para reutilizar código en una DTD.

Entidades internas
~~~~~~~~~~~~~~~~~~

Se utilizan cuando vamos a utilizar (una o varias veces) cierta información. En ese caso en vez de añadirla varias veces en el documento de XML, lo que hacemos es crear una entidad en el DTD, donde se le asigna a una especie de “constante” la información y después en el documento de xml, llamamos a dicha “constante” todas las veces que queramos.

Lo primero que tenemos que hacer es declarar la entidad en el DTD:

.. code-block:: dtd

   <!ENTITY nombre_entidad "datos">

Para llamarlo desde el documento de XML, ponemos:

.. code-block:: xml

   <elemento> ... &nombre_entidad; ... </elemento>

Un ejemplo sería:

+----------------------------+------------+
| DTD                        | XML        |
+============================+============+
| ``<!ENTITY amp "&#38;">``  | ``&amp;``  |
+----------------------------+------------+
| ``<!ENTITY apos "&#39;">`` | ``&apos;`` |
+----------------------------+------------+

En este caso, donde aparezca ``&amp;`` en el fichero XML, se sustituirá por ``&\#38;``.

Entidades externas
~~~~~~~~~~~~~~~~~~

El objetivo de este tipo de entidad es el mismo que la anterior. Este tipo es mucho más útil cuando la información que se va a incluir en la entidad es muy grande, o cuando la información va a estar siempre guardad en un archivo que se irá modificando cada cierto tiempo sin que esto conlleve la modificación del DTD. La información estará guardada en un fichero de texto ó en un fichero xml, en la DTD asociaremos la entidad a este fichero.

Para hacer referencia a un fichero de texto en local, ponemos:

.. code-block:: dtd

   <!ENTITY nombre_entidad SYSTEM "datos.txt">

Para hacer referencia a un fichero de texto que no está en local, ponemos:

.. code-block:: dtd

   <!ENTITY nombre_entidad PUBLIC "datos.txt">

En el documento XML se invocan con:

.. code-block:: xml

   &nombre_entidad;

Por ejemplo, para incluir este fragmento de texto:

.. figure:: /imagenes/30_dtds/01_LeyProteccionDeDatos.png
   :align: center

   Fichero con el contenido de la LOPD.

Pondríamos en el DTD:

.. code-block:: dtd

   <!ENTITY ley SYSTEM "LeyProteccionDeDatos.txt>

Poner en documento XML:

.. code-block:: xml

   <elemento> ... &ley; ... </elemento>

Entidades parámetro
~~~~~~~~~~~~~~~~~~~

Este tipo de entidades son totalmente distintas a las dos anteriores, ya que estas no son para llamarlas desde el documento de XML, sino desde la misma DTD. Es decir, si hay un trozo de código en la DTD que está repetido muchas veces, en vez de escribirlo todas las veces nos creamos una entidad parámetro al principio de la DTD y después la llamamos todas las veces que necesitemos a lo largo de la misma DTD.

Se declaran al principio de la DTD de la siguiente manera:

.. code-block:: dtd

   <!ENTITY % nombre_entidad "datos">

Se llaman en la misma DTD, de la siguiente manera:

.. code-block:: dtd

   %nombre_entidad;

Ejemplo:

.. code-block:: dtd

   <!ENTITY % coches "(FIAT | SEAT | AUDI | CITROEN)*">
   <!ELEMENT concesionario (familiares | turismos | deportivos)*>
   <!ELEMENT familiares %coches;>
   <!ELEMENT turismos %coches;>
   <!ELEMENT deportivos %coches;>
