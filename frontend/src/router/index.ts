import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../pages/Index.vue'
import CourseView from '../pages/Courses.vue'
import ModulesView from '../pages/Modules.vue'
import EpisodesView from '../pages/Episodes.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/courses',
      name: 'courses',
      component: CourseView,
    },
    {
      path: '/courses/:id',
      name: 'modules',
      component: ModulesView 
    },
    {
      path: '/courses/:courseId/:moduleIdx',
      name: 'episodes',
      component: EpisodesView
    }
  ],
})

export default router
