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
          v-bind:camera_id="camera.camera_id"
          v-bind:camera_src="camera.camera_src"
      ></single-camera>
  </div>
</template>

<script>
import Camera from "@/components/Camera.vue";
import SingleCamera from "./SingleCamera.vue";
import videojs from 'video.js';
import 'video.js/dist/video-js.css';

const records_src = '/public/Processed/';

export default {
  name: 'CameraGridContent',
  components: {
    Camera, SingleCamera
  },
  data() { //todo: must download when app mounted
    return {
      cameras: [
        // old { camera_id: 'video2', camera_src: `http://10.63.17.70:8000/api/video/test_480p.m3u8` },
        // { camera_id: 'test', camera_src: 'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8'},
        // { camera_id: 'video2', camera_src: `http://10.61.36.15:8000/api/camera/2/stream.m3u8` },
        { camera_id: 'video1', camera_src: `http://10.61.36.15:8000/api/camera/1/stream.m3u8` },
        // { camera_id: 'video3', camera_src: `http://10.61.36.15:8000/api/camera/3/stream.m3u8` },
        // old { camera_id: 'video5', camera_src: `http://10.63.17.70:8000/api/camera/4/stream.m3u8` },
        // { camera_id: 'video4', camera_src: `http://10.61.36.15:8000/api/camera/4/stream.m3u8` },
        { camera_id: 'video35', camera_src: `http://10.61.36.15:8000/api/camera/35/stream.m3u8` },
        { camera_id: 'video32', camera_src: `http://10.61.36.15:8000/api/camera/32/stream.m3u8` },
        
      ]
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