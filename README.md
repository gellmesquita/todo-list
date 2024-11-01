# todo list 

Este projeto foi criado como parte do teste técnico para a empresa Target Sistemas.

## Getting Started

O **login_app** é um aplicativo desenvolvido em Dart usando o framework Flutter. Ele permite realizar operações de login, criação, exclusão, edição e visualização de registros de atividades, funcionando essencialmente como uma TODO LIST.

## Tecnologias Utilizadas

O projeto faz uso das seguintes tecnologias e bibliotecas:

- **Dart (Flutter):** Linguagem de programação e framework para o desenvolvimento de aplicativos multiplataforma.
- **MobX ^2.1.3:** Utilizado para o gerenciamento de estado da aplicação.
- **shared_preferences ^2.2.2:** Responsável pela persistência de dados local, usado para armazenar os dados das atividades ou da TODO LIST.
- **flutter_modular ^6.3.2:** Uma biblioteca poderosa para gerenciamento de rotas e injeção de dependências.

## Padrão de Arquitetura

Este projeto adota os princípios da Clean Architecture, uma abordagem que visa a separação clara de responsabilidades e a escalabilidade do código. As principais camadas da arquitetura incluem:

- **Entidades:** Definem objetos de negócios e lógica de domínio.
- **Casos de Uso:** Implementam a lógica de negócios e coordenam a interação entre as entidades.
- **Interfaces de Usuário:** Contêm a lógica de apresentação e interação com o usuário.
- **Adaptadores Externos:** Lidam com a comunicação externa, como bancos de dados, APIs, etc.

## Ambiente de Teste

Para facilitar o ambiente de teste, o projeto utiliza dados mockados de usuários. Esses dados fictícios estão localizados no diretório `lib/data/webservices/test/mockitos`. Alguns usuários para teste incluem:

- UserEntity(name: "Gelson", password: "1234", id: "1", numberPhone: "1234567890")
- UserEntity(name: "Fabio", password: "1234", id: "2", numberPhone: "1234567890")
- UserEntity(name: "Jorge", password: "1234", id: "3", numberPhone: "1234567890")

## Executando o Projeto

Para executar o projeto localmente, siga estas etapas:

1. Clone o repositório: `git clone https://github.com/gellmesquita/login_app.git`
2. Instale as dependências: `flutter pub get`
3. Gere o build para gerar codigos `flutter pub run build_runner build`
4. Execute o aplicativo: `flutter run`

## Contato

Dúvidas ou sugestões? Entre em contato via e-mail em iamgelson@gmail.com ou abra uma issue no https://github.com/gellmesquita/login_app.
