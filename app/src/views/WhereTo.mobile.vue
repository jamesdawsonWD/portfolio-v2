<template>
  <div class="where-to">
    <Button @clicked="navigateTo('/my-projects')" title="My Projects" />
    <Button @clicked="navigateTo('/client-projects')" title="Client Projects" />
    <Button @clicked="navigateTo('/hackathons')" title="Hackathons" />
    <Button @clicked="navigateTo('/my-projects')" title="Contact" />
  </div>
</template>

<script setup lang="ts">
import Button from "@/components/generics/Button.vue";
import router from "../router";

function navigateTo(path: any) {
  router.push({ path });
}
</script>
