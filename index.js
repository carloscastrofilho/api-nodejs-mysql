const express = require("express") ;

const racasRoutes = require('./src/routes/racasRoutes');
const especiesRoutes = require('./src/routes/especiesRoutes');
const laboratorioRoutes = require('./src/routes/laboratoriosRoutes');

const Port = 3500 ;
const app = express() ;

// Middleware to parse JSON request bodies
app.use( express.json()) ;

// Middleware to parse URL-encoded request bodies
app.use(express.urlencoded({ extended: true }));

app.use( '/api/racas' , racasRoutes );
app.use( '/api/especies' , especiesRoutes );
app.use( '/api/laboratorios' , laboratorioRoutes );

app.listen( Port , () => { console.log ( `servidor rodando na porta: ${Port} !`)});
