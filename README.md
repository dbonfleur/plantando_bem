# Plantando Bem - Guia de Jardinagem
Plantando Bem é um projeto em ASP .NET com Razor Pages que serve como um guia de jardinagem, oferecendo uma variedade de catálogos de hortaliças, legumes e outras plantas. Os usuários podem adicionar plantas ao seu jardim pessoal e o sistema marcará no calendário o tempo necessário até a colheita. Além disso, o projeto oferece recursos de notificação de irrigação, previsão do tempo, informações sobre combate a pragas e um sistema social de identificação de plantas por imagens, onde os usuários podem responder às imagens enviadas para identificação por outros usuários.

# Instalação e Execução
Para executar o projeto localmente, siga as etapas abaixo:
1.	Certifique-se de ter o Docker Compose instalado em sua máquina.
2.	Clone este repositório para o seu ambiente local.
3.	Navegue até o diretório raiz do projeto.
4.	Execute o seguinte comando para construir e iniciar os contêineres do Docker:
5.	docker-compose up --build
6.	Aguarde até que os contêineres sejam criados e inicializados com êxito.
7.	Após a conclusão do processo, você poderá acessar o Plantando Bem em seu navegador web através do seguinte URL:
8.	http://localhost:8080

# Recursos Principais
O Plantando Bem oferece os seguintes recursos principais:
•	Catálogos de hortaliças, legumes e outras plantas, permitindo que os usuários pesquisem e encontrem informações detalhadas sobre cada planta.
•	Jardim pessoal para os usuários, onde eles podem adicionar plantas e acompanhar o tempo necessário até a colheita.
•	Calendário integrado para visualizar as datas de plantio, colheita e outros eventos relacionados ao jardim.
•	Sistema de notificação de irrigação, que lembra os usuários quando é hora de regar suas plantas com base nas necessidades individuais de cada planta.
•	Previsão do tempo de até 3 dias, fornecendo informações sobre as condições climáticas que podem afetar o cultivo das plantas.
•	Informações sobre combate a pragas, oferecendo sugestões e soluções para lidar com possíveis problemas com insetos e doenças nas plantas.
•	Sistema social de identificação de plantas por imagens, onde os usuários podem enviar fotos de plantas desconhecidas e receber respostas e sugestões de outros usuários.
 
# Tecnologias Utilizadas
O projeto utiliza as seguintes tecnologias:
•	ASP .NET com Razor Pages: Framework utilizado para construir a aplicação web.
•	Identity: Sistema de autenticação e autorização fornecido pelo ASP .NET, permitindo que os usuários façam login, registrem-se e acessem recursos protegidos.
•	API do IBGE: Integração com a API do Instituto Brasileiro de Geografia e Estatística, que fornece informações geográficas e dados relacionados a municípios, estados, etc.
•	API do WeatherApi: Integração com uma API de previsão do tempo, que fornece informações meteorológicas atualizadas.
•	Docker Compose: Utilizado para facilitar o processo de empacotamento e implantação do projeto, garantindo que todos os serviços e dependências estejam configurados corretamente.

# Autor
Plantando Bem é desenvolvido por Daniel Bonfleur, como trabalho final para matéria de Tecnologia e Sistemas de Desenvolvimento na faculdade UTFPR - MD.

# Agradecimentos
Agradecemos a todas as bibliotecas e APIs de código aberto utilizadas. Seu trabalho é fundamental para o desenvolvimento do Plantando Bem.
