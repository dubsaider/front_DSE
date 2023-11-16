<template>
    <div class="one-count-box" v-on:click="showGraphic()">
        <div class="zone">{{ this.camera_name }}</div>
        <!-- <div class="zone-cards-wrapper"> -->
            <statistic-card 
              v-for="[key, value] in typedCounts"
                v-bind:objectsType="key"
                v-bind:objectsCount="value"
            />
        <!-- </div> -->
        <!-- <div class="zone">{{ this.camera_name }}</div> -->
    </div>
</template>

<script>
import axios from "axios";

import StatisticCard from "./StatisticCard.vue";
import SingleCameraGraphic from "./SingleCameraGraphic.vue";
import ModalWindow from "./Utils/ModalWindow.vue";

export default {
    name: "SingleCameraStatistic",
    props: ["camera_id", "camera_name", "camera_src", "location_name"],
    emits: ["show"],
    components: {
        StatisticCard, SingleCameraGraphic
    },
    data() {
        return {
            typedCounts: new Map(),
        }
    },
    mounted() {
        this.parseLogs();
    },
    methods: {
        async parseLogs() {
            let response = await axios.get(this.camera_src, { paramsSerializer: params => qs.stringify(params, { arrayFormat: 'repeat' }) })

            //console.log(response.data)
            response.data.map(x => {
                this.typedCounts.set(x.type, x.count);
                //const current_counts = (this.typed_counts.has(x.type)) ? this.typed_counts.get(x.type) : 0;
                //this.typed_counts.set(x.type, Math.max(x.count, current_counts));
            })
        },
        showGraphic(){
            this.$emit("show", this.camera_id);
        }

    }
}

</script>

<style>
.one-count-box {
    margin-bottom: 1%;
    width: 15%;
    height: 30vh;
    min-width: 250px;
    min-height: 250px;
    border: 2px solid black;
    border-radius: 5%;
    /* background-color: #DCDCDC; */
    display: flex;
    flex-direction: column;
    align-content: center;
    justify-content: space-around;
    text-align: center;
}
.zone-cards-wrapper{
    /* justify-content: space-around; */
}
.zone{
    font-size: 200%;
}
</style>