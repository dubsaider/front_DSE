<template>
    <video class="camera" contorls autoplay muted loop></video>
</template>

<script>
import Hls from 'hls.js';
import axios from 'axios';
import videojs from 'video.js';
import 'video.js/dist/video-js.css';

import VideoPlayer from '@/components/VideoPlayer.vue';

export default {
    components: {
        VideoPlayer
    },
    props: ['camera_id', 'camera_src'],
    mounted() {
        this.fetchAndPlay(this.camera_id, this.camera_src);
    },
    methods: {
        fetchAndPlay(cameraId, streamId) {
            let video = document.getElementById(cameraId);

            if (Hls.isSupported()) {
                let hls = new Hls({
                    liveDurationInfinity: true,
                    autoStartLoad: false,
                });//{debug: true});

                hls.on(Hls.Events.MEDIA_ATTACHED, function () {
                    console.log('video and hls.js are now bound together');
                });

                hls.on(Hls.Events.MANIFEST_PARSED, function (event, data) {
                    hls.startLoad(0);
                    console.log('Manifest loaded, fount ' + data.levels.length + ' quality level');
                    
                });

                hls.loadSource(streamId);
                hls.attachMedia(video);
                let playPromise = video.play;

                if (playPromise !== undefined) {
                   playPromise.then(_ => {}).catch(error => {});
               }
            }
            else if (video.canPlayType('application/x-mpegURL')){
                //TODO: Show error
            }
        }
    }
}
</script>

<style>
.camera {
    /* min-width: 40%; */
    /* max-width: 50%; */
    max-width: 40%; 
    max-height: 30%;
    /* max-height: 30%;  */
}
</style>