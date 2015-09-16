# Sintaxis de XML  

## Estructura del documento XML  

```
Declaración / Versión XML
Nodo raíz
  Sub - elementos
  ...
Cierre del nodo raíz   
```

### Declaración XML  

Define la versión XML del documento. En esta caso conforme a la especificación 1.0 de XML:

![Declaración XML](imagenes/PROGRAMACION_XML_html_m2bbf1b67.png)

Esta etiqueta tiene los siguientes atributos:

`version`
: Obligatorio a no ser que este ya incluido en otro documento.

`encoding`
: Opcional. Es la codificación de los caracteres del documento.

`standalone`
: Opcional. Indica si un documento va acompañado de un DTD o no lo necesita. (No tiene DTD asociado "yes")

### Nodo raíz

Todos los elementos de un documento XML deben estar contenidos entre las etiquetas de apertura y cierre del nodo raíz. Es decir, del nodo "padre" que contiene a todos los demás como si fuera una estructura de árbol.

### Sub-elementos hijo

Contendrá todos los elementos con sus datos y atributos.

### Final del elemento raíz

Como todas las etiquetas deben tener su etiqueta de cierre, el nodo raíz también.

## Elementos XML  

### Todos los elementos deben tener una etiqueta de cierre

En XML es sintácticamente ilegal omitir la etiqueta de cierre. Aunque en HTML, algunos elementos no tienen etiqueta de cierre; el siguiente ejemplo sería válido en HTML:

```html
<p>Esto es un mensaje.
<p>Enviado de Pedro a Elisa.
```

Sin embargo, en XML todos los elementos deben tener etiqueta de cierre:

```xml
<p>Esto es un mensaje.</p>
<p>Enviado de Pedro a Elisa. </p>
```

En el caso de elementos vacíos, se admite una única etiqueta en lugar del par de etiquetas de apertura - cierre. En esos casos, la etiqueta debe escribirse como `<etiqueta />` (carácter de etiqueta de cierre después del nombre de la etiqueta)  

> La declaración del documento XML no tiene etiqueta de cierre. No es un error, simplemente la declaración no forma parte del documento XML y no debe tener etiqueta de cierre.

```xml
<?xml version="1.0" encoding="ISO-8859-1" standalone="yes" ?>
```

### Las etiquetas son sensibles a mayúsculas / minúsculas  

A diferencia de HTML, XML distingue entre mayúsculas y minúsculas:

```xml
<Mensaje>Esto NO es correcto </mensaje>
<mensaje>Esto SI es correcto </mensaje>
```

### Todas las etiquetas deben estar correctamente anidadas  

El anidamiento incorrecto de etiquetas no tiene sentido en XML. Aunque en HTML algunos elementos pueden anidarse de forma incorrecta:

```html
<b><i>Este texto se ve en letra cursiva y negrita</b></i>
```

Todas las etiquetas deben anidarse correctamente:

```xml
<b><i>Este texto se ve en letra cursiva y negrita</i></b>
```

### Los documentos XML deben tener una etiqueta "raíz"  

La primera etiqueta en un documento XML es la etiqueta raíz. Todos los
documentos XML deben contener un par de etiquetas para definir el
elemento raíz.

### Cada elemento puede contener elementos hijos  

Estos deben tener la siguiente estructura:

```xml
<raiz>
  <hijo>
    <nieto> ... </nieto>
  </hijo>
</raiz>
```

### Los valores de los atributos de una etiqueta deben estar siempre entrecomillados  

Las etiquetas XML pueden tener atributos con el formato:

```xml
<elemento atributo="valor"> ... </elemento>
```

### El valor del atributo debe estar obligatoriamente entrecomillado.

En los ejemplos siguientes podemos ver la sintaxis correcta e incorrecta de un documento XML.

Este primer ejemplo es incorrecto porque los valores de los atributos no están entrecomillados:

![](imagenes/PROGRAMACION_XML_html_f06b734.png)

![](imagenes/PROGRAMACION_XML_html_m7f102dc6.png)

Aquí vemos el mismo ejemplo pero con una sintaxis correcta; los atributos de la etiqueta `<nota>` están delimitados por comillas:

![](imagenes/PROGRAMACION_XML_html_6ee40c3a.png)

![](imagenes/PROGRAMACION_XML_html_me0b402c.png)

