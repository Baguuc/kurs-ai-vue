import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import CourseLink from './components/CourseLink.vue'
import Link from './components/Link.vue'

const app = createApp(App)
app.component('CourseLink', CourseLink)
app.component('Link', Link)
app.use(router)
app.mount('#app')
