USE DETRAN;

INSERT INTO ENDERECO (bairro, cidade, estado) VALUES 
('Moema', 'São Paulo', 'SP'),
('Ipanema', 'Rio de Janeiro', 'RJ'),
('Savassi', 'Belo Horizonte', 'MG'),
('Moinhos de Vento', 'Porto Alegre', 'RS'),
('Asa Sul', 'Brasília', 'DF');

INSERT INTO PROPRIETARIO (cpf, nome, dataDeNascimento, sexo, idade, telefone, idEndereco_proprietario) VALUES 
('123.456.789-10', 'João Silva', '1980-05-15', 'M', 41, '(11) 98765-4321', 1),
('987.654.321-00', 'Maria Souza', '1995-08-20', 'F', 29, '(21) 12345-6789', 2),
('111.222.333-44', 'Pedro Oliveira', '1986-03-10', 'M', 36, '(31) 11111-2222', 3),
('555.666.777-88', 'Ana Santos', '1978-12-10', 'F', 42, '(51) 55555-6666', 4),
('999.888.777-66', 'Rafael Souza', '1990-06-25', 'M', 32, '(19) 99999-8888', 5);

INSERT INTO CATEGORIA (idCategoria, categoria) VALUES
(11, 'AUTOMÓVEL'),
(24, 'CAMINHÃO'),
(45, 'MOTOCICLETA'),
(88, 'TRATOR'),
(65, 'MOTONETA');

INSERT INTO MODELO (idModelo, modelo) VALUES
(123894, 'GOL'),
(120394, 'PALIO'),
(472891, 'ONIX'),
(439021, 'KA'),
(893012, 'SANDERO');

INSERT INTO VEICULO (placa, chassi, cor, ano, cpf_veiculo, idCategoria_veiculo, idModelo_veiculo) VALUES
('ABC1234', '9BWZZZ377VT004251', 'Prata', 2019, '123.456.789-10', 11, 123894),
('EJO2839', '9BGKS48U0GB131935', 'Branco', 2020, '123.456.789-10', 11, 472891),
('DEF5678', '9BD17164S44131828', 'Azul', 2017, '987.654.321-00', 24, 120394),
('GHI9012', '9BGKS48U0GB131935', 'Branco', 2020, '111.222.333-44', 45, 472891),
('JKL3456', '9BFZF55D2E8104472', 'Preto', 2018, '555.666.777-88', 88, 439021),
('MNO7890', '93YBSRJ687J192596', 'Vermelho', 2016, '999.888.777-66', 65, 893012);

INSERT INTO LOCAL_T (latitude, longitude, velocidadePermitida) VALUES
(-22.9068, -43.1729, 60),
(-23.5505, -46.6333, 50),
(-19.9167, -43.9333, 50),
(-30.0331, -51.23, 60),
(-15.7942, -47.8825, 60);

INSERT INTO TIPOINFRACAO (idTipo, valor, tipo) VALUES
(1, 195.23, 'Ultrapassagem em local proibido'),
(2, 130.16, 'Excesso de velocidade (até 20% acima do permitido)'),
(3, 88.50, 'Estacionamento em local proibido'),
(4, 957.30, 'Dirigir sob efeito de álcool'),
(5, 293.75, 'Avanço do sinal vermelho');

INSERT INTO AGENTE (matricula, nome, dataDeContratacao, tempoDeServico) VALUES
(123456, 'João Silva', '2015-03-15', 111),
(234567, 'Maria Oliveira', '2018-06-20', 72),
(345678, 'Carlos Pereira', '2020-01-01', 53),
(456789, 'Ana Santos', '2021-10-11', 31),
(567890, 'Lucas Almeida', '2023-02-25', 16);

INSERT INTO INFRACAO (dataEHora, idLocal_infracao, idTipo_infracao, placa_infracao, matricula_infracao) VALUES
('2021-07-25 14:37:45', 1, 1, 'ABC1234', 123456),
('2020-11-10 08:15:30', 2, 2, 'DEF5678', 234567),
('2022-03-18 22:50:10', 3, 3, 'GHI9012', 345678),
('2023-05-04 19:05:00', 4, 4, 'JKL3456', 456789),
('2023-09-29 11:20:25', 5, 5, 'MNO7890', 567890);

select * from LOCAL_T