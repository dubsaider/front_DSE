<template>
  <div class="form"> <!--container mt-5-->
    <div class="enumeration">  <!--row justify-content-center-->
        <div class="element" v-for="item in dropdowns" :key="item.name" >  <!---->
            <label class="form-label">{{ item.label }}</label>  <!---->
            <select v-model="item.model" class="form-select" :multiple="item.multiple">  <!---->
              <option v-for="option in item.options" :value="option.name" :key="option.id">{{ option.name }}</option>   <!---->
            </select>
        </div>
        <button @click="sendData" class="btn">Добавить</button>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';

export default {
  name: 'DataProcessingComponent',
  setup() {
    const dropdowns = ref([
      { name: 'processingModels', label: 'Модель обработки', model: null, options: [], endpoint: '' },
      { name: 'trackedObjects', label: 'Отслеживаемые объекты', model: [], options: [], endpoint: '' },
      { name: 'actions', label: 'Действия', model: [], options: [], endpoint: '' },
      { name: 'intersectionLines', label: 'Линии пересечения', model: [], options: [], endpoint: '' },
      { name: 'startRecording', label: 'Запуск записи', model: [], options: [], endpoint: '' },
      { name: 'counting', label: 'Подсчёт', model: null, options: [], endpoint: '' },
      { name: 'computingMachines', label: 'Компьютер для вычисления', model: null, options: [], endpoint: '/units/' }
    ]);

    const fetchData = async () => {
      try {
        for (const item of dropdowns.value) {
          const response = await axios.get(`http://10.61.36.15:8000/api/units/`);
          console.log(response)
          item.options = response.data;
        }
      } catch (error) {
        console.error('Error:', error);
      }
    };

    const sendData = async () => {
      try {
        for (const item of dropdowns.value) {
          if (item.model !== null) {
            const selectedData = item.model.map(value => ({ id: value, name: item.name }));
            const response = await axios.post(`http://10.61.36.15:8000/api${item.endpoint}`, selectedData);

            if (response.status === 200) {
              alert(`Данные списка ${item.label} успешно отправлены!`);
            } else {
              alert(`Произошла ошибка при отправке данных списка ${item.label}.`);
            }
          }
        }
      } catch (error) {
        console.error('Error:', error);
      }
    };

    onMounted(() => {
      fetchData();
    });

    return {
      dropdowns,
      sendData
    };
  }
};
</script>

<style scoped>

.form {
  min-height: 91.444%;
  padding: 1% 0% 1% 0%;
  margin: 1% 0% 1% 0%;
  display: flex;
  justify-content: flex-start;;
  flex-wrap: wrap;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 15px;
  background-color: #DCDCDC;
}

.enumeration {
  display: flex;
  flex-direction: row;
  margin-inline: 1%;
  /* border: 0.5px solid blue; */
  flex-wrap: wrap;
  width: 40%;
  justify-content: center;
}
.element {
  display: flex;
  flex-direction: row;
  margin-bottom: 4%;
  width: 100%;
  /* border: 0.5px solid green; */
  justify-content: space-between;

}


.form-label {
  display: flex;
  /* border: 0.5px solid red; */
  width: 100%;
}

.form-select {
  display: flex;
  flex-direction: column;
  /* border: 0.5px solid yellow; */
  /* margin-left: 500%; */

}



.btn {
  font-family: 'Jura', sans-serif;
  min-width: 40%;
  padding: 1% 3% 1% 3%;
  align-items: center;
  border: 2px solid #4A4A4A;
  border-radius: 10px;
  background-color: transparent;
  position:relative;
  /* right: -90%; */
}
.btn:hover {background: rgb(232,95,76);}
.btn:active {background: rgb(152,15,0);}

</style>