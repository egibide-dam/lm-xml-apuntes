Parsers XML
===========

¿Qué es un Parser?
------------------

Hasta ahora hemos visto cómo crear documentos XML bien formados y definiciones DTD bien construidas. También hemos podido comprobar cómo los navegadores que soportan XML, son capaces de indicar los errores que se producen cuando no se siguen las reglas de sintaxis especificadas para ambos tipos de documentos por separado.

Sin embargo, estos navegadores, no son capaces de cotejar o comprobar que los datos del documento XML cumplen las reglas descritas en su correspondiente DTD.

Los parsers son pequeños programas que se utilizan para validar la relación establecida entre un documento XML y su DTD asociado. Estas aplicaciones se pueden implementar en distintos lenguajes de programación, aunque Java es el que permite utilizarlos en cualquier plataforma y el que más potencia genera.

Existen infinidad de parsers en el mercado con no menos variantes en cuanto a su utilización: desde los que únicamente muestran los resultados de la validación como el XMLint o el Internet Explorer for Validating XML, hasta otros mucho más elaborados que permiten además aplicar hojas de estilos (XSL) o estrategias de transformación (XSLT) tales como el XMLMindFOConverter.

Pero además de estos parsers ya elaborados, los lenguajes de programación más punteros (Java, C#, .NET) permiten utilizar un conjunto de librerías, paquetes o APIs para que los desarrolladores construyan sus propios programas validantes, incorporando toda la potencia y el uso de los recursos de los que cada lenguaje disponga.

Funcionamiento de los Parsers
-----------------------------

La funcionalidad de estas aplicaciones queda clara pero, ¿Cómo puede saber un parser si una cadena concreta pertenece a un lenguaje? Para ello debemos recordar algunos de los conceptos básicos en los que se basan las teorías de gramática y lenguajes finitos, empezando por algunas definiciones:

Lenguaje
   Es el conjunto de todos los elementos (cadenas) que pueden ser generadas a través del uso de ciertas reglas. En nuestra realidad más básica un lenguaje o idioma es el conjunto de frases que siguen una sintaxis y una semántica por medio de las cuales pueden entenderse aquellas personas que saben de estas normas.
Gramática
   Es el conjunto de normas gracias a las cuales se pueden hacer dos cosas:

   1. Generar las cadenas (frases) que pertenecen al lenguaje (idioma).
   2. Determinar si una frase dada pertenece o no a ese lenguaje en concreto.
Alfabeto
   Es el conjunto de unidades léxicas (lexemas) que determinan la posible composición de las cadenas de un lenguaje. Los lenguajes pueden contener el mismo alfabeto, usar alguna variante (incorporación o eliminación) o ser completamente distinto. Por ejemplo, en el lenguaje (idioma) inglés no existen las “ñ” que sí existen en castellano.
Cadena
   Es el elemento del lenguaje que, estando formada por los lexemas de su alfabeto, expresa una idea o concreción de ese lenguaje.

Siguiendo estas definiciones y extrapolándolas al tema que nos concierne diríamos que:

-  El XML, por definición, es una forma estándar de crear lenguajes de etiquetas, por lo que sus especificaciones pueden crear infinitos lenguajes.
-  Un documento XML concreto representa, por tanto, un lenguaje concreto que para tener funcionalidad y sentido precisa de una gramática, un alfabeto y una serie de cadenas.
-  Un DTD o Schema representa el conjunto de reglas que debe seguir un documento XML en concreto, por lo que indican su gramática.
-  Cada bloque de datos contenido en el nodo raíz del documento es una cadena a tratar. Estos bloques, por tanto, deberán seguir las normas establecidas en los DTDs pudiéndose asegurar, en caso de que no se cumplan, que dichos datos no son válidos.
-  El tipo de datos contenidos en cada nodo o etiqueta del documento XML representa el alfabeto a utilizar. Por ejemplo, si un dato es numérico, no aceptará una letra como parte de su alfabeto.

Una vez entendidos los conceptos anteriores tenemos que plantearnos una pregunta: ¿cómo puede saber un parser si una cadena concreta pertenece a un lenguaje?

Existen básicamente 2 modos:

-  Derivar desde el axioma de la gramática correspondiente al lenguaje una a una todas las cadenas del lenguaje hasta que alguna coincida con la que se estudia o bien no se puedan generar más cadenas y ninguna coincida (esto se puede refinar, no obstante, no se aconseja este método, al menos sin refinar).
-  Partir de la cadena e intentar hacer el camino inverso (llegar al axioma) para comprobar si puede ser generada por la gramática partiendo del axioma.

Veamos estas técnicas con un ejemplo. Supongamos el lenguaje de cadenas que contienen un número impar de aes:  

.. code-block:: text

   L a_imp = {a, aaa, aaaaa, ...}

Su gramática o conjunto de reglas es la que se muestra a continuación:  

.. code-block:: text

   S → a    (1)
   S → Saa  (2)

El alfabeto, obviamente, está formado únicamente por la letra ``a``:

.. code-block:: text

   A a_imp = {a}

Y nos preguntan si la cadena ``w=aaaa`` pertenece o no al lenguaje.

Usando nuestra lógica humana sabemos de antemano que ``aaaa`` no tiene un número impar de aes luego no pertenece al lenguaje pero, ¿cómo usa un parser los mecanismos para darse cuenta de eso?

Derivar desde el axioma
~~~~~~~~~~~~~~~~~~~~~~~

El parser va a crear árboles con la estructura de cada posible cadena. Si genera dicha cadena en uno de sus árboles la acepta. Si genera una cadena de longitud mayor a la dada y aún no ha encontrado la cadena, la rechaza.

.. code-block:: text

   S → a                   

   S → Saa → aaa           

   S → Saa → Saaaa → aaaaa

El parser encuentra una cadena de mayor longitud que ``aaaa`` y no se ha generado la buscada, luego la cadena no pertenece al lenguaje.

Partir de la cadena
~~~~~~~~~~~~~~~~~~~

El parser va a intentar reducir las cadenas que aparecen a la parte de la derecha de las reglas de la gramática con su parte izquierda. Si llega al axioma (``S``) la acepta, si no, obviamente, no.

.. code-block:: text

   aaaa  (1)  
   -

   Saaa  (2)
   ---

   Sa    (?)

Como no existe ninguna forma de reducir ``Sa`` (no existe en la parte derecha de ninguna regla), el parser puede asegurar que la cadena no pertenece al lenguaje.

Si por el contrario, la cadena pertenece al lenguaje:

.. code-block:: text

   aaaaa  (1)  
   -

   Saaaa  (2)
   ---

   Saa    (2)
   ---

   S      OK

Tipos de Parsers
----------------

Según la técnica validante utilizada podemos afirmar que existen 2 tipos de parsers:

Parser descendente (*top-down*)
   El que parte del axioma e intenta llegar a la cadena. Corresponde al primer modo. Es sencillo de construir pero no muy eficiente en cuanto a recursos empleados (depende de la sencillez de la gramática). Debemos fijarnos que este tipo de parser crea árboles y guarda la información en sus nodos u hojas lo cual implica consumo de memoria, tiempo de gestión… La ventaja es que todo está guardado al usarse una estructura de datos.
Parser ascendente (*bottom-up*)
   El que parte de la cadena e intenta llegar al axioma. Corresponde al segundo modo. Es más general y consume menos recursos. Sin embargo los datos no se guardan y en caso de que existan reglas ambiguas (que permiten dos caminos) es posible que se precise de un técnica *back-and-go*, lo que implica volver al punto de la ambigüedad y coger el otro camino… y esto de retomar el estado previo es muy costoso por no guardarse los datos.

En cualquier lenguaje de programación existen implementados estos dos tipos de parser (se han creado las clases, paquetes, librerías, etc. para implementarlos). A los que siguen la primera técnica (deducción) se les denomina parsers DOM y a los que siguen la segunda (inducción) se les llama parsers SAX.

Por tanto una de las primeras disyuntivas será elegir el tipo de parser a utilizar, aunque desde este mismo instante debe de quedar claro que ambos pueden hacer exactamente lo mismo. Las diferencias vendrán en cuanto a eficiencia y esfuerzo.

Es preferible usar el descendente (DOM) cuando:

-  Haya que tratar la información del XML: hacer consultas, búsquedas, reorganizaciones.
-  Queramos crear un fichero XML físico a partir de unos datos cargados en memoria.
-  Haya que transformar el documento XML a HTML, PDF, …
-  Las etiquetas que conforman el documento no sean muy numerosas, ya que cada etiqueta va a ser un nodo del árbol.
-  En la gramática haya muchas reglas ambiguas.

Es preferible usar el ascendente (SAX) cuando:

-  Solo se quiere validar si un XML determinado cumple las reglas específicas de su DTD.
-  Haya pocas reglas en el DTD o habiendo muchas ninguna sea ambigua (o pocas de ellas).
-  Los tiempos de respuesta o la capacidad de memoria sean críticos.

Sea como fuere debemos tener en cuenta que un parser sólo estudia si la estructura (la sintaxis) del documento XML es correcta, no su significado. Es decir si estamos trabajando, por ejemplo, con un documento XML de un concesionario de coches, el parser podrá estudiar si existen las etiquetas ``<modelo>``, ``<casa>``, ``<matricula>``, etc. Si están en un orden determinado, si se ha introducido un valor… Pero no será capaz de determinar, por ejemplo si el modelo ``Polo`` pertenece o no a la casa ``SEAT``, o incluso si existe o no el modelo ``Juan``, eso será responsabilidad de la lógica de programación que tendremos que escribir.

Analizar XML con SAX
--------------------

Introducción a SAX
~~~~~~~~~~~~~~~~~~

Hasta ahora hemos trabajado sólo con el lenguaje XML y algunos de sus lenguajes relacionados (DTD, esquema XML o XSLT). Siendo estrictos, todavía no hemos programado con XML, es decir, no hemos realizado programas que trabajen con XML.

La API SAX (o API simple para XML) es el primer punto de unión del mundo de XML con el mundo de la programación en general, y en particular con Java.

Esta API consta de una serie de clases, con sus correspondientes métodos, que nos permiten trabajar con un documento XML desde un programa escrito en Java, pudiendo acceder a los datos, comprobar si está bien formado, si es válido, etc.

La principal característica de SAX es que el documento se lee secuencialmente de principio a fin, sin cargar todo el documento en memoria, lo cual tiene consecuencias positivas y negativas:

-  La ventaja es la eficiencia en cuanto al tiempo y la memoria empleados en el análisis.
-  La desventaja es que con SAX no disponemos de la estructura en árbol de los documentos, luego no podemos modificar ni crear documentos XML, ni recorrerlos jerárquicamente, solamente analizarlos secuencialmente.

El analizador SAX
~~~~~~~~~~~~~~~~~

Para poder trabajar con documentos XML mediante SAX necesitamos un analizador SAX. El analizador realiza el trabajo sucio (detectar cuándo empieza y termina un elemento, gestionar los espacios de nombres, comprobar que el documento está bien formado, etc.), de forma que podamos concentrarnos en los aspectos específicos de nuestra aplicación.

Existen muchos analizadores en el mercado, pero no todos se pueden utilizar desde Java. Para los ejemplo de esta materia utilizaremos el analizador Xerces, del proyecto colaborativo de código abierto Apache.

Para utilizar SAX desde un programa escrito en Java necesitamos conseguir las clases que componen el analizador y asegurarnos de incluir estas clases en la ruta de clases.

Analizar XML con DOM
--------------------

Introducción a DOM
~~~~~~~~~~~~~~~~~~

La API DOM (o Modelo de Objetos de Documento) constituye un paso más alla en el uso de XML desde un lenguaje de programación, y en particular desde Java.

Esta API también consta de una serie de clases y métodos, que nos permiten trabajar con los documentos XML desde nuestros programas escritos en Java.

La principal característica de DOM es que el documento con el que se trabaja se carga entero en memoria, en una estructura de árbol, por lo que la forma de trabajar con DOM es muy distinta a la de SAX:

-  La ventaja es que con DOM, al disponer de la estructura del documento, podemos acceder a los datos en función de la jerarquía de elementos, así como modificar el contenido de los documentos e incluso crearlos desde cero.
-  La desventaja es el coste en tiempo y memoria que conlleva construir el árbol para un documento, sobre todo si tiene cierto tamaño.

El analizador DOM
~~~~~~~~~~~~~~~~~

Para poder trabajar con DOM necesitamos un analizador DOM. El analizador DOM lee un documento XML y genera una estructura en árbol para él, para lo cual se suele apoyar en un analizador SAX.

Para los ejemplos de DOM utilizaremos también el analizador Xerces (dado que ya tenemos sus clases y hemos establecido también la ruta de clases sólo tendremos que importar las clases oportunas para trabajar con DOM).
