Esquemas XML
============

Introducción
------------

XML Schema es un lenguaje de esquema utilizado para describir la estructura y las restricciones de los contenidos de los documentos XML de una forma muy precisa, más allá de las normas sintácticas impuestas por el propio lenguaje XML. Se consigue así una percepción del tipo de documento con un nivel alto de abstracción. Fue desarrollado por el World Wide Web Consortium (W3C) y alcanzó el nivel de recomendación en mayo de 2001.

XML Schema está pensado para proporcionar una mayor potencia expresiva que las DTD, menos capaces al describir los documentos a nivel formal.

Las ventajas que aporta son:

-  Se basa en XML, por lo tanto tiene todas las ventajas de un documento XML.
-  Tiene una gran variedad de tipos de datos.
-  Tiene un modelo de datos abierto.
-  Soporta espacios de nombres (singularidad de los nombres, algo que no podíamos tener con los DTDs).
-  Soporta tipos en los atributos.

Nodo raíz ``schema``
--------------------

Los esquemas mantienen la estructura y la sintaxis de los documentos XML por lo tanto deben tener un nodo raíz y dentro de él contener todo el esquema. Por supuesto debe tener el prólogo (es decir, la definición de la versión XML).

.. code-block:: xml

   <?xml version="1.0" encoding="UTF-8"?>
   <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
     ...
   </xs:schema>

Fíjese en que hace referencia a una URL, esa dirección contiene la definición de todos los elementos y atributos que se pueden utilizar en un esquema. Eso no quiere decir que para programar en XML se necesite estar conectado a Internet. 

Utiliza un atributo ``xmlns`` que significa *XML namespace* para crear un espacio de nombres de XML vinculado a un prefijo que en este caso es ``xs``, pero que puede ser cualquier cosa ya que sólo hace la función de variable (también se usa ``xsd``). Sirve para que cada vez que se utilice un elemento o tipo de esa “librería” se le ponga ese prefijo, en el caso de que se utilizasen más referencias a otras URLs se distinguiría claramente los elementos de cada uno de ellos por medio de los prefijos.

Utilizando este atributo ``xmlns``, crea un espacio de nombres para cada URL referenciada, así si hubiese dos elementos con el mismo nombre se diferencian claramente.

Declaración de elementos
------------------------

Tipos de elementos
~~~~~~~~~~~~~~~~~~

Existen tres tipos de elementos a definir en un esquema:

Elementos estándar
   Sin hijos y sin restricciones ni atributos.
Elementos simples
   Elementos sin hijos pero con restricciones y sin atributos.
Elementos complejos
   Elementos con hijos y/o atributos.

.. figure:: /imagenes/40_esquemas_xml/personal_interno.png
   :scale: 60 %
   :align: center

   Jerarquía de ejemplo.

En este ejemplo tenemos los siguientes tipos de elementos:

-  Elementos complejos: ``PERSONAL`` e ``INTERNO`` (con hijos).
-  Elementos simples: ``TELEFONO`` y ``DIRECCIÓN`` (con restricciones).
-  Elementos estándar: ``NOMBRE`` (sin hijos ni restricciones).

Estructuras
~~~~~~~~~~~

Las dos estructuras posibles son:

.. code-block:: xml

   <xs:element name="nombre_del_elemento" type="tipo" />

Esta estructura es vacía, es decir se define un nombre de elemento y un tipo, el tipo puede ser un estándar de XML o un tipo definido por nosotros que describiría aquellos elementos que tengan hijos (complejos o aquellos elementos que no tienen hijos pero tienen restricciones).

Seguido de esta definición vendría debajo la definición del tipo. Esta estructura es la más aconsejable pero no la única.

.. code-block:: xml

   <xs:element name="nombre_del_elemento">
     ...
   </xs:element>

Esta estructura sería equivalente a la anterior sólo que en este caso no se pone el tipo del elemento como atributo sino que esa definición se haría entre las etiquetas de inicio y cierre de ``element``.

Puede contener atributos cuyos valores siempre van entre comillas:

``name``
   Nombre del elemento.
``type``
   Tipo simple predefinido, ya sean los estándares o unos propios.
``maxOccurs``
   Número máximo de veces que puede aparecer ``[0..unbounded]``.
``minOccurs``
   Número mínimo de veces que puede aparecer.
``ref``
   Para importar de otros esquemas o hacer referencia a un elemento ya declarado anteriormente en este mismo esquema.

