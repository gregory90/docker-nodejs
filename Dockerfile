FROM gregory90/base:latest

# Install Node.js
RUN \
  mkdir -p /code && \
  DEBIAN_FRONTEND=noninteractive apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y wget make g++ build-essential python && \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
