<template>
  <div class="camera-list-manage">
    <div class="add-buttons">
      <button class="manage-element">Добавить камеру</button>
      <button class="manage-element">Добавить группировку</button>
    </div>
    <div class="camera-grid-options">
      <div>Сетка камер</div>
      <div class="camera-num-choice">
        <div>2</div>
        <div>@</div>
        <div>4</div>
        <div>@</div>
        <div>8</div>
        <div>@</div>
        <div>16</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {}
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

.add-buttons{
  min-width: 43.127%;
  min-height: 60%;
  /*font-size: 80%;*/
  padding: 1%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.manage-element{
  font-family: 'Jura', sans-serif;
  padding: 1% 3% 1% 3%;
  
  /*padding: %;*/
  align-items: center;
  border: 0.5px solid #4A4A4A;
  border-radius: 10px;
  background-color: transparent;
}

.camera-grid-options {
  padding: 0.5% 1% 0.5% 1%;
  margin: 0% 1% 0% 0%;
  width: 35.9%;
  height: 60%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border: 0.5px solid #4A4A4A;
  border-radius: 10px;
}

.camera-grid-options-inner_wrapper{
  padding: 0% 0% 0% 0%;
}

.camera-num-choice {
  width: 29.426%;
  height: 100%;
  display: flex;
  align-content: space-between;
  align-items: center;
}
</style>