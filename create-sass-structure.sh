#!/bin/bash

# Cores para output
GREEN='\033[0;32m'
NC='\033[0m'

# Criar diretório styles se não existir
mkdir -p styles

# Criar arquivo _variables.scss
cat > styles/_variables.scss << 'EOL'
// Cores
$primary: #4361ee;
$success: #2ecc71;
$dark: #484b57;
$light: #f3eeee;

// Espaçamentos
$spacing-sm: 0.5rem;
$spacing-md: 1rem;
$spacing-lg: 2rem;

// Cores do tema
:root {
  --text-color: #2b394d;
  --bg-color: #fdfdfd;
}

[data-theme="dark"] {
  --text-color: #9aadc0;
  --bg-color: #3c3947;
}
 
EOL

# Criar arquivo _mixins.scss
cat > styles/_mixins.scss << 'EOL'
@mixin card-style {
  background: var(--bg-color);
  border-radius: 8px;
  padding: $spacing-md;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
EOL

# Criar arquivo _sidebar.scss
cat > styles/_sidebar.scss << 'EOL'
.sidebar {
  background: $dark;
  color: $light;
  width: 250px;
  height: 100vh;
  padding: $spacing-md;

  &__menu {
    margin-top: $spacing-lg;

    li {
      padding: $spacing-sm 0;
      cursor: pointer;

      &:hover {
        color: $primary;
      }
    }
  }
}
EOL

# Criar arquivo _header.scss
cat > styles/_header.scss << 'EOL'
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: $spacing-lg;

  &__actions {
    display: flex;
    align-items: center;
    gap: $spacing-md;
  }

  &__user {
    display: flex;
    align-items: center;
    gap: $spacing-sm;
  }
}
EOL

# Criar arquivo _cards.scss
cat > styles/_cards.scss << 'EOL'
.dashboard-cards {
  display: flex;
  gap: $spacing-lg;
  padding: $spacing-lg;
  flex-wrap: wrap;
 

  .card {
    @include card-style;
    flex: 1;
    min-width: 250px;
    background: var(--bg-color);
    transition: transform 0.3s ease, box-shadow 0.1s ease;
    cursor: pointer;

    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 16px rgba(0, 0, 0, 0.1);
    }

    &__title {
      color: var(--text-color);
      font-size: 14px;
    }

    &__value {
      font-size: 24px;
      font-weight: bold;
      color: $primary;
    }

    &--success {
      .card__value { color: $success; }
    }
  }
}

EOL

# Criar arquivo _charts.scss
cat > styles/_charts.scss << 'EOL'
.chart-section {
  padding: $spacing-lg;
}

.chart-container {
  background: var(--bg-color);
  border-radius: 8px;
  padding: $spacing-md;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
EOL

# Criar arquivo _theme-toggle.scss
cat > styles/_theme-toggle.scss << 'EOL'
.theme-toggle {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--bg-color);
  cursor: pointer;
  position: relative;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

  &::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 20px;
    height: 20px;
    background: var(--text-color);
    border-radius: 50%;
  }
}
EOL

# Criar arquivo _responsive.scss
cat > styles/_responsive.scss << 'EOL'
@media (max-width: 768px) {
  .app {
    grid-template-columns: 1fr;
  }

  .sidebar {
    display: none;
  }
}
EOL

# Criar arquivo main.scss
cat > styles/main.scss << 'EOL'
// Arquivo principal - importa todos os outros
@import 'variables';
@import 'mixins';
@import 'sidebar';
@import 'header';
@import 'cards';
@import 'charts';
@import 'theme-toggle';
@import 'responsive';

// Estilos globais

h1 {
  color: var(--text-color);
}

span {
  color: var(--text-color);
}

body {
  margin: 0;
  font-family: Arial, sans-serif;
}

// Layout principal
.app {
  display: grid;
  grid-template-columns: 250px 1fr;
  min-height: 100vh;
}

.main-content {
  padding: $spacing-md;
  background: $light;
  color: $dark;
}
EOL

# Criar arquivo index.html
cat > index.html << 'EOL'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard com Sass</title>
  <link rel="stylesheet" href="styles/main.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <div class="app">
    <aside class="sidebar">
      <h2>Dashboard</h2>
      <ul class="sidebar__menu">
        <li>Home</li>
        <li>Relatórios</li>
        <li>Configurações</li>
      </ul>
    </aside>

    <div class="main-content">
      <header class="header">
        <h1>Olá, Admin!</h1>
        <div class="header__actions">
          <div class="theme-toggle" id="themeToggle"></div>
          <div class="header__user">
            <span>João Silva</span>
          </div>
        </div>
      </header>

      <section class="dashboard-cards">
        <div class="card">
          <p class="card__title">Total de Vendas</p>
          <p class="card__value">R$ 12,540</p>
        </div>
        <div class="card card--success">
          <p class="card__title">Novos Usuários</p>
          <p class="card__value">+ 124</p>
        </div>
      </section>

      <section class="chart-section">
        <div class="chart-container">
          <canvas id="salesChart"></canvas>
        </div>
      </section>
    </div>
  </div>

  <script>
    const themeToggle = document.getElementById('themeToggle');

    themeToggle.addEventListener('click', () => {
      const currentTheme = document.documentElement.getAttribute('data-theme');
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      document.documentElement.setAttribute('data-theme', newTheme);
      themeToggle.setAttribute('data-theme', newTheme);
    });

    const ctx = document.getElementById('salesChart').getContext('2d');
    const salesChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun'],
        datasets: [{
          label: 'Vendas 2023',
          data: [12000, 19000, 15000, 18000, 21000, 24000],
          borderColor: '#4361ee',
          tension: 0.3,
          fill: true,
          backgroundColor: 'rgba(67, 97, 238, 0.1)',
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { position: 'top' },
        },
        scales: {
          y: { beginAtZero: true }
        }
      }
    });

    function updateChartTheme() {
      const isDark = document.documentElement.getAttribute('data-theme') === 'dark';
      const gridColor = isDark ? 'rgba(255, 255, 255, 0.1)' : 'rgba(0, 0, 0, 0.1)';
      const textColor = isDark ? '#f8f9fa' : '#1f2937';

      salesChart.options.scales.x.grid.color = gridColor;
      salesChart.options.scales.y.grid.color = gridColor;
      salesChart.options.scales.x.ticks.color = textColor;
      salesChart.options.scales.y.ticks.color = textColor;
      salesChart.update();
    }

    themeToggle.addEventListener('click', updateChartTheme);
  </script>
</body>
</html>
EOL

echo -e "${GREEN}Estrutura SASS criada com sucesso!${NC}"
echo "Para compilar o SASS, execute:"
echo "sass --watch styles/main.scss:styles/main.css" 