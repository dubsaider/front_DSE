<template>
  <div class="main-panel"> <!--Главный прямоугольничек-->
    <div class="button-panel"> <!--Прямоугольник с кнопками-->
      <div class="column">
        <div class="butt" @click="zoomCamera('in')"><img src="@/assets/+.png"></div>
        <div class="butt" @click="moveCamera('left')"><img src="@/assets/left.png"></div>
      </div>
      <div class="column">
        <div class="butt" @click="moveCamera('up')"><img src="@/assets/up3.png"></div>
        <div class="butt" @click="resetCamera()"><img src="@/assets/x.png"></div>
        <div class="butt" @click="moveCamera('down')"><img src="@/assets/down.png"></div>
      </div>
      <div class="column">
        <div class="butt" @click="zoomCamera('out')"><img src="@/assets/-.png"></div>
        <div class="butt" @click="moveCamera('right')"><img src="@/assets/right.png"></div>
      </div>
    </div>
    <div class="list">
      <div>1. Пунктик</div>
      <div>2. Пунктик</div>
      <div>3. Пунктик</div>
      <div>4. Пунктик</div>
      <div>5. Пунктик</div>
    </div>
  </div>

</template>

<script>
export default {
  methods: {
    moveCamera(direction) {
      // Здесь будет код для перемещения камеры в указанном направлении
      console.log('Перемещение камеры:', direction);
    },
    resetCamera() {
      // Здесь будет код для возврата камеры в исходное положение
      console.log('Возврат камеры в исходное положение');
    },
    zoomCamera(action) {
      // Здесь будет код для изменения зума камеры
      console.log('Изменение зума:', action);
    }
  }
};
</script>

<style scoped>

.main-panel {
  /*width: 198px;
  height: 367px; */
  margin-top: 7%;
  min-width: 91.666%;
  width: 15%;
  height: 50%;
  background-color: #FAFAFA;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 11px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-content: space-around;
}

.button-panel {
  /*border: 1px solid black; */
  background-color: white;
  width: 125px;
  height: 125px;
  display: flex;
  align-self: center;
  margin: 5%;
}

.column {
  display: flex;
  flex-direction: column;
}

.butt {
  width: 30px;
  height: 30px;
  border: 1px solid black;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 5px;
  background: #262626;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 6px;
  cursor: pointer;

}

img {
  width: 80%;
  height: 80%;
}

.list {
  color: #8B8B8B;
  font-family: 'Jura';
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  line-height: 24px;
  font-variant: small-caps;
  width: 60%;
  height: 50%;
  display: flex;
  flex-direction: column;
  align-self: flex-start;
  margin: 10%;
  cursor: pointer;
}

</style>