.. note::

   Sin poner ``maxOccurs`` ni ``minOccurs``, este elemento aparece siempre exactamente una sola vez.

Tipos de datos
~~~~~~~~~~~~~~

En las dos tablas siguientes se enumeran los tipos de datos primitivos y derivados que podemos usar en los esquemas XML.

Primitivos
^^^^^^^^^^

+------------------------------------+---------------------------------+
| Tipo de dato                       | Descripción                     |
+====================================+=================================+
| ``string``                         | Representa cadenas de           |
|                                    | caracteres.                     |
+------------------------------------+---------------------------------+
| ``boolean``                        | Representa valores booleanos,   |
|                                    | que son ``true`` o ``false``.   |
+------------------------------------+---------------------------------+
| ``decimal``                        | Representa números de precisión |
|                                    | arbitraria.                     |
+------------------------------------+---------------------------------+
| ``float``                          | Representa números de punto     |
|                                    | flotante de 32 bits de          |
|                                    | precisión simple.               |
+------------------------------------+---------------------------------+
| ``double``                         | Representa números de punto     |
|                                    | flotante de 64 bits de doble    |
|                                    | precisión.                      |
+------------------------------------+---------------------------------+
| ``duration``                       | Representa una duración de      |
|                                    | tiempo. El modelo de            |
|                                    | ``duration`` es                 |
|                                    | ``PnYnMnDTnHnMnS``, donde       |
|                                    | ``nY`` representa el número de  |
|                                    | años, ``nM`` el número de       |
|                                    | meses, ``nD`` el número de      |
|                                    | días, ``T`` el separador de     |
|                                    | fecha y hora, ``nH`` el número  |
|                                    | de horas, ``nM`` el número de   |
|                                    | minutos y ``nS`` el número de   |
|                                    | segundos.                       |
+------------------------------------+---------------------------------+
| ``dateTime``                       | Representa una instancia        |
|                                    | específica de tiempo. El modelo |
|                                    | de ``dateTime`` es              |
|                                    | ``CCYY-MM-DDThh:mm:ss`` donde   |
|                                    | ``CC`` representa el siglo,     |
|                                    | ``YY`` el año, ``MM`` el mes y  |
|                                    | ``DD`` el día, precedido por un |
|                                    | carácter negativo (``-``)       |
|                                    | inicial opcional para indicar   |
|                                    | un número negativo. Si se omite |
|                                    | el carácter negativo, se supone |
|                                    | positivo (``+``). La ``T`` es   |
|                                    | el separador de fecha y hora, y |
|                                    | ``hh``, ``mm`` y ``ss``         |
|                                    | representan la hora, minutos y  |
|                                    | segundos, respectivamente. Se   |
|                                    | pueden utilizar dígitos         |
|                                    | adicionales para aumentar la    |
|                                    | precisión de los segundos       |
|                                    | decimales, si se desea. Por     |
|                                    | ejemplo, se admite el formato   |
|                                    | ``ss.ss...`` con cualquier      |
|                                    | número de dígitos después del   |
|                                    | separador decimal. Es opcional  |
|                                    | la parte de segundos decimales. |
+------------------------------------+---------------------------------+
| ``time``                           | Representa una instancia de     |
|                                    | tiempo que se repite cada día.  |
|                                    | El modelo de ``time`` es        |
|                                    | ``hh:mm:ss.sss`` con un         |
|                                    | indicador opcional de zona      |
|                                    | horaria.                        |
+------------------------------------+---------------------------------+
| ``date``                           | Representa una fecha de         |
|                                    | calendario. El modelo de        |
|                                    | ``date`` es ``CCYY-MM-DD`` con  |
|                                    | un indicador opcional de zona   |
|                                    | horaria como el de              |
|                                    | ``dateTime``.                   |
+------------------------------------+---------------------------------+
| ``hexBinary``                      | Representa datos binarios       |
|                                    | arbitrarios codificados en      |
|                                    | hexadecimal. ``hexBinary`` es   |
|                                    | el conjunto de secuencias de    |
|                                    | longitud finita de octetos      |
|                                    | binarios. Cada octeto binario   |
|                                    | se codifica como una tupla de   |
|                                    | caracteres que se compone de    |
|                                    | dos dígitos hexadecimales       |
|                                    | (``[0-9a-fA-F]``) y representa  |
|                                    | el código del octeto.           |
+------------------------------------+---------------------------------+
| ``base64Binary``                   | Representa datos binarios       |
|                                    | arbitrarios codificados en      |
|                                    | Base64. ``base64Binary`` es el  |
|                                    | conjunto de secuencias de       |
|                                    | longitud finita de octetos      |
|                                    | binarios.                       |
+------------------------------------+---------------------------------+
| ``anyURI``                         | Representa un identificador URI |
|                                    | como lo define RFC 2396. Un     |
|                                    | valor ``anyURI`` puede ser      |
|                                    | absoluto o relativo, y puede    |
|                                    | tener un identificador de       |
|                                    | fragmento opcional.             |
+------------------------------------+---------------------------------+
| ``QName``                          | Representa un nombre completo,  |
|                                    | que se compone de un prefijo y  |
|                                    | un nombre local separados por   |
|                                    | un signo de dos puntos. Tanto   |
|                                    | el prefijo como los nombres     |
|                                    | locales deben ser un NCName. El |
|                                    | prefijo debe estar asociado con |
|                                    | una referencia a un             |
|                                    | identificador URI de espacio de |
|                                    | nombres, mediante una           |
|                                    | declaración de espacio de       |
|                                    | nombres.                        |
+------------------------------------+---------------------------------+
| ``NOTATION``                       | Representa un conjunto de       |
|                                    | ``QName``.                      |
+------------------------------------+---------------------------------+

