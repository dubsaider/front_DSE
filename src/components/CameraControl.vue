<template>
  <div class="main-panel"> <!--Главный прямоугольничек-->
    <div class="button-panel"> <!--Прямоугольник с кнопками-->
      <div class="butt div1" @click="zoomCamera('in')"><img src="@/assets/+.png"></div>
      <div class="butt div4" @click="moveCamera('left')"><img src="@/assets/left.png"></div>
      <div class="butt div2" @click="moveCamera('up')"><img src="@/assets/up3.png"></div>
      <div class="butt div5" @click="resetCamera()"><img src="@/assets/x.png"></div>
      <div class="butt div7" @click="moveCamera('down')"><img src="@/assets/down.png"></div>
      <div class="butt div3" @click="zoomCamera('out')"><img src="@/assets/-.png"></div>
      <div class="butt div6" @click="moveCamera('right')"><img src="@/assets/right.png"></div>
    </div>
    <div class="list">
      <div>Сценарий 1</div>
      <div>Сценарий 2</div>
      <div>Сценарий 3</div>
      <div>Сценарий 4</div>
      <div>Сценарий 5</div>
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
  align-items: center;
}

.button-panel {
  /*border: 1px solid black; */
  width: 60%;
  height: 8vmax;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 1fr);
  grid-column-gap: 0.7vmax;
  grid-row-gap: 0.7vmax;
  margin-top: 10%;
}

.div1 { grid-area: 1 / 1 / 2 / 2; }
.div2 { grid-area: 1 / 2 / 2 / 3; }
.div3 { grid-area: 1 / 3 / 2 / 4; }
.div4 { grid-area: 2 / 1 / 3 / 2; }
.div5 { grid-area: 2 / 2 / 3 / 3; }
.div6 { grid-area: 2 / 3 / 3 / 4; }
.div7 { grid-area: 3 / 2 / 4 / 3; }

.butt {
  width: 100%;
  height: 100%;
  border: 1px solid black;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #262626;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 6px;
  cursor: pointer;

}

img {
  width: 70%;
  height: 70%;
}

.list {
  color: #8B8B8B;
  font-family: 'Jura';
  font-style: normal;
  font-weight: 500;
  font-size: 1.5vw;
  line-height: 4vh;

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
