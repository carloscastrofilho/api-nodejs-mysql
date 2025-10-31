// Função para gerar o comando SQL dinamicamente 
function gerarComandoSQL(tabela, dados, id = null) {

    const campos = Object.keys(dados);
    const valores = Object.values(dados);

    let comando = '';

    if (id) { // Se houver ID, estamos atualizando 
        comando = `UPDATE ${tabela} SET `;
        comando += campos.map((campo, i) => `${campo} = "${valores[i]}"`).join(', ');
        comando += ` WHERE id = ${id}`;
    } else { // Se não houver ID, estamos inserindo 
        comando = `INSERT INTO ${tabela} (${campos.join(', ')}) VALUES ("${valores.join('", "')}")`; 
  } 
 
  return comando; 
} 
 
// 3. Rota - POST 
const post = async (req, res) => { 
  const { tabela, dados } = req.body; 
  const connection = await conectar(); 
   
  try { 
    const comandoSQL = gerarComandoSQL(tabela, dados); // Gera o comando SQL dinamicamente. 
    const result = await connection.execute(comandoSQL); 
    res.status(201).send(result); // Envia a resposta de sucesso. 
  } catch (error) { 
    res.status(400).send({ message: error.message, success: false }); 
  } finally { 
    desconectar(connection); 
  } 
}; 
 
// 4. Rota - PUT 
const put = async (req, res) => { 
  const { tabela, dados } = req.body; // O corpo da requisição contém o nome da tabela e os dados a serem atualizados. 
  const { id } = req.params; // O ID vem da URL para identificar qual registro atualizar. 
  const connection = await conectar(); 
 
  try { 
    const comandoSQL = gerarComandoSQL(tabela, dados, id); // Gera o comando SQL dinamicamente para atualizar. 
    const result = await connection.execute(comandoSQL); 
res.status(200).send(result); // Envia a resposta de sucesso. 
} catch (error) { 
res.status(400).send({ message: error.message, success: false }); 
} finally { 
desconectar(connection); 
} 
};

" lista presença 23/10/25
caio
bianca
luiz
heliel
adrian
"