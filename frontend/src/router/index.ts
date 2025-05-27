import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../pages/Index.vue'
import CourseView from '../pages/Courses.vue'

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
      component: CourseView
    },
  ],
})

export default router
