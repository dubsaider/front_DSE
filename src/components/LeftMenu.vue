<template>
  <div class="left-menu">
    <navigation-bar @selected-nav-item="(res) => selectedNavItem = res" />
    <div v-if="selectedNavItem === 'cameras'">
      <hide-button/>
      <camera-list/>
      <camera-control/>
    </div>

    <div v-if="selectedNavItem === 'statistics'">
      <left-menu-processing/>
    </div>

    <div v-if="selectedNavItem === 'processing'">
      <left-menu-processing/>
    </div>


  </div>
</template>



<script>
import HideButton from "@/components/HideButton.vue";
import CameraList from "@/components/CameraList.vue";
import CameraControl from "./CameraControl.vue";
import LeftMenuProcessing from "./LeftMenuProcessing.vue";

export default {
  data() {
    return {
      selectedNavItem: 'cameras' // Изначально выбран элемент "Камеры"
    };
  },
  components: {
    HideButton,
    CameraList,
    CameraControl,
    LeftMenuProcessing,
}
}
</script>



































<style scoped>

.left-menu {
  display: flex;
  flex-direction: column;
  align-self: start;
  align-items: center;
  padding: 1% 0% 1% 0%;
  width: 15%;
  min-height: 91.309%;
  background-color: #D9D9D9;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 15px;
}
</style>