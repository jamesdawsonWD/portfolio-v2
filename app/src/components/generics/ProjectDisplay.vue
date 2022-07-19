<template>
  <div class="my-projects">
    <WaterDrops class="canvas" />
    <section class="section section-1">
      <h1>{{ title }}</h1>
    </section>
    <section
      v-for="(item, index) in projects"
      :key="index"
      class="section"
      :class="'section-' + (index + 1)"
    >
      <TiltTitleImage @click.enter="openModal(item)" :title="item.title">
        <img :src="item.image" class="project" />
      </TiltTitleImage>
    </section>
    <section class="section section-end"><EndOfPageContact /></section>
    <FooterNavigator
      :leftTitle="leftNavigation.name"
      :rightTitle="rightNavigation.name"
      :leftLink="leftNavigation.url"
      :rightLink="rightNavigation.url"
    />
  </div>
</template>

<script setup lang="ts">
import router from "../router";
import TiltTitleImage from "@/components/generics/TiltTitleImage.vue";
import ImageController from "@/components/generics/ImageController.vue";
import FooterNavigator from "@/components/generics/FooterNavigator.vue";
import EndOfPageContact from "@/components/generics/EndOfPageContact.vue";
import WaterDrops from "@/components/canvas/WaterDrops.vue";
import { Project, ModalTypes } from "@/types";
import { onMounted, ref } from "vue";
import { useRoute } from "vue-router";
import { useUi } from "@/store/ui";

defineProps<{
  title: string;
  projects: Project[];
  leftNavigation: { name: string; url: string };
  rightNavigation: { name: string; url: string };
}>();
const ui = useUi();
const route = useRoute();

window.scrollTo(0, 0);

function openModal(project: Project) {
  ui.openModal(project.modal, project);
}

onMounted(() => {
  if (!ui.getDarkMode) ui.darkModeOn();
});
</script>
<style lang="scss">
@import "@/styles";

.my-projects {
  width: 100vw;
  display: flex;
  background: var(--first-shade);
  flex-direction: column;
  align-items: center;

  .project {
    transition: 0.6s;
    -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
    filter: grayscale(100%);

    &:hover {
      -webkit-filter: grayscale(0); /* Safari 6.0 - 9.0 */
      filter: grayscale(0);
    }
  }
  .canvas {
    position: absolute;
    z-index: 100;
  }

  .section {
    height: 100vh;
    width: 100vw;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .section-1 {
    position: relative;
    z-index: 101;
  }

  .section-2 {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;

    h2 {
      color: var(--background-color);
    }
  }
  h1 {
    text-align: center;
    color: var(--background-color);
    @include RM_Regular;

    @include breakpoint(mobileonly) {
      font-size: 45pt;
    }
    @include breakpoint(tablet) {
      font-size: 70pt;
    }
    @include breakpoint(phablet) {
      font-size: 70pt;
    }

    @include breakpoint(laptop) {
      font-size: 100pt;
    }
    @include breakpoint(desktop) {
      font-size: 100pt;
    }
  }

  .buttons {
    position: fixed;
    bottom: 0;
    width: 100vw;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: center;

    & > :not(:last-child) {
      margin-right: 20px;
    }
  }
}
</style>
