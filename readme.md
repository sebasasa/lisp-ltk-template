Estamos usando ltk que parece que es el que funciona mejor, me habria gustado usar qt, pero que se ahace 

Lo que pasa es que en macos, tk no funciona correctamente. Hay que hacer esto: 

https://superuser.com/questions/1696372/wish-based-tools-git-gui-gitk-showing-broken-black-ui-on-macos-monterey

```
brew upgrade
brew install tcl-tk
cd /usr/local/bin
ln -s ../Cellar/tcl-tk/8.6.12/bin/wish wish
brew info tcl-tk
```

Y listo! Ya el ejemplo basico funciona, Si quieres ve run hello world haz eso:



```lisp
(ql:quickload :ltk)
(in-package :ltk-user)

(require 'asdf)

(with-ltk ()                                                
             (grid                                             
               (make-instance 'button :text "Hello World")     
               0 0))                                           
```

Si queremos hacer que cuando la ejecucíon del programa haya terminado, el programa se cierre, tenemos que utilizar este comando al lanzar el programa:



```bash
#fish
ccl64 -l main.lisp -e \(quit\)
```


```bash
#bash
ccl64 -l main.lisp -e (quit)
```

Por otro lado, los errores AUN nos siguen mandando al REPL. Eso es bueno para cuando estamos desarollando. Pero cuando queremos compilar nuetra respuesta, esa definitivamente no es la mejor opción. Si queremos que el debugger no aparezca simplemente añadimos esto a nuestro codigo

https://stackoverflow.com/questions/52886202/how-to-make-clozure-exit-when-an-error-occurs


Dejando eso de lado, durante el desarollo no esta mal tener las coas como estan. Asi que de momento podemos dejar todo asi


Todo esto tambien es comparible com SBCL de esta forma: 

``` bash
rlwrap sbcl --load main.lisp --quit   
```