<template>
  <div class="camera-pop-up-menu">
    <ul>
      <li>Удалить камеру</li>
      <li>Добавить в группировку</li>
      <li>Настройки</li>
    </ul>
  </div>
</template>

<script>
export default {}
</script>

<style scoped>


@import url(
'https://fonts.googleapis.com/css2?family=Jura:wght@500&display=swap'
);

.camera-pop-up-menu {
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 10px;
}

ul {
  display: flex;
  flex-direction: column;
}

li {
  font-style: normal;
  font-weight: 500;
  font-size: 14px;
  line-height: 17px;
}

</style>