<script lang="ts">
import { ref, onMounted, computed } from 'vue';
import { fetchCourse } from '../models/course.ts';
import type { Course } from '../models/course.ts';
import { useRoute } from 'vue-router';

export default {
  setup() {
    const route = useRoute();
    const id = computed(() => route ? route.params.id : -1);

    const course = ref(null);
    const moduleIdx = ref(0);
    const module = computed(() => {
      if(course.value) {
        return course.value.modules[moduleIdx.value];
      } else {
        return { title: '', no: -1, episodes: [] }
      }
    });

    async function refreshData() {
      try {
        const newValue = await fetchCourse(id.value);
        newValue.modules.sort((a, b) => a.no > b.no);
        course.value = newValue;
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    }

    onMounted(refreshData);

    function setModule(idx) {
      moduleIdx.value = idx;
    }
    
    return { course, module, setModule, route, id, moduleIdx }
  }
}
</script>
<template>
  <SidebarRoot>
    <Sidebar title="Moduły">
      <button v-for="(module, index) in course.modules" class="w-fit h-fit p-1 bg-transparent text-white hover:text-neutral-400 duration-100 text-sm" @click="setModule(index)">
        {{ module.no }}. {{ module.title }}
      </button>
    </Sidebar>
    <SidebarPage>
    <div class="h-full flex flex-col">
      <Link v-for="(episode, index) in module.episodes" :to="`/courses/${id}/${moduleIdx}`">{{ episode.no }}. {{ episode.title }}</Link>
    </div>
    </SidebarPage>
  </SidebarRoot>
</template>
