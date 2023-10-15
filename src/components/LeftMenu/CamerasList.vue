<template>
    <div class="camera-list">
        <camera-list-item
            v-for="camera in cameras"
                v-bind:cameraInfo="camera"
        />
    </div>
</template>

<script>
import axios from "axios";

import CameraListItem from "./CameraListItem.vue";

const API_CAMERAS_PATH = "http://10.61.36.15:8000/api/cameras/"

export default {
    components: {
        CameraListItem
    },
    data() {
        return {
            cameras: []
        }
    },
    mounted() {
        this.getCameras();
    },
    methods: {
        getCameras() {
            axios.get(API_CAMERAS_PATH).then(
                (response) => {
                    console.log(response);
                    this.cameras = response.data;
                }
            )
        }
    }
}
</script>

<style>
.camera-list {
    max-width: 91.666%;
    max-height: 53.092vh;
    padding: 2% 2%;
    margin: 2% 2%;
    overflow-y: auto;
    overflow-x: hidden;
}
</style>