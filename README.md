## Instalação

### Requisitos: 
* Ruby 2.7.0
* Rails 6.0.4.6
* Node 16.x

Após certificação dos requisitos executar os seguintes comandos:
* ```bundle install```
* ```yarn install```
* ```rails db:setup```
* ```rails webpacker:install```
* ```rails s```

O projeto deve ficar disponível para acesso na porta 3000 do localhost. Caso haja uma configuração personalizada de domínio para garantir o funcionamento do encurtador de links é necessário informar o domínio da aplicação na variável de ambiente “RAILS_DOMAIN”, como no exemplo abaixo:
 
```export RAILS_DOMAIN = “http://www.domain.com”```

Os testes podem ser executados por meio do comando ```rspec```, e a cobertura dos testes pode ser conferida no arquivo ```coverage/index.html```.

## Descrição

Esse projeto é um webscraper em Ruby on Rails para obter informações de um perfil do GitHub a partir da URL do usuário. O recurso de web scraping foi desenvolvido com a gema HTTParty (para fazer requisições HTTP de modo simples) e da gema Nokogiri (para selecionar informações da página utilizando XPath). O projeto também conta com um recurso local de encurtamento dos links dos perfis. A escolha por não utilizar uma API foi feita para diminuir o número de requisições externas na aplicação, além de permitir um número ilimitado de encurtamento de links gratuitamente. O projeto também conta com uma pesquisa simples de perfis por qualquer atributo.

## Implementação

* O projeto é baseado principalmente na arquitetura MVC do Rails, com uma estrutura simples de apenas 2 models (Profile, Link) e seus respectivos controllers e views.
* Por realizar chamadas externas e não ser diretamente relacionado  ao model Profile, o código que realiza o web scraping foi adicionado a uma classe específica seguindo o padrão de services do Rails.
* O código foi implementado seguindo o método de desenvolvimento TDD, com o uso das gemas RSpec (para criação dos testes unitários) e SimpleCov (para acompanhamento da cobertura dos testes). Para diminuir o número de requisições externas durante os testes também foi adicionada a gema VCR, que armazena as informações das requisições em um arquivo .yml permitindo o reuso do conteúdo.
* Na escolha de todas as gemas foi considerada, além da funcionalidade, a popularidade da gema para aproveitar o conhecimento existente da comunidade e diminuir as chances de criar dependências com projetos que podem ser descontinuados.

## Possíveis melhorias

* Tratar possíveis erros na requisição ao Github com uma mensagem ao usuário.
* Atualização para as versões estáveis mais recentes do Ruby e do Rails.
* Adição de um framework CSS para facilitar o desenvolvimento front-end e melhorar a experiência do usuário.
* Adição de testes de comportamento com Capybara ou similar.
* Dockerização do projeto para minimizar problemas com dependências.
* Adição de um formulário de pesquisa de perfis por múltiplos atributos.
* Utilização dos recursos de internacionalização do Rails para tradução de labels e campos.



