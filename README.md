# Simon Game
## Realizado por Martín van Puffelen López
### Práctica 7 CIU: *Síntesis y procesamiento de audio*
___

#### Introducción
##### Juego interactivo **Simon** cuyo objetivo es copiar el patrón de sonidos que produce cada zona coloreada de la interfaz.
##### Para ello se ha generado distintos tipos de sonidos digitalmente basados en ondas sinuisoidales, pulsos, ruido, etcétera 

#### Instrucciones
##### Ejecutar programa y apreciar animación donde existen satélites y planetas que orbitan y rotan. En vista general será posible modificar el modo de visibilidad: ver sólo planetas, sólo satélites o todos los cuerpos (por defecto).
##### Entrar en modo "nave" *[ESPACIO]* para navegar y apreciar otras perspectivas del entorno.

![GIF Principal]()

#### Detalles implementación
#### Más allá de las herramientas de visibilidad de la práctica anterior (ver sólo satélites o planetas) se ha incluido una nave como cámara libre dirigida por el usuario.
- ##### **Información**: *Botones Mostrar/Ocultar*, dispone de un buen tamaño, al clicar cambia su estado y a su vez el texto de los cuerpos celestes visibles cambia para aportar un feedback e información extra al usuario. El resto de información serán de tipo texto que se ha intentado añadir de la forma más simple y minimalista.
- ##### **Color**: Blanco para resaltar de la mejor forma posible.
- ##### **Texturas**: Se han seleccionado texturas de elementos naturales y primitivos, por ejemplo, arena, agua o roca, para resaltar la idea de sistema hostil y no habitado.
- ##### **Controles**: *ESPACIO* para activar/desactivar modo nave, y, en el modo nave, las teclas [*W*],[*A*],[*S*],[*D*], [*ARROW-UP*] Y [*ARROW-DOWN*] para el movimiento de la posición de la misma: avanzar, izquierda, retroceder, derecha, subir, bajar. Se han elegido estos controles porque son muy intuitivos. [*R*], tecla de reseteo de la nave, control al usuario y tolerancia a errores.


#### Referencias
- [Documentación asignatura](https://github.com/otsedom/otsedom.github.io/blob/main/CIU/P4/README.md)
- [Imágenes de Google](https://www.google.com/imghp?hl=EN)
- [Documentación Processing](https://processing.org/reference)
- [Simon Game](https://shop.hasbro.com/en-us/product/simon-game:6B0A06E3-5056-9047-F532-6A891FAEBA15)
