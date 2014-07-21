FROM centurylinklabs/ruby-base:2.1.2

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y libcurl4-openssl-dev

ADD . /tmp
WORKDIR /tmp
RUN bundle install --without development

CMD QUEUE=etl rake socialize:pull_and_save resque:work
