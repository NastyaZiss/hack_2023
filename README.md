<h1 align="center">Хакатон Осень 2023<a href="https://daniilshat.ru/" target="_blank"></a> 
<img src="https://github.com/blackcater/blackcater/raw/main/images/Hi.gif" height="32"/></h1>
Команда: CoffeeDose

Кейс: Мониторинг автоматизированного склада

![movement (3)](https://github.com/NastyaZiss/hack_2023/assets/88962864/1ef5b869-ff17-4643-b2a3-13ec1ca2f0e3)

<h3 align="left">Реализованно<a href="https://daniilshat.ru/" target="_blank"></a></h3>

<b>backend</b>
```
  - получение данных  из скрипта и имитация движения погрузчиков (с сохранением в БД)
  - передача данных о погрузчиках через сокеты, остальные данные через http
```

:hammer_and_wrench: Стек:  fastapi, sqlalchemy, python, postgresql, docker

<b>frontend</b>
```
1) гибкий интерфейс
2) выбор склада
3) панель (схема) отслеживания перемещения погрузчиков
4) панель для отображения данных о:
  - погрузчиках ( идентификатор, статус, номер заказа, последнее ТО, следующее ТО)
  - контрольных точек* (общее количество проходов, количество проходов определённого погрузчика)
  - заказов* (идентификатор, статус заказа, номер погрузчика, время выполнения)
  - выходе из строя контрольной точки*
(данные открываются по клику на объект на схеме)
```

:hammer_and_wrench: Стек: flutter

<b>аналитика</b>
```
  - выбор погрузчика (определённый/все)
  - выбор промежутка времени
  - пройденное расстояние
  - выполненные заказы
  - время проведённое в движении
  - время нахождения в каждом из статусов (ожидание, поездка до заказа, возвращение с заказом)
  - реализованно в виде таблиц
```

\* - дополнительные задачи


<b>Примеры работы приложения</b>

С мобильного устройства

![image](https://github.com/NastyaZiss/hack_2023/assets/96202686/520b4c53-42ba-4831-8df9-4d44d159ae4a)
![image](https://github.com/NastyaZiss/hack_2023/assets/96202686/60394185-ec26-4e70-b2b0-c397695ce207)
![image](https://github.com/NastyaZiss/hack_2023/assets/96202686/7bdd7808-72ab-430b-a5a8-402a9b76269b)

С экрана компьютера

![image](https://github.com/NastyaZiss/hack_2023/assets/96202686/3ab01afa-5eb2-44a4-90df-523d1e9b06c9)
![image](https://github.com/NastyaZiss/hack_2023/assets/96202686/535e8158-74f7-41f5-b146-6d446fc5b2d6)
![image](https://github.com/NastyaZiss/hack_2023/assets/96202686/a145e193-c435-429f-bb90-6a6e4f452024)





