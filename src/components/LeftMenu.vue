<template>
  <div class="left-menu">
    <hide-button/>
    <camera-list/>
  </div>
</template>

<script>
import HideButton from "@/components/HideButton.vue";
import CameraList from "@/components/CameraList.vue";
export default {
  components: {
    HideButton, CameraList
  }
}
</script>

<style scoped>

.left-menu {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 1% 0% 1% 0%;
  max-width: 15%;
  min-height: 91.309%;
  background-color: #D9D9D9;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 15px;
}
</style>