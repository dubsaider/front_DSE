<template>
    <video class="camera" contorls autoplay muted loop></video>
</template>

<script>
import Hls from "hls.js";
import axios from "axios";
import CameraListItem from "./LeftMenu/CameraListItem.vue";

export default {
    props: [
        "camera_id", 
        "camera_src",
    ],
    // inject: [
    //     "message"
    // ],
    beforeMount() {},
    mounted() {
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
                        type: "application/x-mpegURL"
                    }
                ],
                preload: "meta",
                techOrder: ["html5"],
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
        changeCameraVisibility(){
            
        },
        getStream(cameraId, streamId){
            axios.get(streamId)
            .then((response) => {
                console.log("Camera # " + cameraId + " response:");
                console.log(response.data);
            });
        },
        fetchAndPlay(cameraId, streamId) {
            let video = document.getElementById(cameraId);

            if (Hls.isSupported()) {
                let hls = new Hls({
                    liveDurationInfinity: true,
                    autoStartLoad: false,
                });//{debug: true});

                hls.on(Hls.Events.MEDIA_ATTACHED, function () {
                    console.log("video and hls.js are now bound together");
                });

                hls.on(Hls.Events.MANIFEST_PARSED, function (event, data) {
                    hls.startLoad(0);
                    console.log("Manifest loaded, fount " + data.levels.length + " quality level");
                    
                });

                hls.loadSource(streamId);
                hls.attachMedia(video);
            }
            else if (video.canPlayType("application/x-mpegURL")){
                video.src = streamId;
                video.addEventListener("loadedmetadata", function() {
                    video.play();
                });
            }
            console.log("That's ok")
        }
    }
}
</script>

<style>
.camera {
    max-width: 40%; 
    max-height: 30%;
    /* display: none; */
}
</style>