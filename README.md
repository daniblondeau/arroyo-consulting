# Arroyo Consulting

El repositorio contiene 2 archivos *dockerfile* y *index.html*.

De acuerdo a las especificaciones, lo que realicé fue lo siguiente:

1. Crear un *dockerfile* con la ultima version de Ubuntu (23.04).
2. Luego agregar las aplicaciones listadas en el mail para ser instaladas.
3. Por ultimo, agregar el servidor web Apache con una pagina html (archivo index.html).

***

## Como ultilizar el **dockerfile**

### Crear la imagen de la VM con linux

1. Comentar las lineas de *"Apache Web Server"*, deberia quedar de la siguiente manera:
   ```
   ...
   ## Apache Web Server
   #RUN apt-get install -y apache2
   #CMD ["apache2ctl", "-D", "FOREGROUND"]
   #COPY ./index.html /var/www/html/
   #EXPOSE 80
   ```

2. Luego, correr el siguiente comando para crear la imagen de la vm/container: 
   ```
   docker build -t linux-vm .
   ```
   
3. Por ultimo, podemos correr la imagen creada con:
   ```
   docker run --rm -it linux-vm
   ```
   
#### Es posible conectarse al container desde VsCode
![linux-vm](https://github.com/daniblondeau/arroyo-consulting/img/linux-vm.png)

***

### Crear la imagen del Apache Web Server

1. En este caso comentamos las lines de *"Linux VM"*, debería quedar de la siguiente manera:
   ```
   ## Linux VM - Install apps
   #RUN apt-get install -y default-jdk
   #RUN apt-get install -y maven
   #RUN apt-get install -y git
   ## Set up 'tzdata' values
   #ENV TZ=America/Argentina/Cordoba
   #RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
   #RUN apt-get install -y tzdata
   #RUN apt-get install -y postgresql
   #RUN apt-get install -y dotnet-sdk-6.0
   ...
   ```

2. Luego, correr el siguiente comando para crear la imagen del Apache Web Server: 
   ```
   docker build -t apache-webserver .
   ```
   

3. Por ultimo, podemos correr la imagen creada con:
   ```
   docker run -d -p 80:80 apache-webserver
   ```

#### Web Page de Prueba
![web-server](https://github.com/daniblondeau/arroyo-consulting/img/web-server.png)