Derivados
^^^^^^^^^

+------------------------------------+---------------------------------+
| Tipo de dato                       | Descripción                     |
+====================================+=================================+
| ``normalizedString``               | Representa cadenas normalizadas |
|                                    | de espacios en blanco. Este     |
|                                    | tipo de datos se deriva de      |
|                                    | ``string``.                     |
+------------------------------------+---------------------------------+
| ``token``                          | Representa cadenas convertidas  |
|                                    | en símbolos. Este tipo de datos |
|                                    | se deriva de                    |
|                                    | ``normalizedString``.           |
+------------------------------------+---------------------------------+
| ``language``                       | Representa identificadores de   |
|                                    | lenguaje natural (definidos por |
|                                    | RFC 1766). Este tipo de datos   |
|                                    | se deriva de ``token``.         |
+------------------------------------+---------------------------------+
| ``IDREFS``                         | Representa el tipo de atributo  |
|                                    | ``IDREFS``. Contiene un         |
|                                    | conjunto de valores de tipo     |
|                                    | ``IDREF``.                      |
+------------------------------------+---------------------------------+
| ``ENTITIES``                       | Representa el tipo de atributo  |
|                                    | ``ENTITIES``. Contiene un       |
|                                    | conjunto de valores de tipo     |
|                                    | ``ENTITY``.                     |
+------------------------------------+---------------------------------+
| ``NMTOKEN``                        | Representa el tipo de atributo  |
|                                    | ``NMTOKEN``. ``NMTOKEN`` es un  |
|                                    | conjunto de caracteres de       |
|                                    | nombres (letras, dígitos y      |
|                                    | otros caracteres) en cualquier  |
|                                    | combinación. A diferencia de    |
|                                    | ``Name`` y ``NCName``,          |
|                                    | ``NMTOKEN``, no tiene           |
|                                    | restricciones del carácter      |
|                                    | inicial. Este tipo de datos se  |
|                                    | deriva de ``token``.            |
+------------------------------------+---------------------------------+
| ``NMTOKENS``                       | Representa el tipo de atributo  |
|                                    | ``NMTOKENS``. Contiene un       |
|                                    | conjunto de valores de tipo     |
|                                    | ``NMTOKEN``.                    |
+------------------------------------+---------------------------------+
| ``Name``                           | Representa nombres en XML.      |
|                                    | ``Name`` es un símbolo que      |
|                                    | empieza con una letra, carácter |
|                                    | de subrayado o signo de dos     |
|                                    | puntos, y continúa con          |
|                                    | caracteres de nombre (letras,   |
|                                    | dígitos y otros caracteres).    |
|                                    | Este tipo de datos se deriva de |
|                                    | ``token``.                      |
+------------------------------------+---------------------------------+
| ``NCName``                         | Representa nombres sin el signo |
|                                    | de dos puntos. Este tipo de     |
|                                    | datos es igual que ``Name``,    |
|                                    | excepto en que no puede empezar |
|                                    | con el signo de dos puntos.     |
|                                    | Este tipo de datos se deriva de |
|                                    | ``Name``.                       |
+------------------------------------+---------------------------------+
| ``ID``                             | Representa el tipo de atributo  |
|                                    | ``ID`` definido en la           |
|                                    | recomendación de XML 1.0. El    |
|                                    | ``ID`` no debe incluir un signo |
|                                    | de dos puntos (como ``NCName``) |
|                                    | y debe ser único en el          |
|                                    | documento XML. Este tipo de     |
|                                    | datos se deriva de ``NCName``.  |
+------------------------------------+---------------------------------+
| ``IDREF``                          | Representa una referencia a un  |
|                                    | elemento que tiene un atributo  |
|                                    | ``ID`` que coincide con el      |
|                                    | ``ID`` especificado. ``IDREF``  |
|                                    | debe ser un ``NCName`` y tener  |
|                                    | un valor de un elemento o       |
|                                    | atributo de tipo ``ID`` dentro  |
|                                    | del documento XML. Este tipo de |
|                                    | datos se deriva de ``NCName``.  |
+------------------------------------+---------------------------------+
| ``ENTITY``                         | Representa el tipo de atributo  |
|                                    | ``ENTITY`` definido en la       |
|                                    | recomendación de XML 1.0. Es    |
|                                    | una referencia a una entidad    |
|                                    | sin analizar con un nombre que  |
|                                    | coincide con el especificado.   |
|                                    | ``ENTITY`` debe ser un          |
|                                    | ``NCName`` y declararse en el   |
|                                    | esquema como nombre de entidad  |
|                                    | sin analizar. Este tipo de      |
|                                    | datos se deriva de ``NCName``.  |
+------------------------------------+---------------------------------+
| ``integer``                        | Representa una secuencia de     |
|                                    | dígitos decimales con un signo  |
|                                    | inicial (``+`` o ``-``)         |
|                                    | opcional. Este tipo de datos    |
|                                    | deriva de ``decimal``.          |
+------------------------------------+---------------------------------+
| ``nonPositiveInteger``             | Representa un número entero     |
|                                    | menor o igual que cero.         |
|                                    | ``nonPositiveInteger`` consta   |
|                                    | de un signo negativo (``-``) y  |
|                                    | una secuencia de dígitos        |
|                                    | decimales. Este tipo de datos   |
|                                    | se deriva de ``integer``.       |
+------------------------------------+---------------------------------+
| ``negativeInteger``                | Representa un número entero     |
|                                    | menor que cero. Consta de un    |
|                                    | signo negativo (``-``) y una    |
|                                    | secuencia de dígitos decimales. |
|                                    | Este tipo de datos se deriva de |
|                                    | ``nonPositiveInteger``.         |
+------------------------------------+---------------------------------+
| ``long``                           | Representa un número entero con |
|                                    | un valor mínimo de              |
|                                    | -9223372036854775808 y un valor |
|                                    | máximo de 9223372036854775807.  |
|                                    | Este tipo de datos se deriva de |
|                                    | ``integer``.                    |
+------------------------------------+---------------------------------+
| ``int``                            | Representa un número entero con |
|                                    | un valor mínimo de -2147483648  |
|                                    | y un valor máximo de            |
|                                    | 2147483647. Este tipo de datos  |
|                                    | se deriva de ``long``.          |
+------------------------------------+---------------------------------+
| ``short``                          | Representa un número entero con |
|                                    | un valor mínimo de -32768 y un  |
|                                    | valor máximo de 32767. Este     |
|                                    | tipo de datos se deriva de      |
|                                    | ``int``.                        |
+------------------------------------+---------------------------------+
| ``byte``                           | Representa un número entero con |
|                                    | un valor mínimo de -128 y un    |
|                                    | valor máximo de 127. Este tipo  |
|                                    | de datos se deriva de           |
|                                    | ``short``.                      |
+------------------------------------+---------------------------------+
| ``nonNegativeInteger``             | Representa un número entero     |
|                                    | mayor o igual que cero. Este    |
|                                    | tipo de datos se deriva de      |
|                                    | ``integer``.                    |
+------------------------------------+---------------------------------+
| ``unsignedLong``                   | Representa un número entero con |
|                                    | un valor mínimo de cero y un    |
|                                    | valor máximo de                 |
|                                    | 18446744073709551615. Este tipo |
|                                    | de datos se deriva de           |
|                                    | ``nonNegativeInteger``.         |
+------------------------------------+---------------------------------+
| ``unsignedInt``                    | Representa un número entero con |
|                                    | un valor mínimo de cero y un    |
|                                    | valor máximo de 4294967295.     |
|                                    | Este tipo de datos se deriva de |
|                                    | ``unsignedLong``.               |
+------------------------------------+---------------------------------+
| ``unsignedShort``                  | Representa un número entero con |
|                                    | un valor mínimo de cero y un    |
|                                    | valor máximo de 65535. Este     |
|                                    | tipo de datos se deriva de      |
|                                    | ``unsignedInt``.                |
+------------------------------------+---------------------------------+
| ``unsignedByte``                   | Representa un número entero con |
|                                    | un valor mínimo de cero y un    |
|                                    | valor máximo de 255. Este tipo  |
|                                    | de datos se deriva de           |
|                                    | ``unsignedShort``.              |
+------------------------------------+---------------------------------+
| ``positiveInteger``                | Representa un número entero     |
|                                    | mayor que cero. Este tipo de    |
|                                    | datos se deriva de              |
|                                    | ``nonNegativeInteger``.         |
+------------------------------------+---------------------------------+

