<script lang="ts">
import { ref, onMounted, computed } from 'vue';
import { computedAsync } from '@vueuse/core';
import { fetchCourse } from '../models/course.ts';
import type { Course } from '../models/course.ts';
import { useRoute } from 'vue-router';
import { marked } from 'marked';

export default {
  setup() {
    const route = useRoute();
    const episodeIdx = ref(0);
    
    const course = computedAsync(async () => {
      if(!route) return;

      const courseId = route.params.courseId;
      
      return await fetchCourse(courseId);
    });

    const module = computedAsync(async () => {
      if(!course.value) return;

      const moduleIdx = route.params.moduleIdx;
      
      return course.value.modules[moduleIdx];
    });

    const episode = computedAsync(async () => {
      if(!module.value) return;

      return module.value.episodes[episodeIdx.value];
    });

    const content = computedAsync(() => {
      if(!episode.value) return "";

      return marked(episode.value.content);
    });

    function setEpisode(v) {
      episodeIdx.value = v;
    }
    
    return { course, module, episode, content, setEpisode }
  }
}
</script>
<template>
  <SidebarRoot>
    <Sidebar title="Moduły">
      <button v-for="(episode, index) in module.episodes" class="w-fit h-fit p-1 bg-transparent text-white hover:text-neutral-400 duration-100 text-sm" @click="setEpisode(index)">
        {{ episode.no }}. {{ episode.title }}
      </button>
    </Sidebar>
    <SidebarPage>
      <div>
        <div class="h-full flex flex-col gap-2 items-center" v-html="content" />
      </div>
    </SidebarPage>
  </SidebarRoot>
</template>
