create database lojinha;

use lojinha;

CREATE TABLE produtos (
    id_nf INT,
    id_item INT,
    cod_prod INT,
    valor_unit DECIMAL(10, 2),
    quantidade INT,
    desconto DECIMAL(5, 2)
);

INSERT INTO produtos (id_nf, id_item, cod_prod, valor_unit, quantidade, desconto)
VALUES
(1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.50, 3, null),
(1, 3, 3, 15.00, 2, null),
(1, 4, 4, 10.00, 1, null),
(1, 5, 5, 30.00, 1, null),
(2, 1, 3, 15.00, 4, null),
(2, 2, 4, 10.00, 5, null),
(2, 3, 5, 30.00, 7, null),
(3, 1, 1, 25.00, 5, null),
(3, 2, 4, 10.00, 4, null),
(3, 3, 5, 30.00, 5, null),
(3, 4, 2, 13.50, 7, null),
(4, 1, 5, 30.00, 10, 15),
(4, 2, 4, 10.00, 12, 5),
(4, 3, 1, 25.00, 13, 5),
(4, 4, 2, 13.50, 15, 5),
(5, 1, 3, 15.00, 3, null),
(5, 2, 5, 30.00, 6, null),
(6, 1, 1, 25.00, 22, 15),
(6, 2, 3, 15.00, 25, 20),
(7, 1, 1, 25.00, 10, 3),
(7, 2, 2, 13.50, 10, 4),
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);

/* Letra a */
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT
FROM lojinha.produtos
WHERE DESCONTO IS NULL;

/* Letra b */
SELECT 
    ID_NF, 
    ID_ITEM, 
    COD_PROD, 
    VALOR_UNIT,
    (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO
FROM lojinha.produtos
WHERE DESCONTO IS NOT NULL;

/* Letra c */

UPDATE lojinha.produtos
SET DESCONTO = 0
WHERE DESCONTO IS NULL;

/* Letra d */

SELECT 
    ID_NF, 
    ID_ITEM, 
    COD_PROD, 
    VALOR_UNIT, 
    QUANTIDADE * VALOR_UNIT AS VALOR_TOTAL,
    DESCONTO,
    VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100)) AS VALOR_VENDIDO
FROM 
    lojinha.produtos;

/* Letra e */

SELECT 
    ID_NF, 
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM 
    lojinha.produtos
GROUP BY 
    ID_NF
ORDER BY 
    VALOR_TOTAL DESC;

/* Letra f */

SELECT 
    ID_NF, 
    SUM(VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO
FROM 
    lojinha.produtos
GROUP BY 
    ID_NF
ORDER BY 
    VALOR_VENDIDO DESC;

/* Letra g */

SELECT 
    COD_PROD, 
    SUM(QUANTIDADE) AS QUANTIDADE
FROM 
    lojinha.produtos
GROUP BY 
    COD_PROD
ORDER BY 
    QUANTIDADE DESC
LIMIT 1;

/* Letra h */
 
 SELECT 
    ID_NF, 
    COD_PROD, 
    SUM(QUANTIDADE) AS QUANTIDADE
FROM 
    lojinha.produtos
GROUP BY 
    ID_NF, COD_PROD
HAVING 
    SUM(QUANTIDADE) > 10;

/* Letra i */

SELECT 
    ID_NF, 
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT
FROM 
    lojinha.produtos
GROUP BY 
    ID_NF
HAVING 
    VALOR_TOT > 500
ORDER BY 
    VALOR_TOT DESC;

/* Letra j */

SELECT 
    COD_PROD, 
    AVG(DESCONTO) AS MEDIA
FROM 
    lojinha.produtos
GROUP BY 
    COD_PROD;

/* Letra k */

SELECT 
    COD_PROD, 
    MIN(DESCONTO) AS MENOR,
    MAX(DESCONTO) AS MAIOR,
    AVG(DESCONTO) AS MEDIA
FROM 
    lojinha.produtos
GROUP BY 
    COD_PROD;


/* Letra l */

SELECT 
    ID_NF, 
    COUNT(*) AS QTD_ITENS
FROM 
    lojinha.produtos
GROUP BY 
    ID_NF
HAVING 
    COUNT(*) > 3;