Tipo complejo: ``complexType``
------------------------------

Sirve para definir elementos que tienen sub-elementos y/o atributos.

.. code-block:: xml

   <xs:complexType name="nombre_del_tipo_complejo">
     <xs:sequence> <!-- sequence/all/choice -->
       ... subelementos ...
     </xs:sequence>
     ... atributos ...
   </xs:complexType>

Puede contener elementos secundarios:

``sequence``
   Implica que deben aparecer todos los elementos y en ese orden (AND).
``all``
   Implica que deben aparecer todos los elementos, sin importar el orden.
``choice``
   Implica que sólo debe aparecer uno de esos elementos (OR).
``attribute``
   Para definir atributos.

Puede tener los siguientes atributos:

``name``
   Nombre del tipo complejo.
``mixed``
   Puede tener dos valores ``true`` o ``false``.
``type``
   Tipo de datos con el que se identifica.

Dos posibles estructuras:

-  La primera contiene al tipo dentro de la estructura ``element``:

   .. code-block:: xml

      <xs:element name="contacto">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="destinatario" type="xs:string" />
            <xs:element name="remitente" type="xs:string" />
            <xs:element name="titulo" type="xs:string" />
            <xs:element name="contenido" type="xs:string" />
          </xs:sequence>
          <xs:attribute name="fecha" type="xs:date"/>
        </xs:complexType>
      </xs:element>

