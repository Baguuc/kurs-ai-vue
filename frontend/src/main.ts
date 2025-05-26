import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import CourseLink from './components/CourseLink.vue'

createApp(App)
  .component('CourseLink', CourseLink)
  .mount('#app');
