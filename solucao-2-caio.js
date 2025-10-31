const { conectar, desconectar } = require('../database/config');
const TABLE_NAME = 'professores';

const get = async (req, resp) => {
  const connection = await conectar();
  try {
    const [rows] = await connection.execute(`SELECT * FROM ${TABLE_NAME} ORDER BY id DESC`);
    resp.status(200).send(rows);
  } catch (err) {
    resp.status(500).send({ message: 'Erro interno do servidor', success: false });
  } finally { await desconectar(connection); }
};

const getByid = async (req, resp) => {
  const connection = await conectar();
  try {
    const [rows] = await connection.execute(`SELECT * FROM ${TABLE_NAME} WHERE id = ?`, [req.params.id]);
    rows.length === 0 ? resp.status(404).send({ message: 'Registro não encontrado', success: false }) : resp.send(rows[0]);
  } catch (err) {
    resp.status(500).send({ message: 'Erro interno do servidor', success: false });
  } finally { await desconectar(connection); }
};

const post = async (req, res) => {
  const connection = await conectar();
  try {
    const [tableStructure] = await connection.execute(`DESCRIBE ${TABLE_NAME}`);
    const allowedFields = tableStructure.filter(field => field.Field !== 'id').map(field => field.Field);
    const filteredData = Object.keys(req.body).filter(key => allowedFields.includes(key)).reduce((obj, key) => { obj[key] = req.body[key]; return obj; }, {});
    
    if (Object.keys(filteredData).length === 0) {
      return res.status(400).send({ message: 'Nenhum campo válido para inserção', success: false, allowedFields });
    }

    const columns = Object.keys(filteredData).join(', ');
    const placeholders = Object.keys(filteredData).map(() => '?').join(', ');
    const values = Object.values(filteredData);
    
    const [result] = await connection.execute(`INSERT INTO ${TABLE_NAME} (${columns}) VALUES (${placeholders})`, values);
    res.status(201).send({ message: 'Registro criado com sucesso', success: true, id: result.insertId, data: filteredData });
  } catch (error) {
    const errorMessages = {
      'ER_DUP_ENTRY': { message: 'Registro duplicado', status: 409 },
      'ER_NO_REFERENCED_ROW': { message: 'Chave estrangeira inválida', status: 400 }
    };
    const errorConfig = errorMessages[error.code] || { message: 'Erro interno do servidor', status: 500 };
    res.status(errorConfig.status).send({ message: errorConfig.message, success: false });
  } finally { await desconectar(connection); }
};

const put = async (req, res) => {
  const connection = await conectar();
  try {
    const [existing] = await connection.execute(`SELECT id FROM ${TABLE_NAME} WHERE id = ?`, [req.params.id]);
    if (existing.length === 0) return res.status(404).send({ message: 'Registro não encontrado', success: false });

    const [tableStructure] = await connection.execute(`DESCRIBE ${TABLE_NAME}`);
    const allowedFields = tableStructure.filter(field => field.Field !== 'id').map(field => field.Field);
    const filteredData = Object.keys(req.body).filter(key => allowedFields.includes(key)).reduce((obj, key) => { obj[key] = req.body[key]; return obj; }, {});
    
    if (Object.keys(filteredData).length === 0) {
      return res.status(400).send({ message: 'Nenhum campo válido para atualização', success: false, allowedFields });
    }

    const setClause = Object.keys(filteredData).map(key => `${key} = ?`).join(', ');
    const values = [...Object.values(filteredData), req.params.id];
    
    const [result] = await connection.execute(`UPDATE ${TABLE_NAME} SET ${setClause} WHERE id = ?`, values);
    res.status(200).send({ message: 'Registro atualizado com sucesso', success: true, affectedRows: result.affectedRows, data: filteredData });
  } catch (error) {
    const errorMessages = {
      'ER_DUP_ENTRY': { message: 'Conflito de dados únicos', status: 409 }
    };
    const errorConfig = errorMessages[error.code] || { message: 'Erro interno do servidor', status: 500 };
    res.status(errorConfig.status).send({ message: errorConfig.message, success: false });
  } finally { await desconectar(connection); }
};

const erase = async (req, res) => {
  const connection = await conectar();
  try {
    const [result] = await connection.execute(`DELETE FROM ${TABLE_NAME} WHERE id = ?`, [req.params.id]);
    result.affectedRows === 0 ? res.status(404).send({ message: 'Registro não encontrado', success: false }) : 
    res.status(200).send({ message: 'Registro deletado com sucesso', success: true, affectedRows: result.affectedRows });
  } catch (error) {
    error.code === 'ER_ROW_IS_REFERENCED_2' ? res.status(409).send({ message: 'Não é possível excluir - registro possui dependências', success: false }) :
    res.status(500).send({ message: 'Erro interno do servidor', success: false });
  } finally { await desconectar(connection); }
};

module.exports = { get, getByid, erase, post, put };