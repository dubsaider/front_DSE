<template>
    <div class="card-wrapper">
        <div class="count">{{ this.objects_count }} </div>
        <div class="type">{{ this.objects_type }} </div>
    </div>
</template>

<script>

export default {
    name: 'StatisticCard',
    props: ['objects_type', 'objects_count']
}
</script>

<style scoped>
.card-wrapper {
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-self: center;
    min-height: 25%;
    width: 80%;
    background-color: rgb(251, 251, 251);
    border-radius: 10%;
}

.count {
    font-size: 175%;
}

.type {
    font-size: 125%;
}
</style>