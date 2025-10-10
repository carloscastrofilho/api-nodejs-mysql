---
marp: true ;

---

#### nodeJs
* Node (ou mais formalmente Node.js ) é um ambiente de execução multiplataforma de código aberto que permite aos desenvolvedores criar todos os tipos de ferramentas e aplicativos do lado do servidor em JavaScript . O ambiente de execução destina-se ao uso fora do contexto de um navegador (ou seja, executado diretamente em um computador ou sistema operacional de servidor). Dessa forma, o ambiente omite APIs JavaScript específicas do navegador e adiciona suporte para APIs de sistema operacional mais tradicionais, incluindo HTTP e bibliotecas de sistema de arquivos.

**Da perspectiva de desenvolvimento de servidor web, o Node tem uma série de benefícios:**

* Ótimo desempenho! O Node foi projetado para otimizar a taxa de transferência e a escalabilidade em aplicativos web e é uma boa solução para muitos problemas comuns de desenvolvimento web (por exemplo, aplicativos web em tempo real).

* O código é escrito em "JavaScript simples e antigo", o que significa que menos tempo é gasto lidando com "mudanças de contexto" entre linguagens quando você está escrevendo código do lado do cliente e do lado do servidor.
JavaScript é uma linguagem de programação relativamente nova e se beneficia de melhorias no design da linguagem quando comparada a outras linguagens tradicionais de servidor web (por exemplo, Python, PHP, etc.). Muitas outras linguagens novas e populares são compiladas/convertidas em JavaScript, então você também pode usar TypeScript, CoffeeScript, ClojureScript, Scala, LiveScript, etc.

* O gerenciador de pacotes Node (npm) fornece acesso a centenas de milhares de pacotes reutilizáveis. Ele também possui a melhor resolução de dependências da categoria e pode ser usado para automatizar a maior parte da cadeia de ferramentas de compilação.

* O Node.js é portátil. Está disponível para Microsoft Windows, macOS, Linux, Solaris, FreeBSD, OpenBSD, WebOS e NonStop OS. Além disso, conta com amplo suporte de diversos provedores de hospedagem web, que frequentemente fornecem infraestrutura e documentação específicas para hospedar sites Node.
Ele tem um ecossistema de terceiros e uma comunidade de desenvolvedores muito ativos, com muitas pessoas dispostas a ajudar.


---

#### Express

* Express é o framework web Node.js mais popular e a biblioteca subjacente para diversos outros frameworks Node.js populares. Ele fornece mecanismos para:

* Escreva manipuladores para solicitações com diferentes verbos HTTP em diferentes caminhos de URL (rotas).
Integre com mecanismos de renderização de "visualização" para gerar respostas inserindo dados em modelos.

* Defina configurações comuns de aplicativos da web, como a porta a ser usada para conexão e o local dos modelos usados ​​para renderizar a resposta.
Adicione "middleware" adicional de processamento de solicitações em qualquer ponto do pipeline de tratamento de solicitações.

* Embora o Express em si seja bastante minimalista, os desenvolvedores criaram pacotes de middleware compatíveis para resolver praticamente qualquer problema de desenvolvimento web. Há bibliotecas para trabalhar com cookies, sessões, logins de usuários, parâmetros de URL, POSTdados, cabeçalhos de segurança e muito mais. Você pode encontrar uma lista de pacotes de middleware mantidos pela equipe do Express em Express Middleware (junto com uma lista de alguns pacotes populares de terceiros).