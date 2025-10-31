create database pokemon;
use pokemon;

create table tb_pokemon (
	id_pokemon int primary key auto_increment not null,
    apelido varchar(100) not null,
    genero_pokemon enum("macho","femea"),
    tipo enum ("Bug", "Dark", "Dragon", "Eletric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel") not null,
    tipo_2 enum ("Bug", "Dark", "Dragon", "Eletric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel"),
    hp int not null,
    ataque int not null,
    defesa int not null,
    defesa_especial int not null,
    ataque_especial int not null,
    agilidade int not null,
    posicao_equipe int,
    id_pokedex int,
    id_fazenda int,
    id_especie int,
    id_treinador int,
    constraint fk_id_pokedex foreign key (id_pokedex) references tb_pokedex (id_pokedex),
    constraint fk_id_fazenda foreign key (id_fazenda) references tb_fazenda (id_fazenda),
    constraint fk_id_especie foreign key (id_especie) references tb_especie (id_especie),
    constraint fk_id_treinador foreign key (id_treinador) references tb_treinador (id_treinador)
    );
    
INSERT INTO tb_pokemon (
    apelido, genero_pokemon, tipo, tipo_2, hp, ataque, defesa, defesa_especial, ataque_especial, agilidade, posicao_equipe, id_pokedex, id_fazenda, id_especie, id_treinador
) 
VALUES (
    'Pikachu',       
    'macho',         
    'Eletric',       
    NULL,            
    100,             
    55,              
    40,              
    50,              
    50,              
    90,              
    1,               
    1,              
    1,              
    25,              
    1                
);

create table tb_especie (
	id_especie int primary key auto_increment not null,
    nome_especie varchar(100) not null,
    tipo enum ("Bug", "Dark", "Dragon", "Eletric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel") not null,
    tipo_2 enum ("Bug", "Dark", "Dragon", "Eletric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel"),
    hp_base int not null,
    ataque_base int not null,
    defesa_base int not null,
    defesa_especial_base int not null,
    ataque_especial_base int not null,
    agilidade_base int not null,
    taxa_captura int not null,
    geracao int not null
);

INSERT INTO tb_especie (
    id_especie, 
    nome_especie, 
    tipo, 
    tipo_2, 
    hp_base, 
    ataque_base, 
    defesa_base, 
    defesa_especial_base, 
    ataque_especial_base, 
    agilidade_base, 
    taxa_captura, 
    geracao
) 
VALUES (
    25,          
    'Pikachu',    
    'Eletric',    
    NULL,         
    35,           
    55,           
    40,           
    50,           
    50,           
    90,           
    190,          
    1             
);

create table tb_pokedex (
	id_pokedex int primary key auto_increment not null
);

insert into tb_pokedex values (
	(0)
);

create table tb_fazenda (
	id_fazenda int primary key auto_increment not null
);

insert into tb_fazenda values(
	(0)
);

create table tb_treinador (
	id_treinador int primary key auto_increment not null,
    nome_treinador varchar(100) not null,
    data_nasc date not null,
    qtde_pokebola int default 20,
    endereco varchar (100) not null,
    genero_treinador enum ("homem", "mulher"),
    id_pokedex int,
    id_fazenda int,
    constraint id_fazenda foreign key (id_fazenda) references tb_fazenda (id_fazenda),
    constraint id_pokedex foreign key (id_pokedex) references tb_pokedex (id_pokedex)
);

INSERT INTO tb_treinador 
    (nome_treinador, data_nasc, qtde_pokebola, endereco, genero_treinador, id_pokedex, id_fazenda) 
VALUES 
    ('Ash', '1997-04-01', 29, 'Pallet Town', 'homem', 1, 1),
    ('Misty', '1998-10-02', 14, 'Cerulean City', 'mulher', 1, 1),
    ('Brock', '1995-03-15', 12, 'Pewter City', 'homem', 1, 1);
    
select * from tb_treinador;

delete from tb_treinador where id_treinador = 3;


drop table tb_especie;
drop table tb_treinador;
drop table tb_pokedex;
drop table tb_pokemon;
drop table tb_fazenda;