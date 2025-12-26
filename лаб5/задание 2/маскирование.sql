USE TradeRentalManagement;

ALTER TABLE Client
ALTER COLUMN Телефон ADD MASKED WITH (FUNCTION = 'partial(2,"xxxxxx",2)')

ALTER TABLE Client
ALTER COLUMN ФИО_Контактного_Лица ADD MASKED WITH (FUNCTION = 'partial(1,"xxxx",2)')

GRANT UNMASK TO Role_Manager
DENY UNMASK TO Role_Employee

EXECUTE AS USER = 'User_Manager'
SELECT TOP 2 Телефон, ФИО_Контактного_Лица FROM Client
REVERT

GRANT SELECT ON Client TO Role_Employee
EXECUTE AS USER = 'User_Employee'
SELECT TOP 2 Телефон, ФИО_Контактного_Лица FROM Client
REVERT
GO
DENY SELECT ON Client TO Role_Employee
GO

CREATE FUNCTION MaskPhone (@phone NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
BEGIN
    IF IS_MEMBER('Role_Manager') = 1 RETURN @phone
    RETURN LEFT(@phone, 7) + '***-**-' + RIGHT(@phone, 2)
END
GO

CREATE FUNCTION MaskAddress (@address NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    IF IS_MEMBER('Role_Manager') = 1 RETURN @address
    IF @address LIKE '%Москва%' RETURN 'г. Москва'
    IF @address LIKE '%Санкт-Петербург%' RETURN 'г. Санкт-Петербург'
    RETURN 'Адрес клиента'
END
GO

CREATE VIEW vw_Client_Masked
AS
SELECT 
    ID,
    Название,
    dbo.MaskPhone(Телефон) AS Телефон,
    dbo.MaskAddress(Юридический_Адрес) AS Юридический_Адрес
FROM Client
GO

GRANT SELECT ON vw_Client_Masked TO Role_Manager
GRANT SELECT ON vw_Client_Masked TO Role_Employee
REVOKE SELECT ON Client FROM Role_Employee

EXECUTE AS USER = 'User_Manager'
SELECT TOP 2 * FROM vw_Client_Masked
REVERT

EXECUTE AS USER = 'User_Employee'
SELECT TOP 2 * FROM vw_Client_Masked
REVERT
GO
