<script lang="ts">
import { ref, onMounted } from 'vue';
import { computedAsync } from '@vueuse/core';
import { fetchCourse } from '../models/course.ts';
import type { Course } from '../models/course.ts';
import { useRoute } from 'vue-router';

export default {
  setup() {
    const route = useRoute();
    const moduleIdx = ref(0);
    
    const courseId = computedAsync(async () => {
      if(route) return route.params.courseId;
    });

    const course = computedAsync(async () => {
      if(!courseId.value) return;
      
      return await fetchCourse(courseId.value);
    });

    const module = computedAsync(async () => {
      if(!course.value) return;
            
      return course.value.modules[moduleIdx.value];
    });


    function setModule(v) {
      moduleIdx.value = v;
    }
    
    return { course, module, setModule, route, courseId, moduleIdx }
  }
}
</script>
<template>
  <SidebarRoot>
    <Sidebar title="Moduły">
      <Link :to="`/courses`">Wróć</Link>
      <button v-for="(module, index) in course.modules" class="w-fit h-fit p-1 bg-transparent text-white hover:text-neutral-400 duration-100 text-sm" @click="setModule(index)">
        {{ module.no }}. {{ module.title }}
      </button>
    </Sidebar>
    <div class="w-screen h-screen flex flex-col items-center justify-center">
      <div class="bg-ctp-base w-fit max-w-96 h-fit flex flex-col items-center p-8 gap-4 rounded-sm">
        <h1 class="text-ctp-text text-center text-xl"><u>Moduł {{ module?.no }}</u>: {{ module?.title }}</h1>
        <hr class="border-ctp-text w-full" />
        <div class="h-full flex flex-col items-center">
          <Link v-for="(episode, index) in module?.episodes" :to="`/courses/${courseId}/${moduleIdx}`">{{ episode.no }}. {{ episode.title }}</Link>
        </div>
      </div>
    </div>
  </SidebarRoot>
</template>
