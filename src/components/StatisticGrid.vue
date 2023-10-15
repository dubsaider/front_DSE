<template>
    <div class="statistic-grid">
      <single-camera-graphic
          v-for="camera in cameras"
            v-bind:id="camera.camera_id"
            v-bind:camera_id="camera.camera_id"
            v-bind:camera_src="camera.camera_src"
            v-bind:location_name="camera.location_name"
      />
      <single-camera-statistic
        v-for="camera in cameras"
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

export default {
  name: "CameraGridContent",
  components: {
    SingleCameraStatistic, SingleCameraGraphic, DialogWindow
  },
  data() {
    return {
      cameras : [
        {cameraId: "1", cameraName: "Корпус A", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус A&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус A"},
        {cameraId: "2", cameraName: "Корпус B", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус B&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус B"},
        {cameraId: "3", cameraName: "Корпус C", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус C&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус C"},
        {cameraId: "4", cameraName: "Корпус D", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус D&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус D"},
        {cameraId: "5", cameraName: "Корпус E", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус E&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус E"},
        {cameraId: "6", cameraName: "Корпус F", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус F&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус F"},
        {cameraId: "7", cameraName: "Корпус G", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Корпус G&start_datestamp=2023-08-23T00:00:00", locationName: "Корпус G"},
        //{cameraId: "8", cameraName: "Кампус", cameraSrc: 'http://10.63.17.70:8000/api/data/?locationКампус&start_datestamp=2023-08-23T00:00:00', location_name: "Кампус"},
        {cameraId: "9", cameraName: "Г-3", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=ГР-3&start_datestamp=2023-08-23T00:00:00', locationName: "ГР-3"},
        {cameraId: "10", camera_name: "Корпус S", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=Корпус S&start_datestamp=2023-08-23T00:00:00', locationName: "Корпус S"},
        {cameraId: "11", camera_name: "ГР-1", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=ГР-1&start_datestamp=2023-08-23T00:00:00', locationName: "ГР-1"},
        {cameraId: "12", camera_name: "ГР-2", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=ГР-2&start_datestamp=2023-08-23T00:00:00', locationName: "ГР-2"},
        {cameraId: "13", camera_name: "Зона A", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Зона A&start_datestamp=2023-08-23T00:00:00", locationName: "Зона A"},
        {cameraId: "14", camera_name: "Зона B", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Зона B&start_datestamp=2023-08-23T00:00:00", locationName: "Зона B"},
        {cameraId: "15", camera_name: "Зона C", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Зона C&start_datestamp=2023-08-23T00:00:00", locationName: "Зона C"},
        {cameraId: "16", camera_name: "Зона D", cameraSrc: "http://10.61.36.15:8000/api/data/?location=Зона D&start_datestamp=2023-08-23T00:00:00", locationName: "Зона D"},
        {cameraId: "18", camera_name: "Корпус M", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=Корпус M&start_datestamp=2023-08-23T00:00:00', locationName: 'Корпус M'},
        {cameraId: "19", camera_name: "Медицинсккий корпус", camera_src: 'http://10.61.36.15:8000/api/data/?location=19&start_datestamp=2023-08-23T00:00:00', locationName: 'Медицинский корпус'},
        {cameraId: "20", camera_name: "Лабораторный корпус", camera_src: 'http://10.61.36.15:8000/api/data/?location=20&start_datestamp=2023-08-23T00:00:00', locationName: 'Лабораторный корпус'},
        {cameraId: "21", camera_name: "Малый Аякс", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=21&start_datestamp=2023-08-23T00:00:00', locationName: 'Малый Аякс'},
        {cameraId: "22", camera_name: "S1", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=22&start_datestamp=2023-08-23T00:00:00', locationName: 'S1'},
        {cameraId: "23", camera_name: "S2", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=23&start_datestamp=2023-08-23T00:00:00', locationName: 'S2'},
        {cameraId: "24", camera_name: "Зона A4", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=24&start_datestamp=2023-08-23T00:00:00', locationName: 'Зона A4'},
        {cameraId: "25", camera_name: "Конференц зал Сопка", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=25&start_datestamp=2023-08-23T00:00:00', locationName: 'Конференц зал Сопка'},
        {cameraId: "26", camera_name: "Конференц зал Средний", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=26&start_datestamp=2023-08-23T00:00:00', locationName: 'Конференц зал Средний'},
        {cameraId: "27", camera_name: "Конференц зал Морской", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=27&start_datestamp=2023-08-23T00:00:00', locationName: 'Конференц зал Морской'},
        {cameraId: "28", camera_name: "Бассейн S", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=28&start_datestamp=2023-08-23T00:00:00', locationName: 'Бассейн S'},
        {cameraId: "29", camera_name: "Бассейн S1", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=29&start_datestamp=2023-08-23T00:00:00', locationName: 'Бассейн S1'},
        {cameraId: "30", camera_name: "Бассейн S2", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=30&start_datestamp=2023-08-23T00:00:00', locationName: 'Бассейн S2'},
        {cameraId: "31", camera_name: "Стадион", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=31&start_datestamp=2023-08-23T00:00:00', locationName: 'Стадион'},
        {cameraId: "32", camera_name: "Бухта Аякс", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=32&start_datestamp=2023-08-23T00:00:00', locationName: 'Бухта Аякс'},
        {cameraId: "8", camera_name: "Кампус", cameraSrc: 'http://10.61.36.15:8000/api/data/?location=8&start_datestamp=2023-08-23T00:00:00', locationName: 'Кампус'},
      ] 
    }
  }
}
</script>

<style>
.statistic-grid{
    /* margin: 0 auto; */
    min-height: 100vh;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 15px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    align-content: space-around;
}
</style>