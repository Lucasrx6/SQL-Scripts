# db_discoteca

## Sobre o Projeto
Este projeto é um banco de dados que tem como objetivo gerir as informações de uma gravadora. As informações são organizadas em tabelas que representam as principais entidades do negócio.
____________________________________________
Abaixo você encontrá uma breve apresentação do banco.

# MODELO CONCEITUAL

![Conceitual](https://user-images.githubusercontent.com/86980974/212477679-22a8521a-9e19-4968-81c8-2b80ce0fbe93.PNG)


# MDOELO LOGICO  

![db_discoteca](https://user-images.githubusercontent.com/86980974/212477764-7b61d409-4274-4bce-9dd4-0003df84c580.png)


_______________________________________________

# ESTRUTURA DO BANCO DE DADOS 
			
![image](https://user-images.githubusercontent.com/86980974/212478469-4c9bb88a-4682-4470-86ae-6b8720ecfa46.png)

_______________________________________________

# As principais tabelas do banco são:

- `Tabela 1`: tb_artista: tabela que contém as informações dos artistas contratados pela gravadora, como nome, nacionalidade, data de nascimento, entre outros.
- `Tabela 2`: tb_disco: tabela que contém as informações dos discos produzidos pela gravadora, como título, tempo total, ano de lançamento, entre outros.
- `Tabela 3`: tb_gravadora: tabela que contém as informações da própria gravadora, como nome, país de origem, data de fundação, entre outros.
- `Tabela 4`: tb_genero: tabela que contém as informações dos gêneros musicais, como nome e descrição.
- `Tabela 5`: tb_musica: tabela que contém as informações das músicas, como título, tempo, letra, entre outros.

O banco de dados também conta com algumas procedures para facilitar a inserção de dados nas tabelas e evitar possíveis erros, como valores nulos ou em branco. Algumas das principais procedures são:
# Procedures:
### Procedures de INSERT
- `Procedure 1`: sp_insert_artista: Insere um novo artista na tabela tb_artista, verificando se os dados de entrada (nome_artista, ano_nascimento, id_pais) são válidos e não nulos. Caso não sejam, a procedure não realiza a inserção e retorna uma mensagem de erro.
- `Procedure 2`: sp_insert_disco: Insere um novo disco na tabela tb_disco, verificando se os dados de entrada (titulo_disco, tempo_disco, ano_lancamento, id_artista, id_gravadora, id_genero) são válidos e não nulos. Para garantir que o tempo total do disco seja a soma do tempo das músicas que o compõem, a procedure realiza uma soma do tempo das músicas com o mesmo id_disco do disco a ser inserido e compara com o valor passado como parâmetro. Caso os dados de entrada não sejam válidos, a procedure não realiza a inserção e retorna uma mensagem de erro.
- `Procedure 3`: sp_insert_gravadora: Insere uma nova gravadora na tabela tb_gravadora, verificando se os dados de entrada (nome_gravadora, id_pais) são válidos e não nulos. Caso não sejam, a procedure não realiza a inserção e retorna uma mensagem de erro.
- `Procedure 4`: sp_insert_genero: Insere um novo gênero musical na tabela tb_genero, verificando se os dados de entrada (nome_genero) são válidos e não nulos. Caso não sejam, a procedure não realiza a inserção e retorna uma mensagem de erro.
- `Procedure 5`: sp_insert_musica: Insere uma nova música na tabela tb_musica, verificando se os dados de entrada (nome_musica, tempo_musica, id_disco) são válidos e não nulos. Caso não sejam, a procedure não realiza a inserção e retorna uma mensagem de erro.
### Procedures de DELETE
- `Procedure 6`: sp_delete_artista: Deleta um artista da tabela tb_artista, verificando se o id do artista é válido e não nulo. Caso não seja, a procedure não realiza a exclusão e retorna uma mensagem de erro.
- `Procedure 7`: sp_delete_gravadora: Deleta uma gravadora da tabela tb_gravadora, verificando se o id da gravadora é válido e não nulo. Caso não seja, a procedure não realiza a exclusão e retorna uma mensagem de erro.
- `Procedure 8`: sp_delete_genero: Deleta um gênero da tabela tb_genero, verificando se o id do gênero é válido e não nulo. Caso não seja, a procedure não realiza a exclusão e retorna uma mensagem de erro.
- `Procedure 9`: sp_delete_disco: Deleta um disco da tabela tb_disco, verificando se o id do disco é válido e não nulo. Caso não seja, a procedure não realiza a exclusão e retorna uma mensagem de erro.
- `Procedure 10`: sp_delete_musica: Deleta uma música da tabela tb_musica, verificando se o id da música é válido e não nulo. Caso não seja, a procedure não realiza a exclusão e retorna uma mensagem de erro.
### Procedures de UPDATE
- `Procedure 11`: sp_update_artista: Atualiza as informações de um artista na tabela tb_artista. Verifica se os dados de entrada (nome_artista, ano_nascimento, id_pais) são válidos e não nulos. Impede a inserção de caracteres numéricos no nome do artista e garante que as datas sejam inseridas corretamente.
- `Procedure 12`: sp_update_disco: Atualiza as informações de um disco na tabela tb_disco. Verifica se os dados de entrada (titulo_disco, tempo_disco, ano_lancamento, id_artista, id_gravadora, id_genero) são válidos e não nulos. Impede a inserção de caracteres numéricos no título do disco e garante que o tempo total do disco seja a soma do tempo das músicas que o compõem.
- `Procedure 13`: sp_update_genero: Atualiza as informações de um gênero na tabela tb_genero. Verifica se os dados de entrada (nome_genero) são válidos e não nulos. Impede a inserção de caracteres numéricos no nome do gênero.
- `Procedure 14`: sp_update_gravadora: Atualiza as informações de uma gravadora na tabela tb_gravadora. Verifica se os dados de entrada (nome_gravadora) são válidos e não nulos. Impede a inserção de caracteres numéricos no nome da gravadora.
- `Procedure 15`: sp_update_musica: Atualiza as informações de uma música na tabela tb_musica. Verifica se os dados de entrada (titulo_musica, duracao_musica, id_disco, id_genero) são válidos e não nulos. Impede a inserção de caracteres numéricos no título da música e garante que a duração da música seja inserida corretamente.

# Trigger:

- `Trigger`: trigger_insert_tb_musica: Atua sobre a tabela tb_musica, executando uma série de ações quando uma nova linha é inserida na tabela. A trigger atualiza o campo tempo_disco na tabela tb_disco, somando o tempo da nova música inserida ao tempo já existente do disco. Além disso, a trigger verifica se o tempo total do disco após a inserção da nova música é menor ou igual a 80 minutos. Caso ultrapasse esse limite, a trigger remove a última música inserida e atualiza novamente o campo tempo_disco na tabela tb_disco. Isso garante que o tempo total do disco nunca ultrapasse o limite de 80 minutos.

# Views:
- `View 1`: v_disco_artista_genero: Essa view retorna uma lista com os títulos dos discos, os nomes dos artistas e os gêneros musicais a que pertencem. É possível utilizá-la para consultar as informações dos discos, artistas e gêneros simultaneamente.
- `View 2`: v_disco_musica: Essa view retorna uma lista com os títulos dos discos, o nome das músicas e o tempo de duração de cada música. É possível utilizá-la para consultar as informações das músicas presentes em cada disco.
- `View 3`: v_gravadora_quantidade_discos: Essa view retorna uma lista com o nome das gravadoras e a quantidade de discos que elas possuem. É possível utilizá-la para consultar as informações das gravadoras presentes no banco de dados.
- `View 4`: v_artista_discos_lancados: Essa view retorna uma lista com o nome dos artistas e a quantidade de discos que eles lançaram. É possível utilizá-la para consultar as informações dos artistas presentes no banco de dados.
- `View 5`: v_disco_ano_genero: Essa view retorna uma lista com os títulos dos discos, o ano de lançamento e o gênero musical a que pertencem. É possível utilizá-la para consultar as informações dos discos e seus respectivos gêneros, bem como para analisar as estatísticas de lançamento de discos por ano.

______________________________________________

# Tecnologias Utilizadas
O banco de dados foi desenvolvido utilizando o sistema de gerenciamento de banco de dados MySQL. Para criar as procedures, foram utilizadas a linguagem SQL e as sintaxes específicas do MySQL.

# Como Usar
O banco de dados está disponível online e pode ser acessado por meio do link: [link do banco].

O acesso é restrito e só pode ser feito por meio de um usuário e senha previamente cadastrados. Para usar o banco, é necessário ter conhecimentos em SQL e no sistema de gerenciamento de banco de dados MySQL.

# Como Contribuir

### Pré-requisitos
- É necessário ter o MySQL instalado na sua máquina.
- É necessário ter um software que permita a criação de um banco de dados, como o MySQL Workbench, instalado na sua máquina.

### Instalação
- 1 - Clone este repositório:
git clone https://github.com/seu-usuario/db_discoteca.git
- 2 - Abra o MySQL Workbench e crie um novo banco de dados com o nome "db_discoteca".
- 3 - Abra o arquivo "cargainicial.sql" localizado na pasta raiz deste repositório e execute-o no seu banco de dados. Isso criará todas as tabelas necessárias para a gestão de uma gravadora, como descrito na seção "ESTRUTURA DO BANCO DE DADOS", assim como todas as procedures necessárias para inserção, atualização e exclusão de dados nas tabelas. deste README.

Pronto! Agora você pode utilizar o seu banco de dados para gerir as informações da sua gravadora.

### Utilização
Você pode utilizar as procedures do seu banco de dados para inserir, atualizar e excluir dados nas tabelas. Abaixo, segue um exemplo de como utilizar a procedure "sp_insert_artista":

- 1 - Abra o MySQL Workbench e conecte-se ao seu banco de dados.
- 2 - Execute a procedure "sp_insert_artista" com os parâmetros "nome_artista", "ano_nascimento" e "id_pais". Por exemplo:
CALL sp_insert_artista('João Silva', '1990-01-01', 1);
- 3 - Pronto! Agora o artista João Silva está cadastrado na tabela "tb_artista" do seu banco de dados.

### Considerações
- Lembre-se de passar valores válidos e não nulos para as procedures. Caso contrário, as procedures não realizarão a inserção, atualização ou exclusão dos dados e retornarão uma mensagem de erro.
- Para mais informações sobre como utilizar as procedures do seu banco de dados, consulte o arquivo "procedures.sql" localizado na pasta "sql" deste repositório.





