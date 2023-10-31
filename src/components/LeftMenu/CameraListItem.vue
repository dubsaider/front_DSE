<template>
    <div class="cameras-list-item"
        :class="{selected: this.isSelected}"
        @click="changeSelection">
            {{ this.cameraInfo.camera_name }}
    </div>
</template>

<script>
import { computed } from "vue";
import SingleCamera from "../SingleCamera.vue";

export default {
    components: {
        SingleCamera
    },
    props: ["cameraInfo"],
    data() {
        return {
            isSelected: false,// change color-schema if true and show camera on CameraGrid
            //cameraSource
            message: "mes"
        }
    },
    provide(){
        return {
            message: computed(() => this.message)
        }
    },
    mounted() {

    },
    methods: {
        changeSelection(){
            this.isSelected = !this.isSelected;
            this.$emit('changeCameraVisibility');
        }
    }
}
</script>

<style scoped>
.cameras-list-item {
    text-align: center;
    border: 0.5px solid #8B8B8B;
    border-radius: 10px;
    padding: 2% 2%;
    margin: 2% 2%;
}
.selected {
    border-color: darkgreen;
}
</style>