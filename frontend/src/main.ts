import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import CourseLink from './components/CourseLink.vue'
import Link from './components/Link.vue'
import Sidebar from './components/Sidebar.vue'
import SidebarRoot from './components/SidebarRoot.vue'
import SidebarPage from './components/SidebarPage.vue'

const app = createApp(App)
app.component('CourseLink', CourseLink)
app.component('Link', Link)
app.component('Sidebar', Sidebar)
app.component('SidebarRoot', SidebarRoot)
app.component('SidebarPage', SidebarPage)
app.use(router)
app.mount('#app')