### Conservación de espacios en XML  

En XML los espacios en blanco se conservan, no son truncados a un espacio único, a diferencia de HTML, donde los espacios en blanco seguidos, así como caracteres de tabulación y saltos de línea son comprimidos a un único espacio en blanco.

### Formato de ficheros XML  

Son ficheros de texto plano. Esto permite trabajar con ellos desde cualquier editor de texto ASCII (por ejemplo bloc de notas)

### Los elementos de XML son extensibles  

Los documentos XML pueden ampliarse para incluir más información. Vamos a estudiar el ejemplo previo de la nota enviada de Pedro a Elisa:

![](imagenes/PROGRAMACION_XML_html_me0b402c.png)

Imaginemos que hemos creado una aplicación que extrae los elementos `<para>`, `<de>` y `<cuerpo>`. Supongamos que el autor añade una información extra, `<fecha>`:

![](imagenes/PROGRAMACION_XML_html_m418f55c8.png)

La aplicación no tiene que fallar ya que debería poder localizar los elementos `<para>`, `<de>` y `<cuerpo>` en el documento y producir la misma salida.

### Los elementos XML están relacionados semánticamente  

Los elementos tienen entre sí relaciones del tipo padre-hijo. Para entender la terminología XML es importante conocer las relaciones entre los diferentes elementos de un documento, como se identifican y como son descritos los elementos de contenido (datos). Como ejemplo podemos coger el anterior y darnos cuenta que todas las etiquetas tenían una relación semántica entre ellas incluido el nodo raíz.

### Los elementos pueden contener diferentes tipos de datos  

Un elemento puede contener:

- Nada (elemento vacío)
- Datos.
- Subelementos XML.
- Atributos.

No tiene porque incluir sólo una de estas clases, sino también varios mezclados.

En el ejemplo el elemento `<libro>` contiene dos elementos; `<producto>` y `<capitulo>`. El elemento `<producto>` es un elemento vacío, porque no contiene ningún dato. En este caso, tiene los atributos `id` y `medio` y cada uno de ellos con sus valores entrecomillados.

El documento XML que describe el libro sería:

![](imagenes/PROGRAMACION_XML_html_4cd8762d.png)

### Reglas de nombrado de elementos XML

Los elementos XML deben seguir las siguientes reglas de nombrado:

- Los nombres pueden contener letras, números y otros caracteres.
- Los nombres no pueden comenzar con un número o con el carácter `_` (guión bajo) o con los caracteres `xml` (`XML` o `Xml`...)
- Los nombres no pueden contener espacios.

A la hora de nombrar los elementos es importante seguir algunos consejos sencillos, que pueden facilitar las cosas:

- Puede utilizarse cualquier nombre, no hay palabras reservadas, pero la idea es hacer a los nombres descriptivos para facilitar la comprensión de los datos.
- Puede ayudar el utilizar el guión bajo para separar nombres de varias palabras (`primer_apellido`, `segundo_apellido`, etc.)
- Evitar el uso de los caracteres `-` y `.` dado que el software de tratamiento de los datos lo puede identificar como símbolos aritméticos o como propiedades de objetos.
- Los nombres de los elementos pueden ser tan largos como se desee, pero no es conveniente exagerar. Es mejor que sean cortos y simples (no utilice nombres como `el_titulo_del_libro` cuando puede utilizar `titulo`)
- Los caracteres no pertenecientes al alfabeto británico, son perfectamente válidos (ñ, á, ô, etc.) Sin embargo debe estar seguro que el software de tratamiento de los datos no tenga problemas con dichos caracteres.
- El carácter `:` no debería utilizarse en la denominación de los elementos, dado que está reservado para los *namespaces*.

## Atributos XML

En HTML es habitual que las etiquetas tengan atributos que proporcionan información adicional sobre la propia etiqueta.

Por ejemplo en la etiqueta,
```html
<IMG SRC="mi_casa.gif">
```
el atributo `src` proporciona información adicional sobre la imagen; en este caso nos dice el fichero que la contiene. De la misma forma, los atributos en etiquetas XML proporcionan información sobre la propia etiqueta que los contiene:

```html
<img src="computer.gif">
<a href="demo.asp">
```

Los atributos aportan información que no es parte de los datos. En el caso anterior, el fichero de imagen no es importante para los datos, pero sí lo es para el software que manipula la información.

