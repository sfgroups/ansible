FROM alpine:3.8

RUN	apk --update add \
		bash \
		ca-certificates \
		git \
		less \
		openssl \
		openssh-client \
		p7zip \
		python \
		py-lxml \
		py-pip \
		rsync \
		sshpass \
		sudo \
		subversion \
		vim \
		zip \
    	&& apk --update add --virtual \
		build-dependencies \
		python-dev \
		libffi-dev \
		openssl-dev \
		build-base \
	&& pip install --upgrade \
		pip \
		cffi \
	&& pip install \
		ansible>=2.6.4 \
		awscli  \
		boto  \
 		boto3  \
		docker-py \
		dopy  \
		pywinrm  \
		pyvmomi \
		pysphere>=0.1.7 \
		openshift \
		dictdiffer \
		jinja2 \
		kubernetes >= 6.0.0 \
		python-string-utils \
		ruamel.yaml >= 0.15 \
		six \
	&& apk del build-dependencies \
	&& rm -rf /var/cache/apk/*

RUN	mkdir -p /etc/ansible \		
	&& echo 'localhost' > /etc/ansible/hosts \		
	&& mkdir -p ~/.ssh && touch ~/.ssh/known_hosts

ONBUILD	WORKDIR	/tmp
ONBUILD	COPY 	. /tmp
ONBUILD	RUN	ansible -c local -m setup all > /dev/null
CMD ["bash"]


