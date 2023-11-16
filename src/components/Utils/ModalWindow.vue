<template>
    <div class="modal-window" id="who">
        <div class="content-wrapper">
            <div class="navbar">
                <div class="close-button" @click="closeWindow()">ЗАКРЫТЬ</div>
            </div>
            <div class="content">
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    emits: [
        "close"
    ],
    methods: {
        closeWindow(){
            this.$emit("close");
        }
    }
}
</script>

<style>
.modal-window{
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    background: rgba(0, 0, 0, 0.5);
    position: fixed;
    width: 100vw;
    height: 100vh;
}

.content-wrapper{
    width: 80%;
    height: 80%;
    
    margin: auto;
    margin-top: 5%;
    background-color: white;
}

.content{
    padding: 1% 3%;
    box-sizing: border-box;
}

.navbar{
    background-color: rgba(3, 83, 67, 0.85);
    height: 7%;
    display: flex;
    justify-content: end;
    align-items: center;
}

.close-button{
    width: 15%;
    color: rgba(255, 255, 255, 0.5);
    text-align: center;
    font-size: 200%;
    /* background-color: rgba(0, 0, 0, 0.5); */
    /* border: 55% solid black; */
}
</style>