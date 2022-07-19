<template>
  <div class="section1">
    <h1 v-if="!whereToShow && !contactMeShow">Hi</h1>
    <section class="section section-end" v-if="contactMeShow">
      <EndOfPageContact darkMode="true" />
    </section>
    <div class="mobile-button">
      <Button
        v-if="!whereToShow && !contactMeShow"
        @clicked="whereToShow = true"
        title="Where to?"
      />
      <Button v-if="whereToShow || contactMeShow" @clicked="resetWhereTo()"
      title="Back" />
    </div>
    <div class="buttons">
      <Button @clicked="navigateTo('/my-projects')" title="My Projects" />
      <Button
        @clicked="navigateTo('/client-projects')"
        title="Client Projects"
      />
      <Button @clicked="navigateTo('/hackathons')" title="Hackathons" />
      <Button
        v-if="!contactMeShow"
        @clicked="contactMeShow = true"
        title="Contact me"
      />
      <Button v-else @clicked="contactMeShow = false" title="Back" />
    </div>
    <div class="where-to" v-if="whereToShow && !contactMeShow">
      <Button @clicked="navigateTo('/my-projects')" title="My Projects" />
      <Button
        @clicked="navigateTo('/client-projects')"
        title="Client Projects"
      />
      <Button @clicked="navigateTo('/hackathons')" title="Hackathons" />
      <Button @clicked="contactMeShow = true" title="Contact" />
    </div>
  </div>
</template>

<script setup lang="ts">
import Button from "@/components/generics/Button.vue";
import EndOfPageContact from "@/components/generics/EndOfPageContact.vue";
import WhereTo from "@/views/WhereTo.mobile.vue";
import router from "../router";
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import { useEventListener } from "@/hooks/core/events/userEventListener";
import { useUi } from "@/store/ui";
const ui = useUi();
const whereToShow = ref(false);
const contactMeShow = ref(false);

function navigateTo(path: any) {
  router.push({ path });
}

function resetWhereTo() {
  whereToShow.value = false;
  contactMeShow.value = false;
}
onMounted(() => {
  if (!ui.getDarkMode) ui.darkModeOff();
});
</script>
<style lang="scss">
@import "@/styles";

.section1 {
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;

  .where-to {
    width: 100vw;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    @include breakpoint(mobileonly) {
      display: flex !important;
    }
    @include breakpoint(tablet) {
      display: flex !important;
    }
    @include breakpoint(phablet) {
      display: flex !important;
    }

    @include breakpoint(laptop) {
      display: none !important;
    }
    @include breakpoint(desktop) {
      display: none !important;
    }
  }
  h1 {
    text-align: center;
    font-size: 300pt;
    @include RM_Regular;

    @include breakpoint(mobileonly) {
      font-size: 200pt;
    }
    @include breakpoint(tablet) {
      font-size: 270pt;
    }
    @include breakpoint(phablet) {
      font-size: 270pt;
    }

    @include breakpoint(laptop) {
      font-size: 300pt;
    }
    @include breakpoint(desktop) {
      font-size: 300pt;
    }
  }

  .mobile-button {
    position: fixed;
    display: flex;
    justify-content: center;
    align-items: center;
    bottom: 0;
    width: 100vw;
    @include breakpoint(mobileonly) {
      display: flex !important;
    }
    @include breakpoint(tablet) {
      display: flex !important;
    }
    @include breakpoint(phablet) {
      display: flex !important;
    }

    @include breakpoint(laptop) {
      display: none !important;
    }
    @include breakpoint(desktop) {
      display: none !important;
    }
    button {
      width: 90% !important;
      text-align: center;
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
    @include breakpoint(mobileonly) {
      display: none !important;
    }
    @include breakpoint(tablet) {
      display: none !important;
    }
    @include breakpoint(phablet) {
      display: none !important;
    }

    @include breakpoint(laptop) {
      display: flex !important;
    }
    @include breakpoint(desktop) {
      display: flex !important;
    }
    & > :not(:last-child) {
      margin-right: 20px;
    }
  }
}
</style>
