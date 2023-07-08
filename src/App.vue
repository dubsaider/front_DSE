<template>
  <div id="app">
    <navigation-bar @selected-nav-item="(res) => selectedNavItem = res"/>
    <div v-if="selectedNavItem === 'cameras'">
      <div class="main-wrapper">

        <left-menu/>

        <div class="main-content">
          <camera-list-manage/>
          <camera-grid/>
        </div>

        </div>
        <!--<camera-pop-up-menu/> -->
    </div>
    
  </div>
</template>

<script>
import CameraListManage from "@/components/CameraListManage.vue"
import LeftMenu from "@/components/LeftMenu.vue";
import CameraGrid from "@/components/CameraGrid.vue"
import CameraPopUpMenu from "@/components/CameraPopUpMenu.vue";
import NavigationBar from "./components/NavigationBar.vue";


export default {
  data() {
    return {
      selectedNavItem: 'cameras' // Изначально выбран элемент "Камеры"
    };
  },
  components: {
    CameraListManage,
    LeftMenu,
    CameraGrid,
    CameraPopUpMenu,
    NavigationBar
  }
}
</script>

<style>
@import 'normalize.css';

@import url(
'https://fonts.googleapis.com/css2?family=Jura:wght@500&display=swap'
);

@font-face {
  font-family: 'Jura', sans-serif;
}


#app {
  position: absolute;
  min-width: 100%;
  min-height: 100vh;
  /*max-width: 100%;
  height: 100vh;
  /*width: 1440px;
  height: 1024px;*/
}

.main-wrapper {
  min-width: 100%;
  min-height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-around;
}

.main-content {
  min-width: 80.83%;
  min-height: 91.309%;

  display: flex;
  flex-direction: column;
  align-self: start;
  justify-content: space-between;
}

html, body {
  min-height: 100%;
  min-width: 100%;
  font-family: 'Jura', sans-serif;
}

</style>
