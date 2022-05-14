FROM gcc:11.3.0

RUN mkdir /usr/src/app

RUN echo 'Running...'

WORKDIR /usr/src/app

COPY . /usr/src/app/

WORKDIR /usr/src/app/test

RUN make

RUN chmod +x runner.sh

CMD ["./runner.sh"]
