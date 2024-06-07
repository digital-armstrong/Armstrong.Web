[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fdigital-armstrong%2FArmstrong.Web%2Fbadge%3Fref%3Ddevelop&style=flat)](https://actions-badge.atrox.dev/digital-armstrong/Armstrong.Web/goto?ref=develop)

# Armstrong.Web

![cover](https://user-images.githubusercontent.com/46975515/218666180-742098ba-98f2-4979-960b-6a706436372f.png)

A web-patform for ARMStrong. This web-platform should be included client 
for ARMStrong, OMIT and assistant for shield "D".

## Before start

### Local installation:

```bash
git clone git@github.com:digital-armstrong/Armstrong.Web.git && \
    cd ./Armstrong.Web && \
    docker compose run --rm web bash -c "make setup"
```

This commands cloned repo and setup prroject dependency. Also you can manually install all deps:

```bash
bundle install
yarn install
yarn build
yarn build:css
bin/rails db:drop db:create db:migrate db:seed
```

## Start

After installing the dependencies, you can run the project in docker compose:

```bash
docker compose up --build
```

That's all. =)

## Other options

All of the below commands must be executed inside the container. 

Connect to a running container: `docker exec -it armstrongweb_web_1 bash`
Clean startup with command execution: `docker compose run --rm web bash -c "<your command>"`

### Refresh database

```bash
make cleanup
```

### Test and lint

```bash
make check
```
