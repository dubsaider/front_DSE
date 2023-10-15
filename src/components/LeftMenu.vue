<template>
  <div class="left-menu">
    <hide-button/>
    <camera-list/>
    <camera-control/>
  </div>
</template>

<script>
import HideButton from "@/components/HideButton.vue";
import CameraList from "@/components/LeftMenu/CamerasList.vue";
import CameraControl from "./CameraControl.vue";
export default {
  components: {
    HideButton, 
    CameraList,
    CameraControl
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