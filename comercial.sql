

CREATE DATABASE comercial;

USE comercial;

CREATE TABLE empresas(
    id INT NOT NULL AUTO_INCREMENT,
    empresa VARCHAR(70) NOT NULL,
    telefone VARCHAR(15) NULL,
    email VARCHAR(150) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    inscestadual VARCHAR(20) NOT NULL,        
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_empresas_id PRIMARY KEY (id)    
);

CREATE TABLE produtocategorias(
    id INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(30) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_produtoscategorias_id PRIMARY KEY (id)
 );

CREATE TABLE produtos(
    id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    precovenda FLOAT,
    idcategoria INT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_produtos_id PRIMARY KEY (id),
    CONSTRAINT fk_produtosCategoria FOREING KEY (idcategoria) REFERENCES produtocategorias (id)
);

CREATE TABLE statuscliente(
    id INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(30) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_statuscliente_id PRIMARY KEY (id)

);

CREATE TABLE clientes(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    telefone VARCHAR(15) NULL,
    email VARCHAR(150) NOT NULL,
    limitecredito FLOAT,
    idstatus INT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_clientes_id PRIMARY KEY (id),
    CONSTRAINT fk_clientesStatus FOREING KEY (idstatus) REFERENCES statuscliente (id)
    
);

CREATE TABLE pedidoProdutos(
    id INT NOT NULL AUTO_INCREMENT,
    idpedido INT NOT NULL ,
    idproduto INT NOT NULL ,    
    preco FLOAT,
    quantidade FLOAT ,
    totalproduto FLOAT ,    
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_produtos_id PRIMARY KEY (id),
    CONSTRAINT fk_pedidoprodutos_produto_id FOREING KEY (idproduto) REFERENCES produtos (id)
);

CREATE TABLE pedidos(
    id INT NOT NULL AUTO_INCREMENT,
    dtemissao DATETIME NOT NULL,
    idcliente INT NOT NULL ,   
    totalpedido FLOAT ,    
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_pedidos_id PRIMARY KEY (id),
    CONSTRAINT fk_pedidos_clientes_id FOREING KEY (idcliente) REFERENCES clientes (id)
);


