USE TradeRentalManagement;
-- Создаем пользователей 
CREATE LOGIN User_Manager WITH PASSWORD = '1234567'
CREATE USER User_Manager FOR LOGIN User_Manager

CREATE LOGIN User_Employee WITH PASSWORD = '1234567'
CREATE USER User_Employee FOR LOGIN User_Employee

-- Создаем две роли
CREATE ROLE Role_Manager
CREATE ROLE Role_Employee

-- Добавляем пользователей к ролям 
ALTER ROLE Role_Manager ADD MEMBER User_Manager
ALTER ROLE Role_Employee ADD MEMBER User_Employee

-- Выдаем права руководителю 
GRANT SELECT, INSERT, UPDATE, DELETE ON Discount TO Role_Manager
GRANT SELECT, INSERT, UPDATE, DELETE ON RetailPoint TO Role_Manager
GRANT SELECT, INSERT, UPDATE, DELETE ON Client TO Role_Manager
GRANT SELECT, INSERT, UPDATE, DELETE ON Contract TO Role_Manager
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO Role_Manager

GRANT SELECT ON Client TO Role_Manager WITH GRANT OPTION
GRANT SELECT ON Contract TO Role_Manager WITH GRANT OPTION
GRANT SELECT ON RetailPoint TO Role_Manager WITH GRANT OPTION

-- Выдаем права сотруднику
GRANT SELECT ON Discount TO Role_Employee
GRANT SELECT ON RetailPoint TO Role_Employee
GRANT SELECT ON Contract TO Role_Employee
GRANT SELECT, INSERT, UPDATE ON Payment TO Role_Employee

DENY SELECT ON Client TO Role_Employee
DENY DELETE ON Payment TO Role_Employee
DENY INSERT, UPDATE, DELETE ON Discount TO Role_Employee
DENY INSERT, UPDATE, DELETE ON RetailPoint TO Role_Employee
DENY INSERT, UPDATE, DELETE ON Contract TO Role_Employee

DENY SELECT ON Client(Юридический_Адрес) TO Role_Employee
DENY SELECT ON Client(Банковские_Реквизиты) TO Role_Employee
DENY UPDATE ON RetailPoint(Стоимость_Аренды) TO Role_Employee