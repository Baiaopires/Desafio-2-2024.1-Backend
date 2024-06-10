CREATE DATABASE DETRAN;
USE DETRAN;

CREATE TABLE ENDERECO(
	idEndereco integer NOT NULL AUTO_INCREMENT,
    bairro varchar(30) NOT NULL,
    cidade varchar(20) NOT NULL,
    estado varchar(2) NOT NULL,
    primary key ( idEndereco )
) ENGINE = InnoDB;

CREATE TABLE PROPRIETARIO(
	cpf varchar(14) NOT NULL,
    nome varchar(30) NOT NULL,
    dataDeNascimento date not null,
    sexo varchar(1) not null,
    idade numeric(3) not null,
    telefone varchar(15) not null,
    idEndereco_proprietario integer NOT NULL,
    primary key ( cpf ),
	CONSTRAINT PROPRIETARIO_ENDERECO_FK FOREIGN KEY (idEndereco_proprietario)
        references ENDERECO (idEndereco) on delete NO ACTION
) ENGINE = InnoDB;

CREATE TABLE CATEGORIA(
	idCategoria numeric(2) NOT NULL,
    categoria varchar(20) NOT NULL,
    primary key ( idCategoria )
) ENGINE = InnoDB;

CREATE TABLE MODELO(
	idModelo numeric(6) NOT NULL,
    modelo varchar(20) NOT NULL,
    primary key ( idModelo )
) ENGINE = InnoDB;

CREATE TABLE VEICULO(
	placa varchar(7) NOT NULL,
    chassi varchar(20) NOT NULL,
    cor varchar(20) NOT NULL,
    ano year NOT NULL,
    cpf_veiculo varchar(14) NOT NULL,
    idCategoria_veiculo numeric(2) NOT NULL,
    idModelo_veiculo numeric(6) NOT NULL,
    primary key ( placa ),
    CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf_veiculo)
        references PROPRIETARIO (cpf) on delete NO ACTION,
	CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (idCategoria_veiculo)
        references CATEGORIA (idCategoria) on delete NO ACTION,
	CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (idModelo_veiculo)
        references MODELO (idModelo) on delete NO ACTION
) ENGINE = InnoDB;

CREATE TABLE LOCAL_T(
	idLocal integer NOT NULL AUTO_INCREMENT,
    latitude numeric(10, 5) NOT NULL,
    longitude numeric(10, 5) NOT NULL,
    velocidadePermitida numeric(3) NOT NULL,
    primary key ( idLocal )
) ENGINE = InnoDB;

CREATE TABLE TIPOINFRACAO(
	idTipo integer NOT NULL,
    valor numeric(9, 2) NOT NULL,
    tipo varchar(50) NOT NULL,
    primary key ( idTipo )
) ENGINE = InnoDB;

CREATE TABLE AGENTE(
	matricula integer NOT NULL,
    nome varchar(30) NOT NULL,
    dataDeContratacao date NOT NULL,
    tempoDeServico integer NOT NULL,
    primary key ( matricula )
) ENGINE = InnoDB;

CREATE TABLE INFRACAO(
	idInfracao integer NOT NULL AUTO_INCREMENT,
    dataEHora datetime NOT NULL,
    idLocal_infracao integer NOT NULL,
    idTipo_infracao integer NOT NULL,
    placa_infracao varchar(7) NOT NULL,
    matricula_infracao integer NOT NULL,
    primary key ( idInfracao ),
    CONSTRAINT INFRACAO_LOCAL_T_FK FOREIGN KEY (idLocal_infracao)
        references LOCAL_T (idLocal) on delete NO ACTION,
	CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idTipo_infracao)
        references TIPOINFRACAO (idTipo) on delete NO ACTION,
	CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa_infracao)
        references VEICULO (placa) on delete NO ACTION,
	CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula_infracao)
        references AGENTE (matricula) on delete NO ACTION
) ENGINE = InnoDB;