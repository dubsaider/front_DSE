<template>
    <div class="statistic-grid">
      <modal-window v-on:close="closeWindow" v-if="modalWindowIsShowed">
        <single-camera-graphic
          v-bind:id=this.lastAttachedCamera.camera_id
          v-bind:camera_id=this.lastAttachedCamera.camera_id
          v-bind:camera_src=this.lastAttachedCamera.camera_src
          v-bind:location_name=this.lastAttachedCamera.location_name
        />
      </modal-window>
      <!-- <single-camera-graphic
          v-for="camera in cameras"
            v-bind:id="camera.camera_id"
            v-bind:camera_id="camera.camera_id"
            v-bind:camera_src="camera.camera_src"
            v-bind:location_name="camera.location_name"
      /> -->
      <single-camera-statistic
        v-for="camera in cameras"
          v-on:show="changeModalWindowVisibility"
          v-bind:id="camera.camera_id"
          v-bind:camera_id="camera.camera_id"
          v-bind:camera_name="camera.camera_name"
          v-bind:camera_src="camera.camera_src"
          v-bind:location_name="camera.location_name"
      />
      <!-- <dialog-window
        v-for="camera in cameras"
          v-bind:name="camera.camera_name"
          v-bind:content="camera"
      /> -->
    </div>
</template>

<script>
import SingleCameraGraphic from "./SingleCameraGraphic.vue";
import SingleCameraStatistic from "./SingleCameraStatistic.vue";
import DialogWindow from "./DialogWindow.vue";
import ModalWindow from "./Utils/ModalWindow.vue";

