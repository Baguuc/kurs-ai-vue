<script setup lang="ts">
import { toRefs } from 'vue';

type Props = {
  courseid: number;
  name: string;
};
const props = defineProps<Props>();

const { courseid } = toRefs(props);
const url = `/courses/${courseid.value}`;
</script>

<template>
  <RouterLink :to="url" class="w-fit flex flex-col items-center justify-center p-4 gap-4 bg-ctp-base text-ctp-text aspect-square rounded-md">
    <h1 class="font-bold text-lg">{{ name }}</h1>
  </RouterLink>
</template>
