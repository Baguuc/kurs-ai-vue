<template>
  <div class="w-screen h-screen p-4">
    <header class="w-full h-full bg-ctp-base flex flex-col items-center justify-center gap-4">
      <h1 class="text-xl text-ctp-text font-bold">Zobacz fajne kursy już teraz</h1>
      <Button @click="$router.push('/courses')">Sprawdź</Button>
    </header>
  </div>
</template>
