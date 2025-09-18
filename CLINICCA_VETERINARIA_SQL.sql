CREATE DATABASE clinica_veterinaria;

USE clinica_veterinaria;

CREATE TABLE veterinarios (
    id int NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(15) NULL,
    email VARCHAR(80) NULL,
    crm VARCHAR(10) NULL,
    CONSTRAINT veterinarios_id PRIMARY KEY (id) 
);


CREATE TABLE especialidades (
    id int NOT NULL AUTO_INCREMENT,
    especilidade VARCHAR(60) NOT NULL,
    CONSTRAINT especialidades_id PRIMARY KEY (id)    
);


CREATE TABLE veterinarios_especialidades (
    id_veterinario int NOT NULL,
    id_especialidade int NOT NULL,
    principal BIT NOT NULL DEFAULT(1),   
    CONSTRAINT veterinarios_especialidades_id PRIMARY KEY (id_veterinario,id_especialidade)    
);

ALTER TABLE veterinarios_especialidades 
ADD CONSTRAINT fk_veterinarios_especialidades_id_veterinario FOREIGN KEY (id_veterinario) REFERENCES veterinarios (id);


ALTER TABLE veterinarios_especialidades 
ADD CONSTRAINT fk_veterinarios_especialidades_id_especialidade FOREIGN KEY (id_especialidade) REFERENCES especialidades (id);


CREATE TABLE racas (
 id INT NOT NULL AUTO_INCREMENT,
    raca VARCHAR(50) NOT NULL,
    CONSTRAINT pk_raca_id PRIMARY KEY (id)
);

CREATE TABLE especies (
    id INT NOT NULL AUTO_INCREMENT,
    especie VARCHAR(30) NOT NULL,
    CONSTRAINT pk_epecies_id PRIMARY KEY(id)
);

CREATE TABLE donos (
 id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(15) NULL,
    email VARCHAR(80) NULL,
    CONSTRAINT pk_donos_id PRIMARY KEY (id)
);

CREATE TABLE animais (
 id INT NOT NULL  AUTO_INCREMENT,
    animal VARCHAR(30) NOT NULL,
    idade INT NOT NULL DEFAULT(0),
    id_dono INT NOT NULL,
    id_raca INT NOT NULL,
    id_especie INT NOT NULL,
    CONSTRAINT pk_animais_id PRIMARY KEY (id),    
    CONSTRAINT fk_animais_dono FOREIGN KEY (id_dono) REFERENCES donos (id),
    CONSTRAINT fk_animais_raca FOREIGN KEY (id_raca) REFERENCES racas (id),
    CONSTRAINT fk_animais_especies FOREIGN KEY (id_especie) REFERENCES especies (id)    
);
