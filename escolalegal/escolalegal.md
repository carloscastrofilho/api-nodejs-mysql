

# Projeto clinica Escola Legal

* Objetivo : Construir projeto back-end com o proprosito de gerenciar uma unidade escolar.

### Tecnologias: 
  * **nodeJs** - servidor api
  * **mysql** - banco de dados

#### Express

* **Node** (ou mais formalmente Node.js ) é um ambiente de execução multiplataforma de código aberto que permite aos desenvolvedores criar todos os tipos de ferramentas e aplicativos do lado do servidor em JavaScript . O ambiente de execução destina-se ao uso fora do contexto de um navegador (ou seja, executado diretamente em um computador ou sistema operacional de servidor). Dessa forma, o ambiente omite APIs JavaScript específicas do navegador e adiciona suporte para APIs de sistema operacional mais tradicionais, incluindo HTTP e bibliotecas de sistema de arquivos.

* **Express** é o framework web Node.js mais popular e a biblioteca subjacente para diversos outros frameworks Node.js populares. 

Ele fornece por exemplo mecanismo para escrever manipuladores para solicitações com diferentes verbos HTTP em diferentes caminhos de URL (rotas).

---

* Dependencias:

| dependencia | uso | install 
| -------------------|-----| -----|
| express | framework de aplicações web Node.js mínimo. | npm install express 
| mysql2  | drive de conexão com banco de dados mysql/maria |


---

### Descritivo projeto:
  * Controlar as matriculas dos alunos, o curso , disciplina e docente que esta ministrando aula para os alunos.

---

### Criando banco de dados e populando informações iniciais

* Instancie o painel de controle do xampp, inicio o serviço banco de dados mysql e apache;

* abra o admin do mysql pelo painel de controle do xampp, este ira carregar no seu navegador padrão o phpadmin que irá permitir a gestão dos bancos de dados mysql no seu pc, caso não esteja utilizando o xampp e sim outro programa ou o banco diretamete utilize o programa de acesso de sua preferencia.


* Voce pode criar o banco com auxilio do script que esta na pasta do projeto src/db de nome `escolalegal.sql`, inserindo o conteúdo em uma sessão  `SQL` do phpadmin e executando os scripts sql, ou importando o backup do banco de dados que esta na raiz do projeto via phpAdmin, escolha uma das duas técnicas.

---
####  Tela nanutenção phpmyadmin
![alt text](./images/phpmyadmin-tela-manutencao.png)

---
#### Der para o projeto escolalegal

![alt text](./images/der-clinicapet.png)

---
#### phpmyadmin Exportando um Banco de Dados 
* selecione o banco de dados que deseja exportar/backup e selecione a opção `exportar`;
* na pagina de exportação selecione o modo personalizadoo;
![alt text](./images/phpmyadmin-exportar-tela.png)

---

#### phpmyadmin Exportando um Banco de Dados 
* altere a configuração : **Adicionar declaração CREATE DATABASE / USE** para ativo.
![alt text](./images/phpmyadmin-exportar-configuracao-1.png)

---

#### phpmyadmin Exportando um Banco de Dados 
* role a tela até o final e click em exportar / salvar / continuar;
![alt text](./images/phpmyadmin-exportar-botao-exportar.png)

---

#### phpmyadmin Exportando um Banco de Dados 
* escolha o local para salvar o backup do banco de dados e informe o nome para o arquivo;
* padronizaremos o nome do arquivo de backup para: `backup-<nome-banco-dados>-<dia>-as-<hora-minuto>.sql`
`backup-escolalegal-07-10-2025-as-19-22.sql`

![alt text](./images/phpmyadmin-exportar-local-salvar.png)

---

#### phpmyadmin Importando um Banco de Dados 
* não selecione um banco de dados, clicando no icone de inicio ![ ](phpmyadmin-botao-inicio.png) no menu esquerdo ;
* selecione a opção de importar no menu superior do phpmyadmin;
![alt text](./images/phpmyadmin-sem-banco-selecionado.png)

