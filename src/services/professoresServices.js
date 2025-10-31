const { conectar, desconectar } = require( '../database/config' );

 const get = async ( req, resp ) => {
     const connection = await conectar();     
     try {
       const [rows, fields] = await connection.execute('SELECT * FROM professores order by id desc');
       resp.status(201).send( rows );       
     } catch (err) {
       console.error('Erro ao executar a consulta:', err);       
     } finally {
       desconectar( connection);
     }
}

// 2. rota  = GETbyid == select * from tabela where id = ?id == Read
const getByid = async ( req, resp ) => {
     const idValue = req.params.id;
     const connection = await conectar();     
     try {
       const [rows, fields] = await connection.execute( `SELECT * FROM professores WHERE id = ${idValue}` );
       resp.send( rows );
     } catch (err) {
       console.error('Erro ao executar a consulta:', err);       
     } finally {
       desconectar(connection);
     }
}

// 3.rota  = POST
const post = async (req,res) => {
    const { nome, areaAtuacao, cursos_id} = req.body ;
    const connection = await conectar();
    try {
        const result = await connection.execute( `INSERT INTO professores (nome, areaAtuacao, cursos_id) values ( "${nome}" , "${areaAtuacao}"  , "${cursos_id}" )`);
        res.status(201).send( result );
    } catch (error) {
        res.status(401).send({'message': error, 'sucess': 'error'});        
    } finally{
      desconectar(connection);
    }
}

// 4.rota  = PUT = UPDATE
async function put(req,res) {
    const { nome, areaAtuacao, cursos_id} = req.body ;
    const id = req.params.id;
    const connection = await conectar();
    try {
      const result = await connection.execute(`UPDATE professores SET nome = "${nome}" ,areaAtuacao = "${areaAtuacao}"  , cursos_id = "${cursos_id}"  WHERE id = ${id}`);
      res.status(202).send( result );
    } catch (error) {
        res.status(401).send({'message': error, 'sucess': 'error'});    
    } finally {
      desconectar(connection) ;

    }
}

// 4.rota  = DELETE
const erase = async (req,res) =>{
    const id = req.params.id;
    const connection = await conectar();
    try {      
      const result = await connection.execute(`DELETE FROM professores WHERE id = ${id}`);
      res.status(204).send( result );
    } catch(error) {
      res.status(508).send( {"message": "Erro executar a solicitação!" , sucess: false} )
    } finally {
      desconectar(connection);
    }
}


const post_auto = async (req, res) => {
  const connection = await conectar();
  try {
    const data = req.body; // Ex: { nome: "Carlos", areaAtuacao: "TI", cursos_id: 2 }

    // Monta as chaves e os placeholders automaticamente
    const columns = Object.keys(data).join(', ');
    const placeholders = Object.keys(data).map(() => '?').join(', ');
    const values = Object.values(data);

    // Monta a query dinâmica
    const sqlText = `INSERT INTO professores ( ${columns} ) VALUES ( ${placeholders} )`;
    
    //  executa a instrução sqlText passando os values para cada coluna em values
    const [result] = await connection.execute(sqlText, values);

    res.status(201).send({ success: true, result });
  } catch (error) {
    res.status(400).send({ success: false, message: error.message });
  } finally {
    desconectar(connection);
  }
};


const put_auto = async (req, res) => {
  const connection = await conectar();
  try {
    const id = req.params.id;
    const data = req.body; // Ex: { nome: "Novo nome", areaAtuacao: "Administração" }

    // Monta automaticamente os pares "coluna = ?"
    const updates = Object.keys(data).map(key => `${key} = ?`).join(', ');
    const values = Object.values(data);

    const sql = `UPDATE professores SET ${updates} WHERE id = ?`;

    const [result] = await connection.execute(sql, [...values, id]);
    res.status(202).send({ success: true, result });
  } catch (error) {
    res.status(400).send({ success: false, message: error.message });
  } finally {
    desconectar(connection);
  }
};



module.exports = { get, getByid, erase , post, put }