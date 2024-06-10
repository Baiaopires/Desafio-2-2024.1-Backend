USE DETRAN;

-- A)
SELECT * FROM VEICULO
	WHERE cpf_veiculo = '123.456.789-10';

-- B)    
SELECT * FROM PROPRIETARIO
	WHERE nome LIKE '%Silva%';

-- C)    
SELECT 
    i.idInfracao,
    i.dataEHora,
    i.idLocal_infracao,
    i.idTipo_infracao,
    i.placa_infracao,
    i.matricula_infracao,
    v.placa,
    v.chassi,
    v.cor,
    v.ano,
    v.cpf_veiculo,
    v.idCategoria_veiculo,
    v.idModelo_veiculo
FROM INFRACAO i
JOIN VEICULO v ON i.placa_infracao = v.placa
WHERE i.dataEHora BETWEEN '2023-01-01 00:00:00' AND '2023-12-31 23:59:59';

-- D)
SELECT 
    m.idModelo,
    m.modelo,
    COUNT(v.placa) AS numero_de_veiculos
FROM VEICULO v
JOIN MODELO m ON v.idModelo_veiculo = m.idModelo
GROUP BY m.idModelo, m.modelo
ORDER BY numero_de_veiculos DESC;