---

#### phpmyadmin Importando um Banco de Dados 
* click escolher ficheiro ou click no imput para procurar o arquivo de backup.
![alt text](./images/phpmyadmin-import-tela.png)

---

#### phpmyadmin Importando um Banco de Dados 
* localize a pasta e selecione o arquivo que contém o backup para ser restaurado e click em `abrir` ;
![alt text](./images/phpmyadmin-import-local-salvamento.png)

----

#### phpmyadmin Importando um Banco de Dados 
* role a tela de importação até o final e click em `importar` e aguarde a conclusão do processo;
![alt text](./images/phpmyadmin-import-botao-importar.png)

---

#### phpmyadmin Importando um Banco de Dados 
* exemplo de processo concluido com sucesso;
![alt text](./images/phpmyadmin-import-concluido.png)

---

* selecione o banco de dados e verifique que as tabelas foram criadas e os dados foram recuperados.

---
### Atividade Avaliativa

1. Criar os **endpoints/rotas** de todas as tabelas do banco de dados `escolalegal`;
2. expor os **endpoints/rotas** criados para o banco `escolalegal`;
3. Criar e testar todos os **endpoints/rotas** como o `restclient`( .http), excutando os seguintes teste:
  a. incluir 2 registros;
  b. excluir o segundo inseriro pelo id;
  c. alterar o registro que sobrou pelo id;
  e. consultar o primeiro registro pelo id;
  f. consultar todos os registros do endpoint.

4. Gerar um backup do banco de dados `escolalegal` com o nome seguindo o seguinte padrão:
  `backup-<ra-aluno>-escolalegal-10-10-25-as-<hora-minuto>`.sql e coloque na raiz do projeto;

##### endpoints / rotas

| tabela | end-point |  get | getBy | post | put | delete | 
| -------| --------- | -----|-------|------|-----|--------|
|alunos | /alunos    |     |      |      |     |        |
|professores | /professores|      |       |      |     |        |
|disciplinas | /disciplinas |      |       |      |     |        |
|cursos | /cursos |      |       |      |     |        |
|matriculas | /matriculas |      |       |      |     |        |
|roles| /roles    |      |       |      |     |        |
|roles | /users    |      |       |      |     |        |
|users_roles | /users_roles    |      |       |      |     |        |

* os arquivos devem seguir a padronização acordada, exemplo de nome do arquivo de testes:
`usersServices.js`  e os arquivos devem estar dentro da pasta `src\services` .

* os arquivos devem seguir a padronização acordada, exemplo de nome do arquivo de testes:
`usersRoutes.js`  e os arquivos devem estar dentro da pasta `src\routes` .

---

##### testes

| tabela | end-point |  get | getBy | post | put | delete | 
| -------| --------- | -----|-------|------|-----|--------|
|alunos | /alunos    |     |      |      |     |        |
|professores | /professores|      |       |      |     |        |
|disciplinas | /disciplinas |      |       |      |     |        |
|cursos | /cursos |      |       |      |     |        |
|matriculas | /matriculas |      |       |      |     |        |
|roles| /roles    |      |       |      |     |        |
|roles | /users    |      |       |      |     |        |
|users_roles | /users_roles    |      |       |      |     |        |

* os arquivos devem seguir a padronização acordada, exemplo de nome do arquivo de testes:
`usersTest.http`  e os arquivos devem estar dentro da pasta `src\tests` .


* Peso dos metodos de cada endPoint/Rota

| end-point | test |  get | getBy | post | put | delete | 
| ---------| --------- | -----|-------|------|-----|--------|
|   peso    |   15  |  10  |  10   |  30 | 25  |  10    |

---

✅ Exemplo de chamada dos nosso endpoint/routes

* para chamar a rota `GET` do endpoint user utilizamos o comando abaixo:

`http://localhost:3500/api/users`

---