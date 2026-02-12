CREATE TABLE client_node (
    id INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    phone NVARCHAR(50),
    contact_person NVARCHAR(255) NOT NULL
) AS NODE;

CREATE TABLE retail_point_node (
    id INT PRIMARY KEY,
    address NVARCHAR(255) NOT NULL,
    floor INT NOT NULL,
    area DECIMAL(10,2) NOT NULL,
    has_air_conditioner BIT NOT NULL,
    rental_cost DECIMAL(12,2) NOT NULL,
    status BIT NOT NULL
) AS NODE;

CREATE TABLE contract_node (
    id INT PRIMARY KEY,
    contract_number NVARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    final_cost DECIMAL(12,2) NOT NULL
) AS NODE;

CREATE TABLE payment_node (
    id INT PRIMARY KEY,
    month INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_date DATE,
    charge_date DATE,
    status BIT NOT NULL
) AS NODE;

CREATE TABLE discount_node (
    id INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    size DECIMAL(10,2) NOT NULL
) AS NODE;


CREATE TABLE conclude AS EDGE;
CREATE TABLE rented AS EDGE;
CREATE TABLE applies_in AS EDGE;
CREATE TABLE defines AS EDGE;

INSERT INTO client_node (id, name, address, phone, contact_person)
SELECT ID, Название, Юридический_Адрес, Телефон, ФИО_Контактного_Лица FROM Client;

INSERT INTO retail_point_node (id, address, floor, area, has_air_conditioner, rental_cost, status)
SELECT ID, Адрес, Этаж, Площадь, Наличие_Кондиционера, Стоимость_Аренды, Статус FROM RetailPoint;

INSERT INTO contract_node (id, contract_number, start_date, end_date, final_cost)
SELECT ID, Номер_Договора, Дата_Заключения, Дата_Окончания, Финальная_Стоимость FROM Contract;

INSERT INTO payment_node (id, month, amount, payment_date, charge_date, status)
SELECT ID, Месяц, Сумма, Дата_Оплаты, Дата_Начисления_Платежа, Статус FROM Payment;

INSERT INTO discount_node (id, name, size)
SELECT ID_Скидки, Название, Размер FROM Discount;


INSERT INTO conclude ($from_id, $to_id)
SELECT cn.$node_id, c.$node_id
FROM client_node cn
JOIN contract_node c ON cn.id = c.id;

INSERT INTO rented ($from_id, $to_id)
SELECT rn.$node_id, cn.$node_id
FROM retail_point_node rn
JOIN contract_node cn ON rn.id = cn.id;

INSERT INTO applies_in ($from_id, $to_id)
SELECT cn.$node_id, dn.$node_id
FROM contract_node cn
JOIN Contract c ON cn.id = c.ID
JOIN discount_node dn ON c.ID_Скидки = dn.id
WHERE c.ID_Скидки IS NOT NULL;

INSERT INTO defines ($from_id, $to_id)
SELECT cn.$node_id, pn.$node_id
FROM contract_node cn
JOIN payment_node pn ON cn.id = pn.id;

INSERT INTO client_node (id, name, address, phone, contact_person)
SELECT ID, Название, Юридический_Адрес, Телефон, ФИО_Контактного_Лица FROM Client;

INSERT INTO retail_point_node (id, address, floor, area, has_air_conditioner, rental_cost, status)
SELECT ID, Адрес, Этаж, Площадь, Наличие_Кондиционера, Стоимость_Аренды, Статус FROM RetailPoint;

INSERT INTO contract_node (id, contract_number, start_date, end_date, final_cost)
SELECT ID, Номер_Договора, Дата_Заключения, Дата_Окончания, Финальная_Стоимость FROM Contract;

INSERT INTO payment_node (id, month, amount, payment_date, charge_date, status)
SELECT ID, Месяц, Сумма, Дата_Оплаты, Дата_Начисления_Платежа, Статус FROM Payment;

INSERT INTO discount_node (id, name, size)
SELECT ID_Скидки, Название, Размер FROM Discount;


INSERT INTO conclude ($from_id, $to_id)
SELECT cn.$node_id, c.$node_id
FROM client_node cn
JOIN contract_node c ON cn.id = c.id;

INSERT INTO rented ($from_id, $to_id)
SELECT rn.$node_id, cn.$node_id
FROM retail_point_node rn
JOIN contract_node cn ON rn.id = cn.id;

INSERT INTO applies_in ($from_id, $to_id)
SELECT cn.$node_id, dn.$node_id
FROM contract_node cn
JOIN Contract c ON cn.id = c.ID
JOIN discount_node dn ON c.ID_Скидки = dn.id
WHERE c.ID_Скидки IS NOT NULL;

INSERT INTO defines ($from_id, $to_id)
SELECT cn.$node_id, pn.$node_id
FROM contract_node cn
JOIN payment_node pn ON cn.id = pn.id;
