<script lang="ts" setup>
type Props = {
  to: string;
};
const props = defineProps<Props>();
</script>
<template>
  <RouterLink :to="props.to" class="w-fit h-fit p-1 bg-transparent text-black hover:text-neutral-600 duration-100">
    <slot />
  </RouterLink>
</template>
