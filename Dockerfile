FROM gcc:11.3.0

RUN mkdir /usr/src/app

RUN echo 'Running...'

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN dir

RUN gcc -o myapp *.c -I/user/src/app/inc -lm

CMD ["./myapp"]