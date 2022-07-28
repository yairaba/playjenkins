FROM tkd-java 

ARG DEBIAN_FRONTEND=noninteractive

#python 3.8 && venv libpq-dev install need it for  
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn 
RUN apt-get update && apt-get install --no-install-recommends -y python3.8 python3.8-dev python3-pip python3-wheel build-essential libpq-dev && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Install dependencies:
COPY requirements_backend.txt .
COPY requirements_worker.txt .

RUN pip install --upgrade pip && \
     pip install virtualenv virtualenvwrapper


ENV WORKON_HOME /opt/virtualenvs
ENV VIRTUALENVWRAPPER_PYTHON /usr/bin/python3
ENV VIRTUALENVWRAPPER_VIRTUALENV /usr/local/bin/virtualenv

RUN /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh \
    && mkvirtualenv --python=/usr/bin/python3.8 venv_worker  \
    && workon venv_worker \
    && pip install -r requirements_worker.txt \
    && deactivate"


RUN /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh \
    && mkvirtualenv --python=/usr/bin/python3.8 venv_pytest  \
    && workon venv_pytest \
    && pip install -r requirements_backend.txt \
    && deactivate"

RUN  echo 'export WORKON_HOME=/opt/virtualenvs' >> ~/.bashrc && \
     echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> ~/.bashrc && \
     echo 'export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv' >> ~/.bashrc && \
     echo '. /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc && \
     echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle/' >> ~/.bashrc 



RUN mkdir /usr/java && \
    ln -s /usr/lib/jvm/java-8-oracle/ /usr/java/default

# COPY dev.zip /opt
# RUN unzip /opt/dev.zip -d /opt && \
#     sudo rm -rf /opt/dev.zip