-  La segunda estructura lo que hace es primero definir el elemento con un tipo, y después definir fuera ese tipo:

   .. code-block:: xml

      <xs:element name="contacto" type="tipo_contacto"/>

      <xs:complexType name="tipo_contacto">
        <xs:sequence>
          <xs:element name="destinatario" type="xs:string" />
          <xs:element name="remitente" type="xs:string" />
          <xs:element name="titulo" type="xs:string" />
          <xs:element name="contenido" type="xs:string" />
        </xs:sequence>
        <xs:attribute name="fecha" type="xs:date"/>
      </xs:complexType>

.. note::

   La mejor opción es la segunda porque permite reutilizar ese tipo para otros elementos. Además los parsers toleran mejor esta estructura.

Elementos ``sequence``, ``all`` y ``choice``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Estos tres elementos nunca se utilizan juntos, aparece tan sólo uno de ellos en el elemento ``complexType``. Sirve para describir en qué orden y cómo deben aparecer los subelementos del ``complexType``.

Es equivalente a, en el DTD, poner comas o barras verticales en la descripción de un elemento con hijos.

``sequence``
^^^^^^^^^^^^

Este elemento indica que es obligatorio que aparezcan todos los elementos especificados y en el orden en que se definen. Es el equivalente a un AND.

En este ejemplo se define el elemento ``libro``, con tres subelementos obligatorios y que deben aparecer exactamente en este orden (1º ``titulo``, 2º ``autor`` y 3º ``editorial``) y no aparecen es este orden o uno de ellos no aparece, el parser produciría un error.

.. code-block:: xml

   <xs:element name="libro" type="tipo_libro"/>

   <xs:complexType name="tipo_libro">
     <xs:sequence>
       <xs:element name="titulo" type="xs:string" />
       <xs:element name="autor" type="xs:string" />
       <xs:element name="editorial" type="xs:string" />
     </xs:sequence>
   </xs:complexType>

   <libro>
     <titulo>El señor de los anillos</titulo>
     <autor>John Ronald Ruelen Tolkien</autor>
     <editorial>Tirant Lo Blanch</editorial>
   </libro>

``all``
^^^^^^^

