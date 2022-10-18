# Criação do banco de dados.
create database petshopds;

# Usando o banco de dados.
use petshopds;

# Criação da tabela funcionário.
create table tb_funcionario(
id_func int auto_increment primary key not null,
nome_social_func varchar(40) not null,
nome_func varchar(40) not null,
endereco_func varchar (50) not null,
salario real not null,
cargo varchar (20) not null,
dt_admissao date not null,
dt_nasc_func date not null,
genero_func enum ('Masculino', 'Feminino', 'Outro'), 
contato_func varchar (20) not null,
email_func varchar(40) not null,
plano_saude varchar (15) not null
);

# Criação da tabela cliente.
create table tb_cliente (
id_cliente int auto_increment primary key not null,
nome_social_cliente varchar(40) not null,
nome_cliente varchar(40) not null,
email_cliente varchar(40) not null,
endereco_cliente varchar (50) not null,
dt_nasc_cliente date not null,
genero_cliente enum ('Masculino', 'Feminino', 'Outro'), 
contato_cliente varchar (20) not null
);

# Criação da tabela fornecedor.
create table tb_fornecedor(
cnpj_fornec varchar(20) primary key not null,
nome_fantasia varchar(40) not null,
email_fornec varchar (30) not null,
contato_fornec varchar (20) not null,
endereco_fornec varchar (50) not null
);

# Criação da tabela animal.
create table tb_animal(
id_animal int auto_increment primary key not null,
nome_animal varchar (20) not null,
raca varchar (20) not null,
tipo_animal varchar (20) not null,
porte enum ('Pequeno', 'Médio', 'Grande') not null,
castrado enum ('Sim', 'Não') not null,
idade_animal int not null,
genero_animal varchar(20) not null,

id_cliente int not null,
foreign key (id_cliente) references tb_cliente (id_cliente)
);

# Criação da tabela serviço.
create table tb_servico(
id_servico int auto_increment primary key not null,
nome_servico varchar (30) not null,
tipo_servico varchar (20) not null,
valor_servico real not null,
DtHrServico datetime,

id_animal int not null,
id_cliente int not null,
id_func int not null,

foreign key (id_animal) references tb_animal (id_animal),
foreign key (id_cliente) references tb_cliente (id_cliente),
foreign key (id_func) references tb_funcionario (id_func)
);

# Criação da tabela produto.
create table tb_produto(
cod_produto int primary key not null,
nome_produto varchar (30) not null,
valor_custo real not null,
valor_venda real not null,
marca_produto varchar (30) not null,
funcionalidade varchar (30) not null,
dt_fabricacao date not null,
dt_validade date not null,
qtd_minima int not null,
qtd_estocada int not null,

cnpj_fornec varchar(20) not null,
foreign key (cnpj_fornec) references tb_fornecedor (cnpj_fornec)
);

# Criação da tabela venda.
create table tb_venda(
cod_venda int auto_increment primary key not null,
dt_hr_venda datetime not null,
desconto real not null,
valor_total real not null,

id_func int not null,
foreign key (id_func) references tb_funcionario (id_func)
);

# Criação da tabela itens da venda.
create table tb_itens_venda(
id_itens_venda int auto_increment primary key not null,
qtd_vendida int not null,

cod_venda int not null,
cod_produto int not null,
foreign key (cod_produto) references tb_produto (cod_produto),
foreign key (cod_venda) references tb_venda (cod_venda)
);

# Inserção de dados funcionário.
insert into tb_funcionario (nome_social_func, nome_func,  endereco_func, salario, cargo, dt_admissao, dt_nasc_func, genero_func, contato_func, email_func, plano_saude) values
("João", "João Ferreira", "Mussurunga", 3000.00, "Atendente", '2022-10-10', '1999-04-12', 'Masculino', "71988147925", "joaof2000@gmail.com", "Hapvida"),
("Lukinhas", "Lucas Silva", "Brotas", 2500.00, "Atendente", '2018-04-02', '2000-01-01', 'Masculino', "71932485967", "lukezeras@gmail.com", "Promédica"),
("Lari", "Larissa Vieira", "Imbuí", 2500.00, "Atendente", '2019-08-08', '2000-06-14', 'Feminino', "71987415236", "lariprincess2@gmail.com", "Unimed"),
("Grace", "George Santos", "Mussuranga", 3500.00, "Auxiliar de Gerente", '2021-02-20', '1995-03-09', 'Masculino', '71987452145', "gracinhapoderosa@outlook.com", "Hapvida"),
("Paty", "Patrícia Lima", "Brotas", 5000.00, "Gerente", '2020-05-15', '1992-08-14', 'Feminino', "71974165823", "patinha2010@gmail.com", "Promédica");

# Inserção de dados cliente.
insert into tb_cliente (nome_social_cliente, nome_cliente, email_cliente, endereco_cliente, dt_nasc_cliente, genero_cliente, contato_cliente) values
("Heitor", "Heitor Santana", "heitorzinho@gmail.com", "Pituba", '2000-05-10', 'Masculino', "71996354821"),
("Leticia", "Letícia Maria", "let2020@gmail.com", "Boca do Rio", '2002-12-04', "Feminino", "71984521637"),
("Melissa", "Melissa Nogueira", "melzinha21@outlook.com", "Imbuí", '2001-06-15', "Feminino", "71954126875"),
("AyannoKoji", "Gabriel Silva", "ayannokojii@gmail.com", "Pernambués", '1998-05-27', "Masculino", "71947851268"),
("Maria", "Valéria Soares", "mary123@gmail.com", "Pituba", '2001-08-03', "Feminino", "71975412685");

# Inserção de dados fornecedor.
insert into tb_fornecedor (cnpj_fornec, nome_fantasia, email_fornec, contato_fornec, endereco_fornec) values
("94382830713978", "Fagundes Rações", "fagracoes@gmail.com", "71965874215", "Mussurunga"),
("98839923405422", "Sacramento Utilidades", "sacramentouti@gmail.com", "71987541245", "Lauro de Freitas"),
("52345476216363", "Petigree", "petigreeba@gmail.com", "71978954782", "Imbuí"),
("22355115543323", "OttoPets", "ottopetsbr@gmail.com", "71978541269", "Valéria"),
("53443421154511", "GoldenPets", "goldenpetsltda@gmail.com", "7175412896", "Barris");

# Selects para verificação das criações das tabelas.
select * from tb_funcionario;
select * from tb_cliente;
select * from tb_fornecedor;
select * from tb_animal;
select * from tb_servico;
select * from tb_produto;
select * from tb_venda;
select * from tb_itens_venda;



