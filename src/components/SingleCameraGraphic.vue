<template>
    <canvas></canvas>
</template>

<script>
import Chart from "chart.js/auto";
import axios from "axios";
import moment from "moment";
import "chartjs-adapter-moment";

export default {
    name: "SingleCameraGraphic",
    props: ["cameraId", "cameraSrc", "locationName"],
    data() {
        return {
            timestamps: [],
            counts: [],
            isVisible: false
        }
    },
    mounted() {
        this.parseLogsAndDraw();
    },
    methods: {
        draw(timestamps, counts) {
            new Chart(document.getElementById(this.cameraId), {
                type: "line",
                data: {
                    labels: timestamps,
                    datasets: [
                        {
                            data: counts,
                            label: "Количество обнаруженных объектов, локация: " + this.locationName,
                            borderColor: "#3cba9f",
                            fill: true
                        }]
                },
                
                options: {
                    relative: true,
                    scales: {
                        x: {
                            type: "time",
                            distribution: "linear"
                        }, 
                        y: {
                            ticks: { precision: 0 }
                        }
                    }
                }
            });
        },
        parseLogsAndDraw() {
            axios.get(this.cameraSrc, { paramsSerializer: params => qs.stringify(params, { arrayFormat: "repeat" }) })
                .then((response) => {
                    this.timestamps = response.data.map(x => moment(x.datestamp).utc().format("lll"));
                    this.counts = response.data.map(x => x.count)

                    this.draw(this.timestamps, this.counts);
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
    }
}

</script>

<style></style>