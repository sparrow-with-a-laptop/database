# database
<h1 name="content" align="center"><a href=""><img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/></a> MSSQL</h1>

<p align="center">
  <a href="#-lab1"><img alt="lab1" src="https://img.shields.io/badge/Lab1-crimson"></a> 
  <a href="#-lab2"><img alt="lab2" src="https://img.shields.io/badge/Lab2-forestgreen"></a>
  <a href="#-lab3"><img alt="lab3" src="https://img.shields.io/badge/Lab3-darkorange"></a>
  <a href="#-lab4"><img alt="lab4" src="https://img.shields.io/badge/Lab4-steelblue"></a>
  <a href="#-lab5"><img alt="lab5" src="https://img.shields.io/badge/Lab5-tomato"></a>
  <a href="#-lab6"><img alt="lab6" src="https://img.shields.io/badge/Lab6-olive"></a> 
  <a href="#-lab7"><img alt="lab7" src="https://img.shields.io/badge/Lab7-chocolate"></a>
  <a href="#-lab8"><img alt="lab8" src="https://img.shields.io/badge/Lab8-rosybrown"></a>
  <a href="#-lab9"><img alt="lab9" src="https://img.shields.io/badge/Lab9-maroon"></a> 
</p>

<h3 align="center">
  <a href="#client"></a>
Вариант №24: Автоматизация работы по сдаче в аренду торговых площадей.

</h3>

Информация о торговых точках, предназначенных для аренды: адрес, этаж, площадь, наличие кондиционера, стоимость аренды в месяц.
Клиенты: название, юр.адрес, банковские реквизиты, телефон, ФИО контактного лица.


Реализовать:
- Подбор варианта аренды для клиента, расчет оплаты с возможностью предоставления некоторых видов скидок;
- Заключение договора;
- Хранение информации о ежемесячных платежах, поступающих от арендаторов;
- Поиск клиентов-должников, не внесших своевременно ежемесячный платеж


# <img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Lab1
[Назад](#content)
<h3 align="left">
  <a href="#client"></a>
</h3>

Разработать ER-модель данной предметной области: выделить сущности, их атрибуты, связи между сущностями. 
Для каждой сущности указать ее имя, атрибут (или набор атрибутов), являющийся первичным ключом, список остальных атрибутов.
Для каждого атрибута указать его тип, ограничения, может ли он быть пустым, является ли он первичным ключом.

Для каждой связи между сущностями указать: 
- тип связи (1:1, 1:M, M:N)
- обязательность

ER-модель д.б. представлена в виде ER-диаграммы (картинка)
По имеющейся ER-модели создать реляционную модель данных и отобразить её в виде списка сущностей с их атрибутами и типами атрибутов,  для атрибутов указать, является ли он первичным или внешним ключом 

<h3 align="left">
  <a href="#client"></a>
1.1 ER-модель:

  <img width="1481" height="911" alt="ER-модель" src="https://github.com/user-attachments/assets/96e15212-83e5-4f3b-bc48-b1a3dc56a021" />

 
1.2 Реляционная модель:

<img width="791" height="537" alt="Реляционная модель" src="https://github.com/user-attachments/assets/17404d1f-206d-4d95-95cb-5a7e210154a7" />



# <img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Lab2
[Назад](#content) 
<h3 align="left"> 
  <a href="#client"></a>
</h3>

В соответствии с реляционной моделью данных, разработанной в Лаб.№1, создать реляционную БД на учебном сервере БД:
- создать таблицы, определить первичные ключи и иные ограничения
- определить связи между таблицами
- создать диаграмму
- заполнить все таблицы адекватной информацией (не меньше 10 записей в таблицах, наличие примеров для связей типа 1:M)

<h3>
  
2.1 [SQL-код создания таблиц](https://github.com/sparrow-with-a-laptop/database/blob/main/лаб2/SQLFile1.sql)

2.2 Диаграмма БД "TradeRentalManagement":

![diagram-TradeRentalManagement](https://github.com/user-attachments/assets/b0caedf7-f613-4b25-a3a1-e95ef1d2a897)

  
2.3 Примеры заполненных таблиц:
</h3>
<h4>
  
  1) "Торговая точка":
     ![торговая_точка](https://github.com/user-attachments/assets/8b90baae-22c5-4391-a60b-011fa8701f14)


  2) "Договор":
     ![договор](https://github.com/user-attachments/assets/858f37d8-9339-40bb-9103-a0b4db7eaf3e)


  3) "Клиент":
     ![клиент](https://github.com/user-attachments/assets/c14272c2-3035-442f-9bd4-1859930a7bb5)

     
  4) "Скидка":

     ![скидка](https://github.com/user-attachments/assets/a95cb2aa-e787-4c5f-834c-38dcd69b37dc)

  5) "Платеж":

     ![платеж](https://github.com/user-attachments/assets/a6f523da-8955-4b31-9896-0b336a94008d)


# <img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Lab3
[Назад](#content)
<h3 align="left">
  <a href="#client"></a>
</h3>

Ссылка на сайт с первой частью - [Лаб 3 Часть 1](https://buildin.ai/share/1e1c130b-0f22-4196-8d92-7e3c71aacb10?code=XAKZ9E)
  
  [Файл](https://github.com/sparrow-with-a-laptop/database/blob/main/лаб3/лаб3_1.docx) с первой частью 



Ссылка на сайт со второй частью - [Лаб 3 Часть 2](https://buildin.ai/share/804fa002-2e33-4808-933a-7d64521c23c3?code=XAKZ9E)
  
  [Файл](https://github.com/sparrow-with-a-laptop/database/blob/main/лаб3/лаб3_2.docx) со второй частью


# <img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Lab4
[Назад](#content)
<h3 align="left">
  <a href="#client"></a>
</h3>

Ссылка на сайт - [Лаб 4](https://buildin.ai/share/ad0d748f-6c64-4a2a-900b-6981783d4b3f?code=XAKZ9E)
  
  [Файл](https://github.com/sparrow-with-a-laptop/database/blob/main/лаб4/лаб4.pdf) 



# <img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Lab5
[Назад](#content)
<h3 align="left">
  <a href="#client"></a>
  Создание ролей и присвоение им прав на объекты БД
</h3>

### [Задание 1]()



### [Задание 2]()



<a id="lab6"></a>
# Лабораторная работа №6
[Назад](#content)
<h3 align="left">
  <a href="#client"></a>
   Создание графовых таблиц и работа с ними
</h3>

Используя реляционную БД из лабораторной работы №2:
- Продумайте и создайте графовые таблицы по реляционной БД.
- Заполните графовые таблицы используя данные в реляционных таблицах.
- Напишите запросы из задания 3.2 используя паттерн MATCH.
- Сравните полученные результаты с результатами запросов к реляционной модели.

<h3> 
6.1. Схема узлов и рёбер 

</h3>

<h3>
  
6.2. [SQL-код создания и заполнения графовых таблиц]()
</h3>

<h3>

  6.3. [SQL-запросы из задания 3.2 к двум моделям (реляционная, графовая)]()
</h3>

<h3>

  6.4. [Сравнение запросов]()
</h3>

<a id="lab7"></a>
# Лабораторная работа №7
[Назад](#content)
<h3 align="left">
  <a href="#client"></a>
</h3>







