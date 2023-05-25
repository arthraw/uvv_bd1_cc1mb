
/*Apaga o banco de dados uvv*/

DROP DATABASE IF EXISTS uvv;

/*Apaga o usuário para um novo login*/

DROP USER IF EXISTS arthurandrade;

/*Cria um usuário*/

CREATE USER arthurandrade with CREATEDB INHERIT password '123';

/*Cria um banco de dados chamado uvv*/

CREATE DATABASE uvv
	owner arthurandrade
	template template0
	encoding 'UTF8'
	lc_collate 'pt_BR.UTF-8'
	lc_ctype 'pt_BR.UTF-8'
	allow_connections true;

\c 'dbname=uvv user=arthurandrade password=123';

CREATE SCHEMA lojas authorization arthurandrade;

/*Garante privilégios ao usuário sobre o banco*/

grant all privileges on schema lojas to arthurandrade;

ALTER USER arthurandrade SET search_path TO lojas, '$user', public;

SET search_path TO lojas, '$user', public;

/*Tabela que armazena os Produtos*/

CREATE TABLE produtos (
                produto_id 			NUMERIC(38) NOT NULL,
                nome_produtos 			VARCHAR(255),
                preco_unitario_produtos 	NUMERIC(10,2),
                detalhes 			BYTEA,
                imagem 				BYTEA,
                imagem_mime_type 		VARCHAR(512),
                imagem_arquivo 			VARCHAR(512),
                imagem_charset 			VARCHAR(512),
                imagem_ultima_atualizacao 	DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
/*Comentarios da tabela pordutos*/
COMMENT ON TABLE produtos 				IS 'Tabela que armazena os dados dos produtos em estoque.';
COMMENT ON COLUMN produtos.produto_id 			IS 'Código de identificação para cada produto. ';
COMMENT ON COLUMN produtos.nome_produtos 		IS 'Nome de cada um dos produtos.';
COMMENT ON COLUMN produtos.preco_unitario_produtos 	IS 'Preço unitário dos produtos.';
COMMENT ON COLUMN produtos.detalhes 			IS 'Detalhes dos produtos.';
COMMENT ON COLUMN produtos.imagem 			IS 'Imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_mime_type 		IS 'Tipo do arquivo mime das imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_arquivo 		IS 'Tipo das imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_charset 		IS 'Conjunto de caracteres que representam as imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao 	IS 'Data de ultima atualização das imagens dos produtos.';


 
/*Tabela que armazena as lojas*/

CREATE TABLE lojas (
                loja_id 			NUMERIC(38) NOT NULL,
                nome_lojas 			VARCHAR(255) NOT NULL,
                endereco_web 			VARCHAR(100),
                endereco_fisico 		VARCHAR(512),
                latitude 			NUMERIC,
                longitude 			NUMERIC,
                logo 				BYTEA,
                logo_mime_type 			VARCHAR(512),
                logo_arquivo 			VARCHAR(512),
                logo_charset 			VARCHAR(512),
                logo_ultima_atualizacao 	DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas 						IS 'Tabela responsavél por armazenar dados sobre as lojas.';
COMMENT ON COLUMN lojas.loja_id 				IS 'Código de identificação para cada loja. ';
COMMENT ON COLUMN lojas.nome_lojas 				IS 'Nome de cada loja existente.';
COMMENT ON COLUMN lojas.endereco_web 				IS 'Endereço do site de cada loja.';
COMMENT ON COLUMN lojas.endereco_fisico 			IS 'Endereço das lojas fisicas.';
COMMENT ON COLUMN lojas.latitude 				IS 'Latitude das lojas cadastradas.';
COMMENT ON COLUMN lojas.longitude 				IS 'Longitude das lojas cadastradas.';
COMMENT ON COLUMN lojas.logo 					IS 'Logo de cada loja.';
COMMENT ON COLUMN lojas.logo_mime_type 				IS 'Tipo do arquivo mime da logo.';
COMMENT ON COLUMN lojas.logo_arquivo 				IS 'Arquivo que se encontra a logo.';
COMMENT ON COLUMN lojas.logo_charset 				IS 'Conjunto de caracteres que representam a logo.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao 		IS 'Data da ultima atualização na logo da loja.';

/*Tabela que armazena o estoques*/

CREATE TABLE estoques (
                estoque_id 				NUMERIC(38) NOT NULL,
                loja_id_estoques 			NUMERIC(38) NOT NULL,
                produto_id_estoques 			NUMERIC(38) NOT NULL,
                quantidade_estoques 			NUMERIC(38) NOT NULL,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);
/*Comentários sobre a tabela lojas*/
COMMENT ON TABLE estoques 				IS 'Tabela responsavél por armazenar os dados de estoque dos produtos.';
COMMENT ON COLUMN estoques.estoque_id 			IS 'Código de identificação dos produtos em estoque.';
COMMENT ON COLUMN estoques.loja_id_estoques 		IS 'Código de identificação para cada loja. ';
COMMENT ON COLUMN estoques.produto_id_estoques 		IS 'Código de identificação para cada produto.';
COMMENT ON COLUMN estoques.quantidade_estoques 		IS 'Quantidade de itens no estoque.';

/*Tabela que armazena os clientes*/

CREATE TABLE clientes (
                cliente_id 			NUMERIC(38) NOT NULL,
                email_clientes 			VARCHAR(255) NOT NULL,
                nome_clientes 			VARCHAR(255) NOT NULL,
                telefone1 			VARCHAR(20),
                telefone2 			VARCHAR(20),
                telefone3 			VARCHAR(20),
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);

/*Comentarios da tabela clientes */

COMMENT ON TABLE clientes 				IS 'Tabela que armazena os dados dos clientes.';
COMMENT ON COLUMN clientes.cliente_id 			IS 'Código de identificação exclusivo para cada usuário. ';
COMMENT ON COLUMN clientes.email_clientes 		IS 'Email dos clientes.';
COMMENT ON COLUMN clientes.nome_clientes 		IS 'Nome dos clientes registrados.';
COMMENT ON COLUMN clientes.telefone1 			IS 'Telefone dos clientes.';
COMMENT ON COLUMN clientes.telefone2 			IS 'Telefone dos clientes.';
COMMENT ON COLUMN clientes.telefone3 			IS 'Telefone dos clientes.';

/*Tabela que armazena os envios*/

CREATE TABLE envios (
                envio_id 				NUMERIC(38) NOT NULL,
                loja_id_envios 				NUMERIC(38) NOT NULL,
                cliente_id_envios 			NUMERIC(38) NOT NULL,
                endereco_entrega 			VARCHAR(512) NOT NULL,
                status_envios 				VARCHAR(15) NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);

/*Comentarios da tabela envios*/

COMMENT ON TABLE envios 				IS 'Tabela responsavél por armazenar os envios.';
COMMENT ON COLUMN envios.envio_id 			IS 'Código de identificação dos envios. ';
COMMENT ON COLUMN envios.loja_id_envios 		IS 'Código de identificação para cada loja. ';
COMMENT ON COLUMN envios.cliente_id_envios 		IS 'Código de identificação exclusivo para cada usuário. ';
COMMENT ON COLUMN envios.endereco_entrega 		IS 'Endereço de entrega dos produtos comprados.';
COMMENT ON COLUMN envios.status_envios 			IS 'Status dos envios.';

/*Tabela que armazena os pedidos*/

CREATE TABLE pedidos (
                pedido_id 			NUMERIC(38) NOT NULL,
                data_hora 			TIMESTAMP NOT NULL,
                cliente_id_pedidos 		NUMERIC(38) NOT NULL,
                status_pedidos 			VARCHAR(15) NOT NULL,
                loja_id_pedidos 		NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);

/*Comentarios da tabela pedidos*/

COMMENT ON TABLE pedidos 				IS 'Tabela responsavél por guardar os pedidos dos clientes.';
COMMENT ON COLUMN pedidos.pedido_id 			IS 'Código de identificação dos pedidos.';
COMMENT ON COLUMN pedidos.data_hora 			IS 'Registro da hora na qual foi feito o pedido.';
COMMENT ON COLUMN pedidos.cliente_id_pedidos 		IS 'Código de identificação exclusivo para cada usuário. ';
COMMENT ON COLUMN pedidos.status_pedidos 		IS 'Status dos pedidos.';
COMMENT ON COLUMN pedidos.loja_id_pedidos 		IS 'Código de identificação para cada loja. ';

/*Tabela que armazena os itens da tabela pedidos*/

CREATE TABLE pedidos_itens (
                pedido_id_itens 			NUMERIC(38) NOT NULL,
                produto_id_itens 			NUMERIC(38) NOT NULL,
                numero_da_linha 			NUMERIC(38) NOT NULL,
                preco_unitario_itens 			NUMERIC(10,2) NOT NULL,
                quantidade 				NUMERIC(38) NOT NULL,
                envio_id 				NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id_itens, produto_id_itens)
);

/*Comentarios da tabela pedidos_itens*/

COMMENT ON TABLE pedidos_itens 				IS 'Tabela responsavél por guardar quais itens foram pedidos pelo cliente.';
COMMENT ON COLUMN pedidos_itens.pedido_id_itens 	IS 'Código de identificação dos pedidos.';
COMMENT ON COLUMN pedidos_itens.produto_id_itens 	IS 'Código de identificação dos produto.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha 	IS 'Número da linha do produto.';
COMMENT ON COLUMN pedidos_itens.preco_unitario_itens 	IS 'Preço unitário dos produtos.';
COMMENT ON COLUMN pedidos_itens.quantidade 		IS 'Quantidade de itens pedidos.';
COMMENT ON COLUMN pedidos_itens.envio_id 		IS 'Código de identificação dos envios. ';

/*Conecta a FK produto_id_itens na tabela pedidos_itens*/
ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id_itens)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK produto_id_estoques na tabela estoques*/
ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id_estoques)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK loja_id_pedidos na tabela pedidos*/
ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id_pedidos)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK loja_id_estoques na tabela estoques*/
ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id_estoques)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK loja_id_envios na tabela envios*/
ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id_envios)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK cliente_id_pedios na tabela pedidos*/
ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id_pedidos)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK cliente_id_envios na tabela pedidos*/
ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id_envios)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK envio_id na tabela pedidos_itens*/
ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Conecta a FK pedido_id_itens na tabela pedidos_itens*/
ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id_itens)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*Garante que os status do pedido possua apenas um status padrão para cada caso*/
ALTER TABLE pedidos
ADD CONSTRAINT check_status_pedido
CHECK (status_pedidos IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

/*Garante que os status do envio possua apenas um status padrão para cada caso*/
ALTER TABLE envios
ADD CONSTRAINT check_status_envio
CHECK (status_envios IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

/*Checa se o preço do produto é positivo*/
ALTER TABLE produtos
ADD CONSTRAINT check_preco_unitario_positivo
CHECK (preco_unitario_produtos >= 0);

/*Checa se a quantidade dos produtos em estoque são maiores ou igual que 0*/
ALTER TABLE estoques
ADD CONSTRAINT check_quantidade_positiva
CHECK (quantidade_estoques >= 0);

/*Checa se a quantidade dos pedidos é positiva*/
ALTER TABLE pedidos_itens
ADD CONSTRAINT check_quantidade_positiva_pedidos_itens
CHECK (quantidade >= 0);


/* Verifica se os ID's são todos maiores que 0 (ou igual)*/

ALTER TABLE clientes
ADD CONSTRAINT check_id_correto_clientes
CHECK (cliente_id >= 0);

ALTER TABLE pedidos
ADD CONSTRAINT check_id_correto_pedidos
CHECK (pedido_id >= 0);

ALTER TABLE lojas
ADD CONSTRAINT check_id_correto_lojas
CHECK (loja_id >= 0);

ALTER TABLE produtos
ADD CONSTRAINT check_id_correto_produtos
CHECK (produto_id >= 0);

ALTER TABLE envios
ADD CONSTRAINT check_id_correto_envios
CHECK (envio_id >= 0);

ALTER TABLE estoques
ADD CONSTRAINT check_id_correto_estoques
CHECK (estoque_id >= 0);


/*Checa se o endereço tanto web quanto fisico são nulos*/
ALTER TABLE lojas
ADD CONSTRAINT check_endereco_nulo
CHECK(endereco_fisico IS NOT NULL OR endereco_web IS NOT NULL);

