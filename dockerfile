FROM ubuntu:latest

RUN apt-get update

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

# Apache Web Server
RUN apt-get install -y apache2
CMD ["apache2ctl", "-D", "FOREGROUND"]
COPY ./index.html /var/www/html/
EXPOSE 80