```xml
<fichero tipo="gif">mi_casa.gif</fichero>
```

### Tipos de entrecomillados  

Ya se ha comentado anteriormente que todos los valores de los atributos deben estar entrecomillados. Pero el tipo de comillas utilizado es irrelevante; podemos utilizar tanto comillas simples como comillas dobles, pero eso sí, debemos utilizar el mismo tipo de comillas en ambas partes de la expresión entrecomillada. Estos formatos serían admitidos:

```xml
<fichero tipo="gif">mi_casa.gif</fichero>
<fichero tipo='gif'>mi_casa.gif</fichero>
```

Pero no estos:  

```xml
<fichero tipo="gif'>mi_casa.gif</fichero>
<fichero tipo='gif">mi_casa.gif</fichero>
```

Las dobles comillas suelen ser más utilizadas, pero en ocasiones es necesario utilizar comillas sencillas, como en el ejemplo siguiente:  

```xml
<gangster nombre='Miguel "Pistolas" Fernandez'>
```

### ¿Elementos ó atributos?  

Veamos algunos objetos:

```xml
<persona sexo="femenino">
    <nombre>Elisa</nombre>
    <apellido>Lopez</apellido>
</persona>
```

```xml
<persona>
    <sexo>femenino</sexo>
    <nombre>Elisa</nombre>
    <apellido>Lopez</apellido>
</persona>
```

En el primer ejemplo, el sexo es un atributo del elemento persona. En el segundo, sexo es un elemento hijo del elemento persona. No existen reglas sobre cuando utilizar atributos o elementos hijos. Sin embargo, como norma general, se debería tender a utilizar los elementos hijos en lugar de los atributos.  

Además, el uso de atributos tiene algunos problemas:  

- Los atributos no pueden contener generalmente valores múltiples, mientras que los elementos sí.
- Los atributos son difíciles de expandir en el caso de que se deeen hacer cambios futuros en la estructura de los datos.
- Los atributos no permiten estructurar la información.
- Los atributos son más difíciles de manipular por las aplicaciones.
- Los valores de los atributos son difícilmente de verificar frente a una DTD.

Sin embargo, hay ocasiones en las que el uso de atributos si puede ser recomendable. Veamos el siguiente ejemplo para entenderlo:

![](imagenes/PROGRAMACION_XML_html_843822.png)

El atributo `ID` en este ejemplo es solamente un contador de mensajes y no una parte de los datos. En este caso si podemos decir que el uso de los atributos está recomendado. La información que contiene es los que se denomina "metainformación" (información sobre la información.)

## Comentarios  

Para poder documentar un programa XML que sirva de guía para comprenderlo, pondríamos las siguientes etiquetas.

```xml
<!-- COMENTARIOS -->
```

Donde pone COMENTARIOS añadimos todo nuestro texto. Evitar utilizar guiones en los comentarios para evitar conflictos.

![](imagenes/PROGRAMACION_XML_html_2b72a961.png)

## Caracteres especiales de XML  

Hay una serie de caracteres que XML no reconoce y los considera como ilegales. Para ellos se utiliza una serie de referencias.

Si por ejemplo introducimos un símbolo de mayor `>` dentro de una etiqueta el *parser* dará como respuesta un mensaje de error porque considera que si hay un símbolo de mayor es el comienzo de una nueva etiqueta.

Por ejemplo algo que produciría un error es:

```xml
<mensaje>si salario <1000 entonces </mensaje>
```

Para solucionar esto sustituimos dicho símbolo por una referencia:

```xml
<mensaje>si salario &lt;1000 entonces </mensaje>
```

Hay 5 referencias predeterminadas:

-   `&lt;` es el símbolo menor `<`
-   `&gt;` es el símbolo mayor `>`
-   `&amp;` es el símbolo del and `&`
-   `&apos;` es el apóstrofe `'`
-   `&quot;` es el símbolo de las comillas `"`

También podemos utilizar su equivalente utilizando su código Unicode:

| Caracter | Referencia | Unicode  |
|:--------:|:----------:|:--------:|
|    `<`   |    `&lt;`  | `&#060;` |



## Ejemplo completo de documento XML  

![](imagenes/PROGRAMACION_XML_html_b2acb64.png)
