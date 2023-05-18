
CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome_produtos VARCHAR(255),
                preco_unitario_produtos NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
COMMENT ON TABLE produtos IS 'Tabela que armazena os dados dos produtos em estoque.';
COMMENT ON COLUMN produtos.produto_id IS 'Código de identificação para cada produto. ';
COMMENT ON COLUMN produtos.nome_produtos IS 'Nome de cada um dos produtos.';
COMMENT ON COLUMN produtos.preco_unitario_produtos IS 'Preço unitário dos produtos.';
COMMENT ON COLUMN produtos.detalhes IS 'Detalhes dos produtos.';
COMMENT ON COLUMN produtos.imagem IS 'Imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_mime_type IS 'Tipo do arquivo mime das imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_arquivo IS 'Tipo das imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_charset IS 'Conjunto de caracteres que representam as imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Data de ultima atualização das imagens dos produtos.';


CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome_lojas VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas IS 'Tabela responsavél por armazenar dados sobre as lojas.';
COMMENT ON COLUMN lojas.loja_id IS 'Código de identificação para cada loja. ';
COMMENT ON COLUMN lojas.nome_lojas IS 'Nome de cada loja existente.';
COMMENT ON COLUMN lojas.endereco_web IS 'Endereço do site de cada loja.';
COMMENT ON COLUMN lojas.endereco_fisico IS 'Endereço das lojas fisicas.';
COMMENT ON COLUMN lojas.latitude IS 'Latitude das lojas cadastradas.
';
COMMENT ON COLUMN lojas.longitude IS 'Longitude das lojas cadastradas.';
COMMENT ON COLUMN lojas.logo IS 'Logo de cada loja.

';
COMMENT ON COLUMN lojas.logo_mime_type IS 'Tipo do arquivo mime da logo.';
COMMENT ON COLUMN lojas.logo_arquivo IS 'Arquivo que se encontra a logo.';
COMMENT ON COLUMN lojas.logo_charset IS 'Conjunto de caracteres que representam a logo.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Data da ultima atualização na logo da loja.';


CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id_estoques NUMERIC(38) NOT NULL,
                produto_id_estoques NUMERIC(38) NOT NULL,
                quantidade_estoques NUMERIC(38) NOT NULL,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE estoques IS 'Tabela responsavél por armazenar os dados de estoque dos produtos.';
COMMENT ON COLUMN estoques.estoque_id IS 'Código de identificação dos produtos em estoque.';
COMMENT ON COLUMN estoques.loja_id_estoques IS 'Código de identificação para cada loja. ';
COMMENT ON COLUMN estoques.produto_id_estoques IS 'Código de identificação para cada produto.';
COMMENT ON COLUMN estoques.quantidade_estoques IS 'Quantidade de itens no estoque.';


CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email_clientes VARCHAR(255) NOT NULL,
                nome_clientes VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE clientes IS 'Tabela que armazena os dados dos clientes.';
COMMENT ON COLUMN clientes.cliente_id IS 'Código de identificação exclusivo para cada usuário. ';
COMMENT ON COLUMN clientes.email_clientes IS 'Email dos clientes.';
COMMENT ON COLUMN clientes.nome_clientes IS 'Nome dos clientes registrados.';
COMMENT ON COLUMN clientes.telefone1 IS 'Telefone dos clientes.';
COMMENT ON COLUMN clientes.telefone2 IS 'Telefone dos clientes.';
COMMENT ON COLUMN clientes.telefone3 IS 'Telefone dos clientes.';


CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id_envios NUMERIC(38) NOT NULL,
                cliente_id_envios NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status_envios VARCHAR(15) NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);
COMMENT ON TABLE envios IS 'Tabela responsavél por armazenar os envios.';
COMMENT ON COLUMN envios.envio_id IS 'Código de identificação dos envios. ';
COMMENT ON COLUMN envios.loja_id_envios IS 'Código de identificação para cada loja. ';
COMMENT ON COLUMN envios.cliente_id_envios IS 'Código de identificação exclusivo para cada usuário. ';
COMMENT ON COLUMN envios.endereco_entrega IS 'Endereço de entrega dos produtos comprados.';
COMMENT ON COLUMN envios.status_envios IS 'Status dos envios.';


CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id_pedidos NUMERIC(38) NOT NULL,
                status_pedidos VARCHAR(15) NOT NULL,
                loja_id_pedidos NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE pedidos IS 'Tabela responsavél por guardar os pedidos dos clientes.';
COMMENT ON COLUMN pedidos.pedido_id IS 'Código de identificação dos pedidos.';
COMMENT ON COLUMN pedidos.data_hora IS 'Registro da hora na qual foi feito o pedido.';
COMMENT ON COLUMN pedidos.cliente_id_pedidos IS 'Código de identificação exclusivo para cada usuário. ';
COMMENT ON COLUMN pedidos.status_pedidos IS 'Status dos pedidos.';
COMMENT ON COLUMN pedidos.loja_id_pedidos IS 'Código de identificação para cada loja. ';


CREATE TABLE pedidos_itens (
                pedido_id_itens NUMERIC(38) NOT NULL,
                produto_id_itens NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario_itens NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id_itens, produto_id_itens)
);
COMMENT ON TABLE pedidos_itens IS 'Tabela responsavél por guardar quais itens foram pedidos pelo cliente.';
COMMENT ON COLUMN pedidos_itens.pedido_id_itens IS 'Código de identificação dos pedidos.';
COMMENT ON COLUMN pedidos_itens.produto_id_itens IS 'Código de identificação dos produto.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Número da linha do produto.';
COMMENT ON COLUMN pedidos_itens.preco_unitario_itens IS 'Preço unitário dos produtos.';
COMMENT ON COLUMN pedidos_itens.quantidade IS 'Quantidade de itens pedidos.';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'Código de identificação dos envios. ';


ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id_itens)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id_estoques)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id_pedidos)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id_estoques)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id_envios)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id_pedidos)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id_envios)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id_itens)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
