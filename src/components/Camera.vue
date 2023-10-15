<template>
    <div>
      <video ref="videoPlayer" class="video-js" autoplay></video>
    </div>
  </template>
  
  <script>
  import videojs from "video.js";
  import "video.js/dist/video-js.css";
  import axios from "axios";
  
  export default {
    data() {
      return {
        hlsUrl: null,
      };
    },
    mounted() {
      this.fetchHlsUrl();
    },
    methods: {
      fetchHlsUrl() {
        const streamId = 1; // Замените на реальный ID потока
        const apiUrl = "http://10.61.162.13:8000/api/video/test_480p.m3u8";
  
        axios.get(apiUrl)
          .then(response => {
            this.hlsUrl = response.data.hls_url;
            this.initializePlayer();
          })
          .catch(error => {
            console.error("Failed to fetch HLS URL:", error);
          });
      },
      initializePlayer() {
        // Создание плеера Video.js с использованием HLS-плагина
        this.player = videojs(this.$refs.videoPlayer, {
          techOrder: ["html5"],
          html5: {
            hls: {
              overrideNative: true,
            },
          },
        });
  
        // Установка источника HLS-потока
        videojs.obj.merge(this.player.options_, {
          sources: [
            {
              src: this.hlsUrl,
              type: "application/x-mpegURL",
            },
          ],
        });
  
        // Запуск воспроизведения
        this.player.play();
      },
    },
    beforeDestroy() {
      // Уничтожение плеера перед удалением компонента
      if (this.player) {
        this.player.dispose();
      }
    },
  };
  </script>
  
  <style>
  .video-js {
    width: 50%;
  }
  </style>
  