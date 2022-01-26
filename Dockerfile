FROM node:17.3.1-bullseye

# Get and unpack the FITS libary
COPY cfitsio-4.0.0.tar.gz /cfitsio-4.0.0.tar.gz
RUN mkdir /cfitsio-4.0.0
RUN tar -xvf cfitsio-4.0.0.tar.gz

# Build the FITS library
WORKDIR /cfitsio-4.0.0
RUN ./configure --prefix=/cfitsio
RUN make
RUN make install
RUN rm /cfitsio-4.0.0.tar.gz

# Copy in all files
#COPY . /
WORKDIR /

# Get and unpack JS9 (with monkey-business to get the files into the root)
COPY js9-master-2022-01-26.zip /js9-master.zip
RUN unzip js9-master.zip
RUN rm js9-master.zip
WORKDIR /js9-master
RUN tar -czf /js9-master.tar.gz .
WORKDIR /
RUN rm -r -f js9-master
RUN tar -xvf js9-master.tar.gz
RUN rm js9-master.tar.gz

# Get our customizations
COPY js9Prefs.json /
COPY js9prefs.js /

# Snippet from js9 help:
# -----
# configure location to install the JS9 web files,
# where to find cfitsio library and include files,
# where to install programs and scripts,
# what sort of helper to build:
# -----
RUN mkdir /js9www
RUN mkdir /js9run
RUN ./configure --with-webdir=/js9www --with-cfitsio=/cfitsio --prefix=/js9run --with-helper=nodejs
RUN make
RUN make install

# js9Helper port (originally 2718)
#EXPOSE 443

COPY start-argus-js9.sh /
WORKDIR /js9www
CMD ["sh", "/start-argus-js9.sh"]