Este elemento indica que es obligatorio que aparezcan todos los elementos especificados y pero NO en el orden en que se definen.

En este ejemplo se define el elemento ``libro``, con tres subelementos obligatorios.

.. code-block:: xml

   <xs:element name="libro" type="tipo_libro"/>

   <xs:complexType name="tipo_libro">
     <xs:all>
       <xs:element name="titulo" type="xs:string" />
       <xs:element name="autor" type="xs:string" />
       <xs:element name="editorial" type="xs:string" />
     </xs:all>
   </xs:complexType>

   <libro>
     <titulo>El señor de los anillos</titulo>
     <editorial>Tirant Lo Blanch</editorial>
     <autor>John Ronald Ruelen Tolkien</autor>
   </libro>

``choice``
^^^^^^^^^^

Este elemento indica que de todos los elementos especificados sólo debe aparecer uno de ellos. Es el equivalente al OR.

En este ejemplo se define el elemento ``libro``, con tres posibles subelementos. Puede tener o un ``titulo`` o un ``autor`` o una ``editorial``.

.. code-block:: xml

   <xs:element name="libro" type="tipo_libro"/>

   <xs:complexType name="tipo_libro">
     <xs:choice>
       <xs:element name="titulo" type="xs:string" />
       <xs:element name="autor" type="xs:string" />
       <xs:element name="editorial" type="xs:string" />
     </xs:choice>
   </xs:complexType>

   <libro>
     <titulo>El señor de los anillos</titulo>
   </libro>

Elemento ``attribute``
~~~~~~~~~~~~~~~~~~~~~~

Para definir los atributos de un elemento o tipo de elemento utilizamos la siguiente estructura:

.. code-block:: xml

   <xs:attribute name="nombre_atributo" type="tipo_atributo" use="modificador" />

Puede contener los siguientes atributos:

``name``
   Es el nombre del atributo.
``type``
   Es el tipo del atributo.
``use``
   Para definir si es un atributo obligatorio u opcional. Para definir un atributo como obligatorio le asignaremos el valor ``required``. Por defecto es opcional.

La localización del atributo no puede ir por sí solo, ya que con esta estructura no sabríamos a que elemento se refiere. Para ello se pone siempre dentro de una estructura ``complexType``.

Tipo simple: ``simpleType``
--------------------------

Un tipo simple sirve para definir una serie de restricciones a un elemento o a un atributo. Es muy útil para definir rangos, tipos enumerados, etc.

.. code-block:: xml

   <xs:simpleType name="nombre_del_tipo_simple">
     <xs:restriction>
       ... restricciones ...
     </xs:restriction>
   </xs:simpleType>

Puede contener elementos secundarios:

``restriction``
   Para poner rangos, patrones, enumerar posibles valores etc.
``list``
   Para definir un tipo de lista.
``union``
   Para unir varios tipos definidos anteriormente en uno.

Puede contener atributos:

``name``
   Para poner el nombre al tipo simple.

Elemento ``restriction``
~~~~~~~~~~~~~~~~~~~~~~~~

Se utiliza para poner rangos, patrones enumerar posibles valores, etc.

.. code-block:: xml

   <xs:restriction base="xs:string">
     <xs:nombre_restriccion value=""/>
   </xs:restriction>

Tiene el atributo ``base``. Es el tipo predefinido de datos sobre el que se construye la restricción.

Puede contener las siguientes restricciones:

``enumeration``
   Se ponen los valores que puede tomar el elemento.
``maxExclusive``, ``minExclusive``
   Valores mínimos o máximos que puede tomar el elemento, sin incluir el último valor.
``maxInclusive``, ``minInclusive``
   Valores mínimos o máximos que puede tomar el elemento, incluyendo el último valor.
``pattern``
   Expresión regular que expresa la restricción.

   .. code-block:: xml

      <xs:pattern value="([a-zA-Z0-9])*"/>

   En este caso decimos que el patrón es de longitud indefinida, y que puede contener letras mayúsculas, minúsculas y números.

   .. code-block:: xml

      <xs:pattern value="\d{2}-\d{4}"/>

   En este caso decimos que el patrón es de dos dígitos seguido de un guión y otros 4 dígitos. Por ejemplo, 25-6789.
``length``, ``maxLength``, ``minLength``
   Longitud de un elemento de tipo texto.
``totalDigits``
   Número exacto de dígitos permitidos.
``fractionDigits``
   Número máximo de decimales permitidos.

También en este caso hay dos posibles estructuras:

