import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import CourseLink from './components/CourseLink.vue'

const app = createApp(App)
app.component('CourseLink', CourseLink)
app.use(router)
app.mount('#app')