export default {
  name: "CameraGridContent",
  components: {
    SingleCameraStatistic, SingleCameraGraphic, DialogWindow, ModalWindow
  },
  methods:{
    changeModalWindowVisibility(card_id) {
      this.lastAttachedCamera = this.cameras.find(camera => {return camera.camera_id === card_id}) 
      this.modalWindowIsShowed = true;
      //alert(this.lastAttachedCamera.camera_id);
    },
    closeWindow(){
      this.modalWindowIsShowed = false;
    }
  },
  data() {
    return {
      modalWindowIsShowed: false,
      lastAttachedCamera: undefined,
      cameras: [
        {camera_id: "1", camera_name: "Корпус A", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус A&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус A"},
        {camera_id: "2", camera_name: "Корпус B", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус B&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус B"},
        {camera_id: "3", camera_name: "Корпус C", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус C&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус C"},
        {camera_id: "4", camera_name: "Корпус D", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус D&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус D"},
        {camera_id: "5", camera_name: "Корпус E", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус E&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус E"},
        {camera_id: "6", camera_name: "Корпус F", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус F&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус F"},
        {camera_id: "7", camera_name: "Корпус G", camera_src: "http://10.61.36.15:8000/api/data/?location=Корпус G&start_datestamp=2023-08-23T00:00:00", location_name: "Корпус G"},
        //{cameraId: "8", cameraName: "Кампус", camera_src: 'http://10.63.17.70:8000/api/data/?locationКампус&start_datestamp=2023-08-23T00:00:00', location_name: "Кампус"},
        {camera_id: "9", camera_name: "Г-3", camera_src: 'http://10.61.36.15:8000/api/data/?location=ГР-3&start_datestamp=2023-08-23T00:00:00', location_name: "ГР-3"},
        {camera_id: "10", camera_name: "Корпус S", camera_src: 'http://10.61.36.15:8000/api/data/?location=Корпус S&start_datestamp=2023-08-23T00:00:00', location_name: "Корпус S"},
        {camera_id: "11", camera_name: "ГР-1", camera_src: 'http://10.61.36.15:8000/api/data/?location=ГР-1&start_datestamp=2023-08-23T00:00:00', location_name: "ГР-1"},
        {camera_id: "12", camera_name: "ГР-2", camera_src: 'http://10.61.36.15:8000/api/data/?location=ГР-2&start_datestamp=2023-08-23T00:00:00', location_name: "ГР-2"},
        {camera_id: "13", camera_name: "Зона A", camera_src: "http://10.61.36.15:8000/api/data/?location=Зона A&start_datestamp=2023-08-23T00:00:00", location_name: "Зона A"},
        {camera_id: "14", camera_name: "Зона B", camera_src: "http://10.61.36.15:8000/api/data/?location=Зона B&start_datestamp=2023-08-23T00:00:00", location_name: "Зона B"},
        {camera_id: "15", camera_name: "Зона C", camera_src: "http://10.61.36.15:8000/api/data/?location=Зона C&start_datestamp=2023-08-23T00:00:00", location_name: "Зона C"},
        {camera_id: "16", camera_name: "Зона D", camera_src: "http://10.61.36.15:8000/api/data/?location=Зона D&start_datestamp=2023-08-23T00:00:00", location_name: "Зона D"},
        {camera_id: "18", camera_name: "Корпус M", camera_src: 'http://10.61.36.15:8000/api/data/?location=Корпус M&start_datestamp=2023-08-23T00:00:00', location_name: 'Корпус M'},
        {camera_id: "19", camera_name: "Медицинсккий корпус", camera_src: 'http://10.61.36.15:8000/api/data/?location=19&start_datestamp=2023-08-23T00:00:00', location_name: 'Медицинский корпус'},
        {camera_id: "20", camera_name: "Лабораторный корпус", camera_src: 'http://10.61.36.15:8000/api/data/?location=20&start_datestamp=2023-08-23T00:00:00', location_name: 'Лабораторный корпус'},
        {camera_id: "21", camera_name: "Малый Аякс", camera_src: 'http://10.61.36.15:8000/api/data/?location=21&start_datestamp=2023-08-23T00:00:00', location_name: 'Малый Аякс'},
        {camera_id: "22", camera_name: "S1", camera_src: 'http://10.61.36.15:8000/api/data/?location=22&start_datestamp=2023-08-23T00:00:00', location_name: 'S1'},
        {camera_id: "23", camera_name: "S2", camera_src: 'http://10.61.36.15:8000/api/data/?location=23&start_datestamp=2023-08-23T00:00:00', location_name: 'S2'},
        {camera_id: "24", camera_name: "Зона A4", camera_src: 'http://10.61.36.15:8000/api/data/?location=24&start_datestamp=2023-08-23T00:00:00', location_name: 'Зона A4'},
        {camera_id: "25", camera_name: "Конференц зал Сопка", camera_src: 'http://10.61.36.15:8000/api/data/?location=25&start_datestamp=2023-08-23T00:00:00', location_name: 'Конференц зал Сопка'},
        {camera_id: "26", camera_name: "Конференц зал Средний", camera_src: 'http://10.61.36.15:8000/api/data/?location=26&start_datestamp=2023-08-23T00:00:00', location_name: 'Конференц зал Средний'},
        {camera_id: "27", camera_name: "Конференц зал Морской", camera_src: 'http://10.61.36.15:8000/api/data/?location=27&start_datestamp=2023-08-23T00:00:00', location_name: 'Конференц зал Морской'},
        {camera_id: "28", camera_name: "Бассейн S", camera_src: 'http://10.61.36.15:8000/api/data/?location=28&start_datestamp=2023-08-23T00:00:00', location_name: 'Бассейн S'},
        {camera_id: "29", camera_name: "Бассейн S1", camera_src: 'http://10.61.36.15:8000/api/data/?location=29&start_datestamp=2023-08-23T00:00:00', location_name: 'Бассейн S1'},
        {camera_id: "30", camera_name: "Бассейн S2", camera_src: 'http://10.61.36.15:8000/api/data/?location=30&start_datestamp=2023-08-23T00:00:00', location_name: 'Бассейн S2'},
        {camera_id: "31", camera_name: "Стадион", camera_src: 'http://10.61.36.15:8000/api/data/?location=31&start_datestamp=2023-08-23T00:00:00', location_name: 'Стадион'},
        {camera_id: "32", camera_name: "Бухта Аякс", camera_src: 'http://10.61.36.15:8000/api/data/?location=32&start_datestamp=2023-08-23T00:00:00', location_name: 'Бухта Аякс'},
        {camera_id: "8", camera_name: "Кампус", camera_src: 'http://10.61.36.15:8000/api/data/?location=8&start_datestamp=2023-08-23T00:00:00', location_name: 'Кампус'},
      ] 
    }
  }
}
</script>

<style>
.statistic-grid{
    min-height: 100vh;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 15px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    align-content: space-around;
}
</style>