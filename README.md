### Сборка образа docker
___________________________

1. Скачать репозиторий:

`https://github.com/SummertimeSadnesss/DevOps-Practicum.git`

2. Перейти в директорию скачанного проекта:

`cd DevOps-Practicum`

3. Собрать образ Docker:

`docker build -t flaskex -f Dockerfile .`

### Запуск и проверка контейнера
___________________________

`docker run --name=flaskex -d -p 5000:5000 flaskex`

Посмотреть список запущенных контейнеров:

`docker ps`

Остановить запущенный контейнер

`docker stop flaskex`

### Запуск приложения с помощью Compose
___________________________

`docker compose up`

### Описание выполнения тестового задания
___________________________
**[NOTES.md](NOTES.md)**