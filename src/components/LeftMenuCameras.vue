<template>
  <div class="left-menu">
    <hide-button/>
    <processing-list/>
  </div>
</template>

<script>
import HideButton from "@/components/HideButton.vue";
import ProcessingList from './ProcessingList.vue';
export default {
  components: {
    HideButton,
    ProcessingList,
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