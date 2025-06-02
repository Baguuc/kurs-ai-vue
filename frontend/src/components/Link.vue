<script lang="ts" setup>
type Props = {
  to: string;
};
const props = defineProps<Props>();
</script>
<template>
  <RouterLink :to="props.to" class="w-fit h-fit p-1 bg-transparent text-center text-ctp-text hover:text-ctp-subtext0 duration-100">
    <slot />
  </RouterLink>
</template>
