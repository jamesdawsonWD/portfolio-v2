<template>
  <div
    id="app"
    :class="ui.getDarkMode ? 'darkMode' : ''"
    :style="{ overflow: ui.getIsModalAwake ? 'hidden' : 'initial' }"
  >
    <Header :class="ui.getIsModalAwake ? 'blur' : ''" />
    <div class="router-wrapper">
      <transition name="fade" mode="out-in">
        <router-view class="router" :class="ui.getIsModalAwake ? 'blur' : ''" />
      </transition>
    </div>
    <transition name="fade" mode="out-in">
      <Modal v-if="ui.getIsModalAwake" @close="ui.closeModal()" />
    </transition>

    <VerticleBox v-if="ui.getTransition" />
    <Boxes class="box-canvas" />
  </div>
</template>

<script lang="ts" setup>
import Modal from "@/components/modals/Modal.vue";
import Header from "@/components/Header.vue";
import Boxes from "@/components/canvas/Boxes.vue";
import VerticleBox from "@/components/transitions/VerticleBox.vue";
import { useUi } from "@/store/ui";
const ui = useUi();

import { onBeforeRouteUpdate } from "vue-router";
onBeforeRouteUpdate(async (to, from) => {
  console.log(to, from);
});
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  height: 100%;
  position: relative;

  .box-canvas {
    position: fixed;
    z-index: -1000;
    top: 0;
  }
  /* Increase/decrease this value for cross-browser compatibility */
  /* So the width will be 100% + 17px */
}

.darkMode {
  background: var(--first-shade);
}
.router-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
}
.blur {
  filter: blur(8px);
  -webkit-filter: blur(8px);
}
</style>
