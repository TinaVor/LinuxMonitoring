## Part 7

### Prometheus

- Скачиваем архив для установки  
![prometheus](./imgs/prometheus1.png)

- Разархивируем  
![prometheus](./imgs/prometheus2.png)

- Распределяем файлы по каталогам  
![prometheus](./imgs/prometheus3.png)  
![prometheus](./imgs/prometheus4.png)  

- Для конфигурационных файлов необходимо создать папку /etc/prometheus  

- Скопируем туда такие папки с конфигурационными файлами  
В них содержатся файлы для работы веб-интерфейса программы  
![prometheus](./imgs/prometheus6.png)

- Создадим конфигурационный файл /etc/prometheus/prometheus.yml  
![prometheus](./imgs/prometheus7.png)  
![prometheus](./imgs/prometheus8.png)  
По умолчанию интервал сбора данных составляет 15 секунд, а также добавлена задача по сборку данных с самого Prometheus.

- Создаем пользователя, от которого будем запускать систему мониторинга  
![prometheus](./imgs/prometheus9.png)  
Мы создали пользователя prometheus без домашней директории и без возможности входа в консоль сервера.

- Создаем файл prometheus.service  
![prometheus](./imgs/prometheus10.png)  
Указываем путь к настройкам, к данным prometheus, адрес и порт и задаем возможность изменения конфигурации без необходимости рестарта сервиса  
![prometheus](./imgs/prometheus11.png)

- Разрешаем автозапуск  
![prometheus](./imgs/prometheus12.png)

- Задаем владельца для каталогов  
![prometheus](./imgs/prometheus13.png)  
![prometheus](./imgs/prometheus14.png)  

- Запускаем сервис и смотрим статус  
![prometheus](./imgs/prometheus16.png)

- Веб-интерфейс Prometheus:  
![prometheus](./imgs/prometheus17.png)

### Установка Node Exporter:

_Node Exporter используется для сбора информации о Linux, например загрузка процессора, системные метрики._

- Создаём системного пользователя:  
![node_exporter](./imgs/node_exporter1.png)

- Скачиваем Node Exporter:  
![node_exporter](./imgs/node_exporter2.png)

- Извлекаем:  
![node_exporter](./imgs/node_exporter3.png)
 
- Перемещаем все файлы:  
![node_exporter](./imgs/node_exporter4.png)

- Проверяем версию:  
![node_exporter](./imgs/node_exporter5.png)

- Задаём параметры сервиса:  
![node_exporter](./imgs/node_exporter6.png)

- Запускаем и проверяем:  
![node_exporter](./imgs/node_exporter7.png)

- Создаём static target:  
![node_exporter](./imgs/node_exporter8.png)

- Два экземпляра node_exporter:
![node_exporter](./imgs/node_exporter9.png)

### Установка Grafana:

- Убедимся, что зависимости установлены:  
![grafana](./imgs/grafana1.png)

- Получаем ключ:  
![grafana](./imgs/grafana2.png)

- Подключаем репозиторий для grafana:  
![grafana](./imgs/grafana3.png)

- Устанавливаем grafana:  
![grafana](./imgs/grafana4.png)

- Устанавливаем grafana-agent:  
![grafana](./imgs/grafana5.png)

- Разрешаем автозапуск и запускаем grafana-server:  
![grafana](./imgs/grafana6.png)

- Смотрим web-интерфейс grafana:  
![grafana](./imgs/grafana7.png)

- Обновляем правила, разрешающие доступ к localhost на 3000 порту:  
![grafana](./imgs/grafana12.png)

- Выводим на dashboard информацию о загрузке ЦПУ, доступной оперативной памяти, свободное место и кол-во операций ввода/вывода на жестком диске:  
![grafana](./imgs/grafana13.png)

- Запуск скрипта из второй части:  
![grafana](./imgs/grafana14.png)

- Запуск стресс-теста:  
![grafana](./imgs/grafana16.png)  
![grafana](./imgs/grafana17.png)
