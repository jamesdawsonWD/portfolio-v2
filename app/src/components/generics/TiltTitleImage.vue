<template>
  <div class="tilt-wrapper">
    <Tilt class="tilt-image" :options="tiltOptions">
      <h2>{{ title }}</h2>
      <slot ref="imageContainer" class="project"></slot>
    </Tilt>
    <div class="mobile-image-wrapper">
      <h2>{{ title }}</h2>

      <slot ref="mobileImageContainer" class="project mobile-image"></slot>
    </div>
  </div>
</template>

<script setup lang="ts">
import Tilt from "@/components/generics/Tilt.vue";
import { onMounted, ref } from "vue";
const mobileImageContainer = ref<HTMLElement | null>(null);

defineProps<{ text: string; title?: string }>();
const tiltOptions = {
  reverse: true, // reverse the tilt direction
  max: 7, // max tilt rotation (degrees)
  startX: 0, // the starting tilt on the X axis, in degrees.
  startY: 0, // the starting tilt on the Y axis, in degrees.
  perspective: 1000, // Transform perspective, the lower the more extreme the tilt gets.
  scale: 1, // 2 = 200%, 1.5 = 150%, etc..
  speed: 300, // Speed of the enter/exit transition
  transition: true, // Set a transition on enter/exit.
  axis: null, // What axis should be disabled. Can be X or Y.
  reset: true, // If the tilt effect has to be reset on exit.
  easing: "cubic-bezier(.03,.98,.52,.99)", // Easing on enter/exit.
  glare: false, // if it should have a "glare" effect
  "max-glare": 0.1, // the maximum "glare" opacity (1 = 100%, 0.5 = 50%)
  "glare-prerender": false, // false = VanillaTilt creates the glare elements for you, otherwise
  // you need to add .js-tilt-glare>.js-tilt-glare-inner by yourself
  "mouse-event-element": null, // css-selector or link to HTML-element what will be listen mouse events
  // you need to add .js-tilt-glare>.js-tilt-glare-inner by yourself
  gyroscope: true, // Boolean to enable/disable device orientation detection,
  gyroscopeMinAngleX: -45, // This is the bottom limit of the device angle on X axis, meaning that a device rotated at this angle would tilt the element as if the mouse was on the left border of the element;
  gyroscopeMaxAngleX: 45, // This is the top limit of the device angle on X axis, meaning that a device rotated at this angle would tilt the element as if the mouse was on the right border of the element;
  gyroscopeMinAngleY: -45, // This is the bottom limit of the device angle on Y axis, meaning that a device rotated at this angle would tilt the element as if the mouse was on the top border of the element;
  gyroscopeMaxAngleY: 45, // This is the top limit of the device angle on Y axis, meaning that a device rotated at this angle would tilt the element as if the mouse was on the bottom border of the element;
};

onMounted(() => {
  console.log(mobileImageContainer);
  // const _mobileImageContainer = mobileImageContainer.value as HTMLElement;
  // _mobileImageContainer.classList.add("mobile-image");
});
</script>

<style scoped lang="scss">
@import "@/styles";

.tilt-wrapper {
  @include breakpoint(mobileonly) {
    transform: scale(0.25);
  }
  @include breakpoint(tablet) {
    transform: scale(0.3);
  }
  @include breakpoint(phablet) {
    transform: scale(0.3);
  }

  @include breakpoint(laptop) {
    transform: scale(0.4);
  }
  @include breakpoint(desktop) {
    transform: scale(0.6);
  }
  .tilt-image {
    @include breakpoint(mobileonly) {
      display: none;
    }
    @include breakpoint(tablet) {
      display: none;
    }
    @include breakpoint(phablet) {
      display: none;
    }

    @include breakpoint(laptop) {
      display: block;
    }
    @include breakpoint(desktop) {
      display: block;
    }
  }

  .mobile-image-wrapper {
    @include breakpoint(mobileonly) {
      display: block;
      h2 {
        font-size: 50pt;
      }
    }
    @include breakpoint(tablet) {
      display: block;
      h2 {
        font-size: 50pt;
      }
    }
    @include breakpoint(phablet) {
      display: block;
      h2 {
        font-size: 50pt;
      }
    }

    @include breakpoint(laptop) {
      display: none;
    }
    @include breakpoint(desktop) {
      display: none;
    }
  }
  h2 {
    color: var(--background-color);
    padding-bottom: 10px;
  }
  transform: scale(0.6);
  &:hover {
    cursor: pointer;
  }
}
</style>