-  La primera contiene al tipo dentro de la estructura element:

   .. code-block:: xml

      <xs:element name="lista_de_enteros">
        <xs:simpleType>
          <xs:restriction base="xs:integer">
            <xs:minInclusive value="100"/>
            <xs:maxInclusive value="200"/>
          </xs:restriction>
        </xs:simpleType>
      </xs:element>

-  La segunda estructura lo que hace es 1º definir el elemento con un
   tipo, y después definir fuera ese tipo:

   .. code-block:: xml

      <xs:element name="lista_de_enteros" type="tipo_lista_enteros"/>

      <xs:simpleType name="tipo_lista_enteros">
        <xs:restriction base="xs:integer">
          <xs:minInclusive value="100"/>
          <xs:maxInclusive value="200"/>
        </xs:restriction>
      </xs:simpleType>

.. note::

   La mejor opción es la segunda porque permite reutilizar ese tipo para otros elementos. Además los parsers toleran mejor esta estructura.

Ejemplos de restricciones
^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: xml

   <xs:element name="sexo" type="tipo_sexo"/>

   <xs:simpleType name="tipo_sexo">
     <xs:restriction base="xs:string">
       <xs:enumeration value="mujer"/>
       <xs:enumeration value="hombre"/>
     </xs:restriction>
   </xs:simpleType>  

.. code-block:: xml

   <xs:element name="codigo_postal" type="tipo_cp"/>

   <xs:simpleType name="tipo_cp">
     <xs:restriction base="xs:string">
       <xs:length value="5"/>
     </xs:restriction>
   </xs:simpleType>

.. code-block:: xml

   <xs:element name="password" type="tipo_password"/>

   <xs:simpleType name="tipo_password">
     <xs:restriction base="xs:string">
       <xs:pattern value="\d{3}-[A-Z]{2}"/>
     </xs:restriction>
   </xs:simpleType>

Elemento ``list``
~~~~~~~~~~~~~~~~~~~~~~~~

Permite definir un tipo simple compuesto por una lista de otros tipos simples separados siempre por espacios:

.. code-block:: xml

   <xs:simpleType name="lista_numeros">
     <xs:list itemType="xs:integer"/>
   </xs:simpleType>

Elemento ``union``
~~~~~~~~~~~~~~~~~~~~~~~~

Permite combinar varios tipos simples en uno solo:

.. code-block:: xml

   <xs:simpleType name="entero_o_fecha">
     <xs:union memberTypes="xs:integer xs:date"/>
   </xs:simpleType>

Extender un tipo
----------------

Utilizando ``xs:extension`` podemos ampliar un ``simpleType`` o ``complexType``, añadiendo elementos o atributos extra a un tipo base definido anteriormente.

.. code-block:: xml

   <xs:complexType name="tipo_persona">
     <xs:sequence>
       <xs:element name="nombre" type="xs:string"/>
       <xs:element name="edad" type="xs:integer"/>
     </xs:sequence>
     <xs:attribute name="id" type="xs:integer"/>
   </xs:complexType>

   <xs:complexType name="tipo_contacto">
     <xs:complexContent>
       <xs:extension base="tipo_persona">
         <xs:sequence>
           <xs:element name="email" type="xs:string"/>
           <xs:element name="telefono" type="xs:string"/>
         </xs:sequence>
       </xs:extension>
     </xs:complexContent>
   </xs:complexType>

Elementos sin subelementos
--------------------------

Mediante ``simpleContent`` podemos definir un elemento que solo pueda contener texto y atributos, no subelementos.

.. code-block:: xml

   <xs:complexType name="tipo_documento">
     <xs:simpleContent>
       <xs:extension base="xs:string">
         <xs:attribute name="plantilla" type="xs:string" use="required"/>
         <xs:attribute name="revisado" type="xs:boolean" default="false"/>
       </xs:extension>
     </xs:simpleContent>
   </xs:complexType>

Elementos vacíos
----------------

Para definir un elemento vacío, que no pueda tener ni texto ni subelementos, basta con no poner ningún subelemento en la declaración del tipo:

.. code-block:: xml

   <xs:complexType name="tipo_evento">
     <xs:attribute name="nombre" type="xs:string" use="required"/>
     <xs:attribute name="activo" type="xs:boolean" default="false"/>
   </xs:complexType>

Convertir DTDs en esquemas XML
------------------------------

