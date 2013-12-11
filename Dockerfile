FROM essa/gae-python
MAINTAINER Taku Nakajima <takunakajima@gmail.com>


# Install Ruby (for sass compiler)
RUN mkdir /tmp/ruby;\
  cd /tmp/ruby;\
  curl ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz | tar xz;\
  cd ruby-2.0.0-p353;\
  chmod +x configure;\
  ./configure --disable-install-rdoc;\
  make;\
  make install;\
  gem install bundler --no-ri --no-rdoc

# Install sass

RUN gem install sass

# Install phantom.js, casper.js and grunt

RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs 

RUN npm install -g casperjs grunt-cli phantomjs

# Install Java (for closure compiler)

# uncomment this line for openjdk
# RUN apt-get install -y openjdk-6-jre
#

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo yes | apt-get install -y oracle-java7-installer

EXPOSE 22
EXPOSE 8080

CMD    /usr/sbin/sshd -D

