# Simon Game
## Realizado por Martín van Puffelen López
### Práctica 7 CIU: *Síntesis y procesamiento de audio*
___

#### Introducción
##### Juego interactivo ***Simon*** que reta la memoria copiando el patrón de sonidos que produce cada zona coloreada de la interfaz.
##### Para ello se ha generado distintos tipos de sonidos digitalmente basados en ondas sinuisoidales, pulsos, ruidos modificando a su vez la frecuencia, amplitud y añadido envolventes para definir el audio.

#### Instrucciones
##### Ejecutar programa, para empezar a jugar pulsar *[ESPACIO]*, sonará una zona aleatoria y se alumbrará, el jugador deberá copiar dicho patrón y si es correcto ganará un punto. Cada vez que realice una secuencia completa correctamente se añadirá otra zona por lo que la dificultad aumentará y será todo un reto.
##### Si el jugador se equivoca sonará un ruido durante unos segundos y se le posibilitará jugar de nuevo para superar la puntuación.

![GIF Principal]()

#### Detalles implementación
- ##### **Información**: Textos de información de controles básicos en el menú de la forma más simple y minimalista, el recorrido del juego es a base de sonidos, teniendo como información la puntuación y el ruido para dejar claro que se ha perdido. Basado en el juego original y simplemente jugar siguiendo los sonidos.
- ##### **Color**: Colores de las zonas de forma que se reconozcan los colores puros pero mezclados para bajar la intensidad y que a la hora de resaltar exista constraste y facilidad de reconocimiento.
- ##### **Controles**: *ESPACIO* para empezar a jugar, posibilidad de salir al menú con *ESCAPE*, si se pierde la partida se añade la herramienta de control de volver a empezar con la *R*. Se ha recordado las mismas unicamente en las fases concretas para dar control al usuario y seguir con el minimalismo, ventaja de usar teclas estándar.


#### Referencias
- [Documentación asignatura](https://github.com/otsedom/otsedom.github.io/blob/main/CIU/P7/README.md)
- [Imágenes de Google](https://www.google.com/imghp?hl=EN)
- [Documentación Processing](https://processing.org/reference)
- [Simon Game](https://shop.hasbro.com/en-us/product/simon-game:6B0A06E3-5056-9047-F532-6A891FAEBA15)
- [Processing Sounds](https://processing.org/reference/libraries/sound/index.html)
