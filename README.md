# Examen Progra Creativa

## Usage

```bash
docker-compose run web rails db:create
docker-compose run web rails db:migrate

docker-compose up
```

## Deploying to Heroku

```bash
heroku container:push web
heroku container:release web
```

## Resolving ownership issues

```bash
sudo chown -R $USER:$USER .
```
