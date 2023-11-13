<template>
  <div class="camera-list-manage">
    <div class="add-buttons">
      <button @click="something" class="manage-element">Добавить обработку</button>
    </div>

  </div>
</template>

<script>
export default {
  methods(){
    
  }
}
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
  width: 43.127%;
  height: 60%;
  /*font-size: 80%;*/
  padding: 1%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.manage-element{
  font-family: 'Jura', sans-serif;
  min-width: 40%;
  padding: 1% 3% 1% 3%;
  align-items: center;
  border: 0.5px solid #4A4A4A;
  border-radius: 10px;
  background-color: transparent;
}
.manage-element:hover {background: rgb(232,95,76);}
.manage-element:active {background: rgb(152,15,0);}

</style>