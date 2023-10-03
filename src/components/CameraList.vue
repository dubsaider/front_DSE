<template>
  <div class="camera-list">
    <camera-search></camera-search>
    <div class="list-content">
      <expanded-group></expanded-group>
      <collapsed-group></collapsed-group>
      <collapsed-group></collapsed-group>
      <collapsed-group></collapsed-group>
      <collapsed-group></collapsed-group>
      <collapsed-group></collapsed-group>
      <collapsed-group></collapsed-group>
      <collapsed-group></collapsed-group>
    </div>
  </div>
</template>

<script>
import CameraSearch from "@/components/CameraSearch.vue";
import CollapsedGroup from "@/components/CollapsedGroup.vue";
import ExpandedGroup from "@/components/ExpandedGroup.vue";

export default {
  components: {
    CameraSearch,
    CollapsedGroup,
    ExpandedGroup
  }
}
</script>

<style>
.camera-list {
  width: 91.666%;
  height: 53.092%;
  padding: 2% 0% 0% 0%;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  background-color: #FAFAFA;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 11px;
}

.list-content {
  height: 89.98%;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}

</style>