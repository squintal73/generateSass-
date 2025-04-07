# Generate Sass Structure

Este projeto é um script shell que automatiza a criação de uma estrutura SASS organizada para projetos web, incluindo um dashboard responsivo com suporte a tema claro/escuro.

## 🚀 Funcionalidades

- Criação automática de uma estrutura SASS modular
- Componentes pré-definidos para dashboard
- Suporte a tema claro/escuro
- Layout responsivo
- Componentes incluídos:
  - Sidebar
  - Header
  - Cards
  - Gráficos
  - Toggle de tema
  - Variáveis e mixins

## 📁 Estrutura do Projeto

```
.
├── styles/
│   ├── _variables.scss
│   ├── _mixins.scss
│   ├── _sidebar.scss
│   ├── _header.scss
│   ├── _cards.scss
│   ├── _charts.scss
│   ├── _theme-toggle.scss
│   ├── _responsive.scss
│   └── main.scss
├── index.html
└── create-sass-structure.sh
```

## 🛠️ Como Usar

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITÓRIO]
```

2. Torne o script executável:
```bash
chmod +x create-sass-structure.sh
```

3. Execute o script:
```bash
./create-sass-structure.sh
```

4. Compile o SASS para CSS:
```bash
sass styles/main.scss styles/main.css --watch
```

## 🎨 Componentes

### Variáveis
- Cores primárias e secundárias
- Espaçamentos padronizados
- Variáveis de tema (claro/escuro)

### Mixins
- Estilos reutilizáveis para cards
- Funções de layout comuns

### Layout
- Grid responsivo
- Sidebar colapsável
- Header com ações do usuário
- Cards de dashboard
- Seção de gráficos

## 🌓 Tema Claro/Escuro

O projeto inclui suporte nativo para tema claro e escuro, utilizando variáveis CSS. O toggle de tema pode ser implementado facilmente através do componente `.theme-toggle`.

## 📱 Responsividade

O layout é totalmente responsivo, com breakpoints para diferentes tamanhos de tela:
- Desktop: > 768px
- Mobile: ≤ 768px

## 🔧 Requisitos

- Node.js (para compilação do SASS)
- SASS CLI instalado globalmente:
```bash
npm install -g sass
```

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes. 