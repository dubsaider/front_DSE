<template>
    <div class="dialog-window-wrapper">
        <div class="dialog-window-titlebar">
            <div> {{ this.name }}</div>
            <div> {{ this.content.camera_id }}</div>
            <button></button>
        </div>
        <div class="dialog-window-content">
            <single-camera-graphic
                v-bind:id="this.content.camera_id"
                v-bind:camera_id="this.content.camera_id"
                v-bind:camera_src="this.content.camera_src"
                v-bind:location_name="this.content.location_name"
            />
        </div>
    </div>
</template>

<script>
import SingleCameraGraphic from './SingleCameraGraphic.vue';

export default {
    name: 'DialogWindow',
    componets: {
        SingleCameraGraphic
    },
    props: ['name', 'content'],
    components: { SingleCameraGraphic },
    onMounted(){
        () => {
            console.log(this.content);
        }
    }
}
</script>

<style>
.dialog-window-wrapper {
    width: 80vw;
    height: 80vh;
    background-color: rgba(255, 255, 255, 0.5);
    position: fixed;
}

.dialog-window-titlebar {
    height: 5%;
    background-color: rgb(216, 216, 216);
    display: flex;
    justify-content: space-between;
}
button {
    width: 5%;
    background-color: aqua;
}
</style>