<template>
      <nav>
        <div class="top_rectangle"></div>
        <div class="small_line"></div>
        <ul>
          <li><div class="windows" @click="selectNavItem('cameras')" :class="{ active: selectedNavItem === 'cameras' }">КАМЕРЫ</div></li>
          <li><div class="windows" @click="selectNavItem('statistics')" :class="{ active: selectedNavItem === 'statistics' }">СТАТИСТИКА</div></li>
        </ul>
      </nav>
        
  </template>

  <script>
  export default {
    data() {
      return {
        selectedNavItem: 'cameras' // Изначально выбран элемент "Камеры"
      };
    },
    emits: ['selectedNavItem'],
    methods: {
      selectNavItem(navItem) {
        this.selectedNavItem = navItem;
        this.$emit('selectedNavItem', navItem)
      }
    },
  };
  </script>

  <style>

  nav {
    /* background-color: #D9D9D9;
    width: 100%; */
    height: 5%;
  }

  ul {
    margin-top: 0;
    color: black;
    list-style-type: none;
    /* padding-top: 18px; */
    display: flex;
  }

  .top_rectangle {
    background-color: #D9D9D9;
    width: 100%;
    height: 20px;
  }

  .small_line {
    width: 100%;
    height: 3px;
    background-color: #8A8A8A;
    position: absolute;
    z-index: -1;
  }

  li {
    width: 12.57%;
    height: 2.78%;
  }

  .windows {
      width: 100%;
      display: flex;
      justify-content: center;
      padding: 5px;
      cursor: pointer;
      background: #8A8A8A;
      border-radius: 0 0 12px 12px;
      font-size: 1.5vw;
      z-index: 0;
    }

  .windows.active {
      background-color: #D9D9D9;
      z-index: 1;
    }
  </style>