En un principio, con la creación de XML, se empezó empleando las DTDs como modo de especificación de modelos; la existencia de más herramientas para ello hizo que gran parte de las empresas que empezaron a trabajar con XML adoptasen el uso de las DTDs. Actualmente el uso de estas ha quedado más restringido en su uso, y se está empezando a desarrollar de acuerdo al estándar de XML Schema; por ello, a continuación, presentaremos las transformaciones que deberían realizarse para convertir una DTD en un Schema.

En principio mostraremos a que elemento de XML Schema corresponden que elementos de las DTDs, aunque existen herramientas de traducción (DTD2HTML en Perl, XMLSpy, …) entre estos dos lenguajes, la siguiente tabla intenta expresar como funciona con el fin de una mejor comprensión.

+----------------------+----------------------+--------------------------------+
| DTD                  | Schema               | Comentarios                    |
+======================+======================+================================+
| ``ELEMENT``          | ``<element>``        | Crea un vínculo entre un       |
|                      |                      | nombre y unos atributos,       |
|                      |                      | modelos de contenido y         |
|                      |                      | anotaciones.                   |
+----------------------+----------------------+--------------------------------+
| ``#PCDATA``          |                      | Soportado como parte de un     |
|                      |                      | tipo simple                    |
+----------------------+----------------------+--------------------------------+
| ``ANY``              | ``<any>``            | Posee distintos comodines para |
|                      |                      | un mayor conjunto de           |
|                      |                      | posibilidades. Existe también  |
|                      |                      | ``<anyAttribute>`` con         |
|                      |                      | comodines similares.           |
+----------------------+----------------------+--------------------------------+
| ``EMPTY``            | Soportado            | Se elimina la existencia de    |
|                      |                      | elementos descendientes del    |
|                      |                      | actual, diferenciando de la    |
|                      |                      | presencia de un string vacío   |
|                      |                      | en un elemento.                |
+----------------------+----------------------+--------------------------------+
| Modelo de            | ``<complexType>``    |                                |
| contenido            |                      |                                |
+----------------------+----------------------+--------------------------------+
| Conector de          | ``<sequence>``       |                                |
| secuencia            |                      |                                |
| (``,``)              |                      |                                |
+----------------------+----------------------+--------------------------------+
| Conector de          | ``<choice>``         |                                |
| alternativa          |                      |                                |
| (``|``)              |                      |                                |
+----------------------+----------------------+--------------------------------+
| Opcional             | Soportado            | Se han de emplear los          |
| (``?``)              |                      | atributos predefinidos de      |
|                      |                      | ``maxOccurs`` y ``minOccurs``  |
+----------------------+----------------------+--------------------------------+
| Requerido y          | Soportado            | Se han de emplear los          |
| Repetible            |                      | atributos predefinidos de      |
| (``+``)              |                      | ``maxOccurs`` y ``minOccurs``  |
+----------------------+----------------------+--------------------------------+
| Opcional y           | Soportado            | Se han de emplear los          |
| Repetible            |                      | atributos predefinidos de      |
| (``*``)              |                      | ``maxOccurs`` y ``minOccurs``  |
+----------------------+----------------------+--------------------------------+
| ``ATTLIST``          | ``<attributeGroup>`` | Se pueden agrupar              |
|                      |                      | declaraciones de               |
|                      |                      | ``<attributes>``               |
+----------------------+----------------------+--------------------------------+
| Tipo de              | Tipos                |                                |
| atributo             | ``<simpleType>``     |                                |
| ``CDATA``,           | predefinidos         |                                |
| ``ID``,              |                      |                                |
| ``IDREF``,           |                      |                                |
| ``NOTATION``         |                      |                                |
| ,                    |                      |                                |
| …                    |                      |                                |
+----------------------+----------------------+--------------------------------+
| ``ENTITY``           | No soportado         | Las entidades son declaradas   |
|                      |                      | en declaraciones de marcas en  |
|                      |                      | el XML.                        |
+----------------------+----------------------+--------------------------------+
| ``ENTITY%Parameter`` | No soportada         |                                |
+----------------------+----------------------+--------------------------------+

Utilización del esquema
-----------------------

Para utilizar el esquema desde un documento XML, tenemos que tener en cuenta si está en nuestro sistema de ficheros local o es un esquema público.

-  En caso de que el esquema esté en un sitio público:

   .. code-block:: xml

      <nodo_raiz xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.miempresa.com/mi_esquema.xsd">

-  En caso de que el esquema esté en local:

   .. code-block:: xml

      <nodo_raiz xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="mi_esquema.xsd">
