<template>
  <div class="camera-list-manage">
    <div class="add-buttons">
      <button class="manage-element" @click="openAddCameraModal">Добавить камеру</button>
      <button class="manage-element">Добавить группировку</button>
    </div>
    <div class="camera-grid-options">
      <div>Сетка камер</div>
        <div class="camera-num-choice">
          <div>2</div>
          <div class="separator"></div>
          <div>4</div>
          <div class="separator"></div>
          <div>8</div>
          <div class="separator"></div>
          <div>16</div>
        </div>
    </div>
<!-- Модальное окно для добавления камеры -->
<div v-if="showAddCameraModal" class="modal-overlay">
  <div class="modal">
    <div class="label-input">
      <label for="cameraName">Имя камеры:</label>
      <input v-model="cameraData.name" type="text" id="cameraName" />
    </div>

    <div class="label-input">
      <label for="cameraIp">IP камеры:</label>
      <input v-model="cameraData.ip" type="text" id="cameraIp" />
    </div>

    <div class="label-input">
      <label for="inputLocation">Локация входа:</label>
      <input v-model="cameraData.inputLocation" type="text" id="inputLocation" />
    </div>

    <div class="label-input">
      <label for="outputLocation">Локация выхода:</label>
      <input v-model="cameraData.outputLocation" type="text" id="outputLocation" />
    </div>

    <div class="label-input">
      <label for="cameraDescription">Описание камеры:</label>
      <textarea v-model="cameraData.description" id="cameraDescription"></textarea>
    </div>
    <div class="button-group">
          <button class="save-button" @click="saveCamera">Сохранить</button>
          <button class="save-add-another-button" @click="saveAndAddAnother">Сохранить и добавить другую</button>
          <button class="save-and-continue-button" @click="saveAndContinueEditing">Сохранить и продолжить редактирование</button>
          <button class="cancel-button" @click="closeAddCameraModal">Отмена</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      showAddCameraModal: false,
      cameraData: {
        name: '',
        ip: '',
        inputLocation: '',
        outputLocation: '',
        description: ''
      }
    };
  },
  methods: {
    openAddCameraModal() {
      this.showAddCameraModal = true;
    },
    closeAddCameraModal() {
      this.resetCameraData();
      this.showAddCameraModal = false;
    },
    async saveCamera() {
      try {
        const response = await axios.post('http://10.61.36.15:8000/api/cameras', this.cameraData);
        console.log('Camera saved successfully:', response.data);
        this.closeAddCameraModal();
      } catch (error) {
        console.error('Error saving camera:', error);
      }
    },
    async saveAndAddAnother() {
      try {
        const response = await axios.post('http://10.61.36.15:8000/api/cameras', this.cameraData);
        console.log('Camera saved successfully:', response.data);
        this.resetCameraData();
      } catch (error) {
        console.error('Error saving camera:', error);
      }
    },
    async saveAndContinueEditing() {
      try {
        const response = await axios.post('http://10.61.36.15:8000/api/cameras', this.cameraData);
        console.log('Camera saved successfully:', response.data);
        // оставляем модальное окно открытым
      } catch (error) {
        console.error('Error saving camera:', error);
      }
    },
    resetCameraDataAndClose() {
      this.cameraData = {
        name: '',
        ip: '',
        inputLocation: '',
        outputLocation: '',
        description: ''
      };
      this.showAddCameraModal = false;
    },
    resetCameraData() {
      this.cameraData = {
        name: '',
        ip: '',
        inputLocation: '',
        outputLocation: '',
        description: ''
      };
    }
  }
};
</script>

<style scoped>

.camera-list-manage {
  width: 100%;
  height: 6.417%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 15px;
  background-color: #DCDCDC;
}

.add-buttons {
  width: 43.127%;
  height: 60%;
  padding: 1%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.manage-element {
  font-family: 'Jura', sans-serif;
  min-width: 40%;
  padding: 1% 3% 1% 3%;
  align-items: center;
  border: 0.5px solid #4A4A4A;
  border-radius: 10px;
  background-color: transparent;
}

.camera-grid-options {
  padding: 0.5% 1.5% 0.5% 1.5%;
  margin-right: 1%;
  width: 35.9%;
  height: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border: 0.5px solid #4A4A4A;
  border-radius: 10px;
}

.camera-num-choice {
  margin: 0% 6%;
  display: flex;
  align-content: space-between;
  align-items: center;
}

.separator {
  height: 1px;
  width: 1px;
  margin: 0% 10%;
  border: 1px solid #8B8B8B;
  border-radius: 100%;
}

.manage-element:hover {
  background: rgb(232, 95, 76);
}

.manage-element:active {
  background: rgb(152, 15, 0);
}

.camera-list-manage {
  position: relative;
}

/* Стили для модального окна */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999 !important;
}

.modal {
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}

/* Стили для каждого элемента в модальном окне */
.label-input {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  height: 100%;
}

label {
  text-align: right;
  margin-right: 10px;
}

input,
textarea {
  flex: 1;
  padding: 5px;
  box-sizing: border-box;
}

/* Стили для кнопок */
.button-group {
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}

button.save-button,
button.save-add-another-button,
button.save-and-continue-button,
button.cancel-button {
  padding: 10px;
  width: 140px;
  margin: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 14px;
  font-weight: bold;
  transition: background-color 0.3s ease;
}

button.save-button {
  background-color: #4CAF50;
  color: white;
}

button.save-add-another-button {
  background-color: #4CAF50;
  color: white;
}

button.save-and-continue-button {
  background-color: #4CAF50;
  color: white;
}

button.cancel-button {
  background-color: #f44336;
  color: white;
}

button:hover {
  background-color: #555;
}

</style>
