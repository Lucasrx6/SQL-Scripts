# db_discoteca

## Sobre o Projeto
Este projeto é um banco de dados que tem como objetivo gerir as informações de uma gravadora. As informações são organizadas em tabelas que representam as principais entidades do negócio.
____________________________________________
Abaixo você encontrá uma breve apresentação do banco.

### --- MODELO CONCEITUAL ---

![Conceitual](https://user-images.githubusercontent.com/86980974/212477679-22a8521a-9e19-4968-81c8-2b80ce0fbe93.PNG)


### --- MDOELO LOGICO --- 

![db_discoteca](https://user-images.githubusercontent.com/86980974/212477764-7b61d409-4274-4bce-9dd4-0003df84c580.png)


_______________________________________________

### --- ESTRUTURA DO BANCO DE DADOS --- 
			
![image](https://user-images.githubusercontent.com/86980974/212478469-4c9bb88a-4682-4470-86ae-6b8720ecfa46.png)

_______________________________________________

## As principais tabelas do banco são:

- '1 - tabela ' tb_artista: tabela que contém as informações dos artistas contratados pela gravadora, como nome, nacionalidade, data de nascimento, entre outros.
- '2 - tabela ' tb_disco: tabela que contém as informações dos discos produzidos pela gravadora, como título, tempo total, ano de lançamento, entre outros.
- '3 - tabela ' tb_gravadora: tabela que contém as informações da própria gravadora, como nome, país de origem, data de fundação, entre outros.
- '4 - tabela ' tb_genero: tabela que contém as informações dos gêneros musicais, como nome e descrição.
- '5 - tabela ' tb_musica: tabela que contém as informações das músicas, como título, tempo, letra, entre outros.

O banco de dados também conta com algumas procedures para facilitar a inserção de dados nas tabelas e evitar possíveis erros, como valores nulos ou em branco. Algumas das principais procedures são:

- '1 - procedure ' sp_insert_artista: procedure que insere um novo artista na tabela tb_artista.
- '2 - procedure ' sp_insert_disco: procedure que insere um novo disco na tabela tb_disco.
- '3 - procedure ' sp_insert_gravadora: procedure que insere uma nova gravadora na tabela tb_gravadora.
- '4 - procedure ' sp_insert_genero: procedure que insere um novo gênero na tabela tb_genero.
- '5 - procedure ' sp_insert_musica: procedure que insere uma nova música na tabela tb_musica.

______________________________________________

## Tecnologias Utilizadas
O banco de dados foi desenvolvido utilizando o sistema de gerenciamento de banco de dados MySQL. Para criar as procedures, foram utilizadas a linguagem SQL e as sintaxes específicas do MySQL.

## Como Usar
O banco de dados está disponível online e pode ser acessado por meio do link: [link do banco].

O acesso é restrito e só pode ser feito por meio de um usuário e senha previamente cadastrados. Para usar o banco, é necessário ter conhecimentos em SQL e no sistema de gerenciamento de banco de dados MySQL.

## Como Contribuir
Este projeto é um banco de dados que foi desenvolvido com o objetivo de gerir as informações de uma gravadora.





