const express = require("express") ;

const cursosRoutes = require('./src/routes/cursosRoutes');
const professoresRoutes = require('./src/routes/professoresRoutes');
const disciplinasRoutes = require('./src/routes/disciplinasRoutes');
const matriculasRoutes = require('./src/routes/matriculasRoutes');

const modelosRoutes = require('./src/routes/modelosRoutes');

const Port = 3500 ;
const app = express() ;

// Middleware to parse JSON request bodies
app.use( express.json()) ;

// Middleware to parse URL-encoded request bodies
app.use(express.urlencoded({ extended: true }));

function testeServidor( req, resp){
   resp.send( {servidor: "localhost",
    status: "ok", databaseType: "mysql"
   } ) 
}

app.get('/servidor', (req,resp) => testeServidor(req, resp) );

app.use('/api/cursos', cursosRoutes );
app.use('/api/professores', professoresRoutes );
app.use('/api/disciplinas', disciplinasRoutes );
app.use('/api/matriculas', matriculasRoutes );
app.use('/api/modelos',modelosRoutes);
app.listen( Port , () => { console.log ( `servidor rodando na porta: ${Port} !`)});
