const { conectar, desconectar } = require( '../database/config' );

const tableName = "users";

 const login = async ( req, resp ) => {
     const connection = await conectar();     
     try {
        const { login, password } = req.body;
        const sqlText = `SELECT id, name FROM ${tableName} WHERE login = ? AND password = ?`;

        const [rows, fields] = await connection.execute( sqlText, [ login , password ] );
        resp.status(201).send( rows );       
     } catch (err) {
       console.error('Erro ao executar a consulta:', err);       
     } finally {
       desconectar( connection);
     }
}


module.exports = { login}