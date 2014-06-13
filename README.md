Example Dockerfile:

FROM gregory90/nodejs:latest

ADD . /code

WORKDIR /code

ENTRYPOINT ["npm start"]

EXPOSE 3000

