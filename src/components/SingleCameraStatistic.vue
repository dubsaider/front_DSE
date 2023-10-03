<template>
    <div class="one-count-box" @click="openGraphic">
        <!-- <div class="zone-cards-wrapper"> -->
            <statistic-card 
              v-for="[key, value] in typed_counts"
                v-bind:objects_type="key"
                v-bind:objects_count="value"
            />
        <!-- </div> -->
        <div>{{ this.camera_name }}</div>
    </div>
</template>

<script>
import axios from 'axios';

import StatisticCard from "./StatisticCard.vue";
import SingleCameraGraphic from "./SingleCameraGraphic.vue";

export default {
    name: 'SingleCameraStatistic',
    props: ['camera_id', 'camera_name', 'camera_src', 'location_name'],
    components: {
        StatisticCard, SingleCameraGraphic
    },
    data() {
        return {
            typed_counts: new Map(),
        }
    },
    mounted() {
        this.parseLogs();
    },
    methods: {
        parseLogs() {
            axios.get(this.camera_src, { paramsSerializer: params => qs.stringify(params, { arrayFormat: 'repeat' }) })
                .then((response) => {
                    response.data.map(x => {
                        this.typed_counts.set(x.type, x.count);
                        //const current_counts = (this.typed_counts.has(x.type)) ? this.typed_counts.get(x.type) : 0;
                        //this.typed_counts.set(x.type, Math.max(x.count, current_counts));
                    })
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        openGraphic(){
            //make isVisible equal true
        }

    }
}

</script>

<style>
.one-count-box {
    width: 15%;
    min-height: 30vh;
    border-radius: 5%;
    background-color: #DCDCDC;
    display: flex;
    flex-direction: column;
    align-content: center;
    justify-content: space-around;
    text-align: center;
}
.zone-cards-wrapper{

    /* justify-content: space-around; */
}
</style>