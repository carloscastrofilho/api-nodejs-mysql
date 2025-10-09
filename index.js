const express = require("express") ;

const racasRoutes = require('./src/routes/racasRoutes');
const especiesRoutes = require('./src/routes/especiesRoutes');
const laboratorioRoutes = require('./src/routes/laboratoriosRoutes');

const Port = 3500 ;
const app = express() ;
app.use( express.json()) ;

app.use( '/api/racas' , racasRoutes );
app.use( '/api/especies' , especiesRoutes );
app.use( '/api/laboratorios' , laboratorioRoutes );



app.listen( Port , () => { console.log ( `servidor rodando na porta: ${Port} !`)});
