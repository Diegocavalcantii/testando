CREATE DATABASE teste01;

-- Consultar bancos existentes
SELECT name
FROM master.sys.databases
ORDER BY name;

EXEC sp_databases;

-- Selecionar banco a usar
USE teste01;
