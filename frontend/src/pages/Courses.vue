<script lang="ts">
import { ref, onMounted } from 'vue';
import { listCourses } from '../models/course.ts';
import type { Course } from '../models/course.ts';
import CourseLink from '../components/CourseLink.vue';
    
export default {
  setup() {
    const courses = ref<Course[]>(listCourses());
    
    listCourses().then(res => {
      courses.value = res;
    });

    return { courses };
  }
}
</script>

<template>
  <div class="flex flex-row flex-wrap items-center justify-center">
    <CourseLink :courseid="course.id" :name="course.name" v-for="course in courses" />
  </div>
</template>
