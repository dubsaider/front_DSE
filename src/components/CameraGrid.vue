<template>
  <div class="camera-grid-content">
    <!-- <video preload="auto" height="300" width="400" contorls autoplay muted loop>
      <source src="http://10.61.36.15:8000/api/camera/2/stream.m3u8" type="application/x-mpegURL">    
    </video>
    <video class="video-js" height="300" width="400" data-setup='{}'>
  <source src="http://10.61.36.15:8000/api/camera/2/stream.m3u8" type="application/x-mpegURL">
</video> -->
<!-- <video id="vid1" class="video-js" data-setup='{}'>
        <source src="http://10.61.36.15:8000/api/camera/35/stream.m3u8" type="application/x-mpegurl"/>
      </video> -->
    <single-camera
        v-for="camera in cameras"
          v-bind:id="camera.camera_id"
          v-bind:cameraId="camera.camera_id"
          v-bind:cameraSrc="camera.video_src"
      ></single-camera>
  </div>
</template>

<script>
import axios from "axios";
import Camera from "./Camera.vue";
import SingleCamera from "./SingleCamera.vue";
import videojs from "video.js";
import "video.js/dist/video-js.css";

const API_CAMERAS_PATH = "http://10.61.36.15:8000/api/cameras/"
const CAMERA_SRC_PREFIX = "http://10.61.36.15:8000/api/camera/"
const CAMERA_SRC_SUFFIX = "/stream.m3u8"

export default {
  name: "CameraGridContent",
  components: {
    Camera, SingleCamera
  },
  data() { //todo: must download when app mounted
    return {
  //camera_description: "Акватория, набережная. бублик возле 5 корпуса"
  //camera_ip: "10.37.16.80"
  //camera_name: "Набережная"
  //id: 5​
  //input_location: 8​​
  //output_location: 8
      cameras: [
        // // old { cameraId: 'video2', cameraSrc: `http://10.63.17.70:8000/api/video/test_480p.m3u8` },
        // // { cameraId: 'test', cameraSrc: 'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8'},
        // { cameraId: 'video2', cameraSrc: `http://10.61.36.15:8000/api/camera/2/stream.m3u8` },
        // { cameraId: 'video3', cameraSrc: `http://10.61.36.15:8000/api/camera/3/stream.m3u8` },
        // { cameraId: 'video4', cameraSrc: `http://10.61.36.15:8000/api/camera/4/stream.m3u8` },
        // { cameraId: 'video5', cameraSrc: `http://10.61.36.15:8000/api/camera/5/stream.m3u8` },
        // // { cameraId: 'video36', cameraSrc: `http://10.61.36.15:8000/api/camera/36/stream.m3u8` },
        // // { cameraId: 'video37', cameraSrc: `http://10.61.36.15:8000/api/camera/37/stream.m3u8` },
        // // { cameraId: 'video38', cameraSrc: `http://10.61.36.15:8000/api/camera/38/stream.m3u8` },
        // // { cameraId: 'video39', cameraSrc: `http://10.61.36.15:8000/api/camera/39/stream.m3u8` },
        // //{ cameraId: 'video40', cameraSrc: `http://10.61.36.15:8000/api/camera/40/stream.m3u8` },
        // // { cameraId: 'video3', cameraSrc: `http://10.61.36.15:8000/api/camera/3/stream.m3u8` },
        // // old { cameraId: 'video5', cameraSrc: `http://10.63.17.70:8000/api/camera/4/stream.m3u8` },
        // // // { cameraId: 'video4', cameraSrc: `http://10.61.36.15:8000/api/camera/4/stream.m3u8` },
        // //  { cameraId: 'video35', cameraSrc: `http://10.61.36.15:8000/api/camera/35/stream.m3u8` },
        // //  { cameraId: 'video32', cameraSrc: `http://10.61.36.15:8000/api/camera/32/stream.m3u8` },
        
      ]
    }
  },
  mounted() {
    this.getCameras();
  },
  methods: {
    getCameras() {
        axios.get(API_CAMERAS_PATH).then(
          (response) => {
              console.log("camera-grid request:")
              console.log(response);
              this.cameras = response.data;
              this.cameras.map((x) => x.video_src = CAMERA_SRC_PREFIX + x.id + CAMERA_SRC_SUFFIX)
          }
        )
      }
    }
}
</script>

<style scoped>

.camera-grid-content {
  /* width: 96.564%; */
  /* min-height: 95.322%; */
  min-height: 91.444%;
  padding: 1% 0% 1% 0%;
  margin: 1% 0% 1% 0%;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;

  /* flex-grow: 1; */
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 15px;
  background-color: #DCDCDC;
}

.camera-frame {
  max-width: 40%;
  max-height: 30%;
}
</style>