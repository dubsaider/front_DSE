<template>
  <div class="camera-list">
    <camera-search></camera-search>
    <div class="list-content">Список обработок</div>
    <ul>
      <li v-for="processing in processings" :key="processing.id">
        <button @click="loadSettings(processing.id)">
          {{ processing.name }}
        </button>
      </li>
    </ul>

    <div v-if="selectedProcessing">
      <h2>{{ selectedProcessing.name }} Настройки</h2>
      <ul>
        <li v-for="(setting, index) in settings" :key="index">
          {{ setting }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import CameraSearch from "@/components/CameraSearch.vue";


export default {
  components: {
    CameraSearch,
  },
  data() {
      return {
        processings: [],
        selectedProcessing: null,
        settings: []
      };
  },
  mounted() {
    this.fetchProcessings();
  },
  methods: {
    async fetchProcessings() {
      try {
        const response = await this.$axios.get('http://10.61.36.15:8000/api/processing/');
        this.processings = response.data;
      } catch (error) {
        console.error('Ошибка при получении данных:', error);
      }
    },
    async loadSettings(processingId) {
      try {
        const response = await this.$axios.get(``);
        this.settings = response.data;
        this.selectedProcessing = this.processings.find(p => p.id === processingId);
      } catch (error) {
        console.error('Ошибка при загрузке настроек:', error);
      }
    }
  }
};
</script>

<style>

.camera-list {
  width: 91.666%;
  height: 53.092%;
  padding: 2% 0% 0% 0%;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  background-color: #FAFAFA;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 11px;
}

.list-content {
  height: 89.98%;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;

}


.processing{
  font-family: 'Jura', sans-serif;
  min-width: 88.98%;
  padding: 1% 3% 1% 3%;
  align-items: center;
  border: 0.5px solid #4A4A4A;
  border-radius: 10px;
  background-color: transparent;
  margin:3%;
}


</style>