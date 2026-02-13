# App Lista de Compras

## Descrição

O **App Lista de Compras** é um aplicativo mobile desenvolvido em Flutter com o objetivo de auxiliar usuários na organização de suas compras do dia a dia.  
O sistema permite criar listas, adicionar itens, marcar produtos como comprados e acompanhar o progresso de cada lista.

O projeto foi desenvolvido com foco em simplicidade, usabilidade e aprendizado em desenvolvimento mobile.

---

## Funcionalidades

- Criar listas de compras
- Adicionar itens às listas
- Informar nome e valor dos produtos
- Marcar itens como comprados
- Exibir progresso por lista
- Calcular total de itens marcados e não marcados
- Interface simples e intuitiva
- Atualização automática dos dados

---

## Tecnologias Utilizadas

- Flutter
- Dart
- Material Design
- Git e GitHub

---

## Estrutura do Projeto


```text
lib/
├── model/
│   ├── Item.dart
│   └── ListaCompra.dart
├── pages/
│   ├── add_list.page.dart
│   ├── compras_list.page.dart
│   └── datail_list.page.dart
├── widgets/
│   └── add_item.widget.dart
│   └── listaDeCompras.widget.dart
│   └── telaVazia.widget.dart
└── main.dart
```



---

## Como Executar o Projeto

### Pré-requisitos

- Flutter instalado  
- Android Studio ou VS Code  
- Emulador configurado ou dispositivo físico  

### Passos

1. Clone o repositório:

```bash
git clone git@github.com:Lucas12310/app-lista-compras.git


Acesse a pasta do projeto:

cd app_lista_compras


Instale as dependências:

flutter pub get


Execute o aplicativo:

flutter run
