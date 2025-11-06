const { conectar, desconectar } = require( '../database/config' );

const tableName = "disciplinas";

 const get = async ( req, resp ) => {
     const connection = await conectar();     
     try {
       const [rows, fields] = await connection.execute('SELECT * FROM disciplinas order by id desc');
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
       const [rows, fields] = await connection.execute( `SELECT * FROM disciplinas WHERE id = ${idValue}` );
       resp.send( rows );
     } catch (err) {
       console.error('Erro ao executar a consulta:', err);       
     } finally {
       desconectar(connection);
     }
}

// 3.rota  = POST
const post = async (req,res) => {
    const payloud = req.body ;
    const { disciplina, sigla  } = req.body ;
    
    console.log(payloud);
    const campos = Object.keys(payloud);
    const valores = Object.values(payloud);
    console.log(campos);
    console.log(valores);
    const sqlFROM = `INSERT INTO ${tableName} ( `;
    const sqlFIELDS = `disciplina, sigla ) values ( `
    const sqlVALUES = `"${disciplina}" , "${sigla}" )`
    const sqlText = sqlFROM + sqlFIELDS + sqlVALUES
    console.log( sqlText);
    
    const connection = await conectar();
    let sqlText1 = `INSERT INTO ${tableName} (disciplina, sigla ) values ( "${disciplina}" , "${sigla}" )`

    
    try {
        const result = await connection.execute( sqlText );
        res.status(201).send( result );
    } catch (error) {
        res.status(401).send({'message': error, 'sucess': 'error'});        
    } finally{
      desconectar(connection);
    }
}

// 4.rota  = PUT = UPDATE
async function put(req,res) {
    const { disciplina, sigla  } = req.body ;
    const id = req.params.id;
    const connection = await conectar();
    try {
      const result = await connection.execute(`UPDATE disciplinas SET disciplina = "${disciplina}" ,sigla = "${sigla}"  WHERE id = ${id}`);
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
      const result = await connection.execute(`DELETE FROM disciplinas WHERE id = ${id}`);
      res.status(204).send( result );
    } catch(error) {
      res.status(508).send( {"message": "Erro executar a solicitação!" , sucess: false} )
    } finally {
      desconectar(connection);
    }
}


module.exports = { get, getByid, erase , post, put }