INSTRUCCIONES DE EJECUCIÓN

->Usando el código: 
Este método requiere tener matlab instalado.
Simplemente se debe copiar la carpeta que contiene el código "AGAmbulancias" a la carpeta de arranque por defecto de matlab, la cual se puede saber ejecutando en la terminal de matlab el comando "userpath", o consultado la documentación:
http://es.mathworks.com/help/matlab/matlab_env/matlab-startup-folder.html#bujzfnl

Una vez que la hayamos copiado, nos aparecerá la carpeta en el menú "current folder" de la izquierda. Hacemos doble click en ella para situarnos dentro de la carpeta. 
Una vez aquí para ejecutar el programa debemos ejecutar el archivo principal, que en este caso es "AGAmbulancias_gui.m" (no confundir con "AGAmbulancias_gui.fig"). 
Para ello podemos seleccionarlo y pulsar el botón de ejecutar que se encuentra en la barra superior o bien escribir en la terminal: "run AGAmbulancias_gui.m". 

Este método es el recomendado, ya que el código guarda en el workspace como dato extra el registro completo de todas las generaciones y solo podemos verlo si ejecutamos el programa desde matlab y no con el ejecutable. 

->Usando el ejecutable (no funciona, leer más abajo): 
Para usar el ejecutable bastaría con hacer doble click en el archivo "AGAmbulanciasInstaller_web" y seguir los pasos de instalación que se van mostrando.
Este método no requiere tener matlab instalado ni ningún paso adicional, pero no se podrían ver las variables guardadas en el workspace.

Sin embargo se han encontrado varios problemas a la hora de realizar el ejecutable por los cuales NO FUNCIONA:
-El primero es que algunas de las funciones y variables utilizadas pertenecen a una librería llamada "Symbolic Math Toolbox", la cual matlab no es capaz de integrar en el ejecutable ya que conlleva una licencia a parte. Esto es la causa de que el ejecutable no funcione. 
Esta librería es la encargada de evaluar las ecuaciones y no usarla implicaría reescribir gran parte del código además de tener que escribir cada valor de las ecuaciones y no poder pasarlos como parámetros, lo que por tanto no permitiría cambiar los valores con los que se calculan.
-El segundo problema aunque no ocasiona el fallo del ejecutable, es que desde un matlab instalado en un mac solo se puede crear un ejecutable para mac, desde windows uno para windows etc así que el ejecutable que he creado si funcionase solo funcionaría para mac.


INSTRUCCIONES DE USO
Primero se debe calcular la matriz de pesos, para ello se debe introducir la máxima bpv deseada, la cual debe ser un número positivo (el método tomará como rango aceptable [-maxbpv, maxbpv]. Aparecerá un mensaje en el cuadro de texto indicando que el cálculo está en proceso, cuando termine se indicará también y se habilitará la opción de ejecutar el algoritmo genético. Este cálculo solo es necesario realizarlo la primera vez después de cada vez que ejecutemos el programa.

En los parámetros del algoritmo genético hay que tener en cuenta que hay que rellenar todos los campos excepto los marcados con *, que son opcionales. 
Si se rellenan los dos campos que contienen el asterisco, el algoritmo parará cuando en generaciones parada no se mejore la media de los pesos al menos en porcentaje. El porcentaje introducido por el usuario debe ser positivo, el método ya tiene en cuenta que esos valores deben minimizarse. 

El campo decimales de precisión indica los decimales de precisión con los que se calculan las casillas del método de selección por ruleta y el número de decimales con el que se muestran los pesos de las rutas óptimas encontradas.  

IMPORTANTE: A la hora de meter nºs decimales en el entorno gráfico, hacerlo con ".". Las probabilidades deben estar entre [0,1], y el entre [0, 100].
