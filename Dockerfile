FROM ubuntu:18.04
LABEL maintainer="Jonathan Strickland"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-transport-https \
       ca-certificates \
       curl \
       gcc \
       gpg-agent \
       python-setuptools \
       python-pip \
       python-dev \
       software-properties-common \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Install docker gpg key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add docker apt repository
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install docker
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       docker-ce \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Install wheel
RUN pip install wheel

# Install Ansible via Pip.
RUN pip install ansible

# Install Molecule
RUN pip install molecule

# Install docker python for the Molecule docker driver
RUN pip install docker
