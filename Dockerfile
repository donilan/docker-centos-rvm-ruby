FROM centos:centos7

RUN yum makecache \
    && yum -y update \
    && yum install -y \
       which gcc-c++ patch readline readline-devel zlib zlib-devel \
       libyaml-devel libffi-devel openssl-devel make bzip2 autoconf \
       automake libtool bison iconv-devel sqlite-devel nodejs \
    && curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
    && curl -L get.rvm.io | bash -s stable \
    && yum clean all

RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.3"
RUN /bin/bash -l -c "rvm use 2.3.3 --default"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
