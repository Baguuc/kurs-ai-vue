<script lang="ts" setup>
type Props = {
  title: string;
};
const props = defineProps<Props>();
</script>

<script lang="ts">
import { ref } from 'vue'
const opened = ref(false)

function open() {
  opened.value = true;
}

function close() {
  opened.value = false;
}
</script>

<template>
  <div v-if="opened" class="min-w-[200px] w-[200px] h-screen bg-neutral-700 flex flex-col items-center justify-between py-4 px-2">
    <button class="fixed top-0 left-0 text-white text-2xl" @click="close">✕</button>
    <h3 class="text-white text-xl font-bold">{{ props.title }}</h3>
    <div class="flex flex-col gap-4">
      <slot />
    </div>
    <div />
  </div>
  <button v-else class="fixed top-[-4px] left-0 text-4xl" @click="open">≡</button>
</template>
