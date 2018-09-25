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
    	&& apk --update add --virtual \
		build-dependencies \
		python-dev \
		libffi-dev \
		openssl-dev \
		build-base \
	&& pip install --upgrade \
		pip \		
	&& pip install \
		ansible>=2.6.4 \		
		docker-py \
		dopy  \
		pywinrm  \
		pyvmomi \
		pysphere \
		openshift \
		dictdiffer \
		jinja2 \
		kubernetes \
		python-string-utils \
		ruamel.yaml \
		six \
	&& apk del build-dependencies \
	&& rm -rf /var/cache/apk/*

RUN	mkdir -p /etc/ansible \		
	&& echo 'localhost' > /etc/ansible/hosts \			
	&& mkdir -p ~/.ssh && touch ~/.ssh/known_hosts
	
ENV KUBECTL_VERSION 11.1.1
ENV KUBECTL_URI https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl

RUN curl -SL ${KUBECTL_URI} -o kubectl && chmod +x kubectl

ENV PATH="/:${PATH}"

ONBUILD	WORKDIR	/tmp
ONBUILD	COPY 	. /tmp
ONBUILD	RUN	ansible -c local -m setup all > /dev/null
CMD ["bash"]


