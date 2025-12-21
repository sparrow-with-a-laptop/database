USE TradeRentalManagement;
-- Примеры для руководителя
EXECUTE AS USER = 'User_Manager'

-- Полный доступ ко всем таблицам
SELECT * FROM Discount
SELECT * FROM RetailPoint
SELECT * FROM Client
SELECT * FROM Contract
SELECT * FROM Payment

-- Операции изменения данных
INSERT INTO Discount (Название, Размер) VALUES ('Новая скидка', 15.00)
UPDATE RetailPoint SET Стоимость_Аренды = 28000.00 WHERE ID = 2
DELETE FROM Payment WHERE ID = 25

-- Доступ к конфиденциальной информации
SELECT Название, Юридический_Адрес, Банковские_Реквизиты FROM Client
SELECT * FROM Client WHERE Банковские_Реквизиты LIKE '%Сбербанк%'

-- Полные права на договоры
INSERT INTO Contract (Номер_Договора, Дата_Заключения, Дата_Окончания, Финальная_Стоимость, ID_Клиента, ID_Точки, ID_Скидки)
VALUES ('ДГ-2024-011', '2024-04-01', '2024-12-31', 30000.00, 1, 2, 1)

UPDATE Contract SET Финальная_Стоимость = 32000.00 WHERE Номер_Договора = 'ДГ-2024-001'
DELETE FROM Contract WHERE ID = 10

REVERT

-- Примеры для сотрудника
EXECUTE AS USER = 'User_Employee'

-- Только чтение  по точкам
SELECT * FROM RetailPoint
SELECT Адрес, Этаж, Площадь FROM RetailPoint WHERE Статус = 1


-- Попытка доступа к запрещенным данным (должна вызвать ошибку)
SELECT * FROM Client
SELECT Банковские_Реквизиты FROM Client

-- Работа с платежами (можно добавлять и изменять)
SELECT * FROM Payment WHERE Статус = 0
INSERT INTO Payment (ID_Договора, Месяц, Сумма, Дата_Начисления_Платежа)
VALUES (1, 10, 25000.00, '2024-10-01')

UPDATE Payment SET Дата_Оплаты = GETDATE(), Статус = 1 
WHERE ID_Договора = 2 AND Месяц = 6

-- Попытка удалить платеж (должна вызвать ошибку)
DELETE FROM Payment WHERE ID = 1

-- Попытка изменить запрещенные данные (должна вызвать ошибку)
UPDATE RetailPoint SET Стоимость_Аренды = 15000.00 WHERE ID = 4
INSERT INTO Discount (Название, Размер) VALUES ('Тест', 5.00)

REVERT