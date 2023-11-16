import {createApp} from "vue";
import {createPinia} from 'pinia';
import App from './App.vue';
import YmapPlugin from 'vue-yandex-maps'

// Vue.use(YmapPlugin)
createApp(App)
    .use(createPinia())
    .use(YmapPlugin)
    .mount('#app')
