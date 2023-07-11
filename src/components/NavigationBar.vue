<template>
      <nav>
        <ul>
          <div class="windows" @click="selectNavItem('cameras')" :class="{ active: selectedNavItem === 'cameras' }">Камеры</div>
          <div class="windows" @click="selectNavItem('statistics')" :class="{ active: selectedNavItem === 'statistics' }">Статистика</div>
        </ul>
      </nav>
        <!-- Здесь будет отображаться содержимое выбранного элемента навигационной панели -->
        <div v-if="selectedNavItem === 'cameras'">
          <!-- Разместите здесь код для отображения содержимого "Камеры" -->
          <h2>Камеры</h2>
          <!-- Дополнительный код, связанный с отображением камер -->
        </div>
        <div v-if="selectedNavItem === 'statistics'">
          <!-- Разместите здесь код для отображения содержимого "Статистики" -->
          <h2>Статистика</h2>
          <!-- Дополнительный код, связанный с отображением статистики -->
        </div>
  </template>

  <script>
  export default {
    data() {
      return {
        selectedNavItem: 'cameras' // Изначально выбран элемент "Камеры"
      };
    },
    methods: {
      selectNavItem(navItem) {
        this.selectedNavItem = navItem;
      }
    }
  };
  </script>

  <style>

  nav {
    background-color: #D9D9D9;
    width: 100%;
    height: 5%;
  }

  ul {
    color: black;
    list-style-type: none;
    padding-top: 18px;
    display: flex;
  }


.windows {
    padding: 5px;
    cursor: pointer;
    background: #8A8A8A;
    border-radius: 12px;
  }

.windows.active {
    background-color: #D9D9D9;
  }
  </style>
