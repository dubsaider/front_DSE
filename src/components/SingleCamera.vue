<template>
    <!-- old <video class="camera" src="http://10.61.36.15:8000/api/camera/2/stream.m3u8"
        contorls autoplay muted loop></video> -->
     <!-- this is valid <video class="video-js" data-setup='{}'>
        <source src="http://10.61.36.15:8000/api/camera/35/stream.m3u8" type="application/x-mpegurl">
     </video> -->
     <!-- <video class="video-js" data-setup="{}">
        <source src="http://10.61.36.15:8000/api/camera/35/stream.m3u8" type="application/x-mpegurl">
     </video> -->
     <!-- <video class="video-js" data-setup="{}">
        <source type="application/x-mpegurl" >
     </video> -->
    
    <!-- <video-player v-bind:options="this.videoOptions"/> -->
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
    beforeMount(){
        // let sourceHTML = this.getElementsByTagName('source');
        // console.log(sourceHTML);
    },
    mounted() {
        //console.log(this);
        // this.player = videojs(this.camera_id, this.options, () => {
        //     this.player.log('onPlayerReady', this);
        // }); 
        // this.player.children_[0].children[0].src = this.camera_src;
        // console.log(this.player.children_[0].children[0].src);
        this.getStream(this.camera_id, this.camera_src);
        this.fetchAndPlay(this.camera_id, this.camera_src);
    },
    data() {
        return {
            videoOptions: {
                autoplay: true,
                //controls: true,
                loop: true,
                muted: true,
                sources: [
                    {
                        src: this.camera_src,
                        type: "video/mp2t"//"application/x-mpegURL"
                    }
                ],
                preload: "meta",
                techOrder: ['html5'],
                html5: {
                    hls: {
                        //enableLowInitialPlaylist: true,
                        //smoothQualityChange: true,
                        overrideNative: true
                    }
                }
            }
        };
    },
    methods: {
        getStream(cameraId, streamId){
            axios.get(streamId)
            .then((response) => {
                console.log("Camera # " + cameraId + " response:");
                console.log(response.data);
            });
        },
        fetchAndPlay(cameraId, streamId) {
            //fetch(streamId)
            //.then((response) => {response;});
            let video = document.getElementById(cameraId);

            if (Hls.isSupported()) {
                let hls = new Hls({liveDurationInfinity: true});//{debug: true});

                hls.on(Hls.Events.MEDIA_ATTACHED, function () {
                    console.log('video and hls.js are now bound together');
                });

                hls.on(Hls.Events.MANIFEST_PARSED, function (event, data) {
                    //console.log('manifest loaded, fount ' + data.levels.length + ' quality level');
                    console.log(cameraId);
                    console.log(data.stats);
                    // hls.loadSource(streamId);
                    // hls.attachMedia(video);
                    // video.play;
                    //if (data.stats.parsing.end !== 0) {
                        data.stats.parsing.end = 0;
                    //}
                    console.log(data.stats);
                });

                //hls.startLoad(-1);
                hls.loadSource(streamId);
                hls.attachMedia(video);
                let playPromise = video.play;

                //if (playPromise !== undefined) {
                //    playPromise.then(_ => {}).catch(error => {});
               // }
            }
            else if (video.canPlayType('application/x-mpegURL')){
                console.log('ddd');
                video.src = streamId;
                video.addEventListener('loadedmetadata', function() {
                    video.play();
                });
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