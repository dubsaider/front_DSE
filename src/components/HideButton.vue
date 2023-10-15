<template>
  <div class="hide-button-wrapper">
    <div class="hide-button">

      <div>скрыть</div>
      <div class="hide-icon">
        <svg width="100%" height="100%" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M15 13L9 7L15 1M7 13L1 7L7 1" stroke="white" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round"/>
        </svg>
      </div>
    </div>
  </div>
</template>

<script>
export default {}
</script>

<style scoped>

.hide-button-wrapper {
  display: flex;
  width: 100%;
  padding: 2% 0% 2% 2%;
  justify-content: flex-end;
}

.hide-button {
  width: 50%;
  /* font-size: 75%; */
  justify-self: flex-end;
  align-content: center;
  display: flex;
  justify-content: space-evenly;
  color: #FFFFFF;
}

.hide-icon {
  /*width: 7.1%;
  height: 2.4%;*/
  width: 15%;
  height: 100%;
}

</style>