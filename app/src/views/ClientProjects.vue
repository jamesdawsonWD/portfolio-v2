<template>
  <ProjectDisplay
    title="Client Projects"
    :projects="projects"
    :leftNavigation="leftNavigation"
    :rightNavigation="rightNavigation"
  />
</template>

<script setup lang="ts">
import ProjectDisplay from "@/components/generics/ProjectDisplay.vue";
import { Project, ModalTypes } from "@/types";

const leftNavigation = {
  name: "My Projects",
  url: "/my-projects",
};
const rightNavigation = {
  name: "Hackathons",
  url: "/hackathons",
};
const projects: Project[] = [
  {
    title: "Liquid Finance",
    image: "/img/liquid.png",
    modal: ModalTypes.ProjectInfo,
    description:
      "Liquid Finance is a collection of smart contracts that allowed for Liquidity Mining of Synthetic Tokens using the UMA protocol. I designed and developed all the smart contracts that passed a suite of tests that I also made. This was my first project working with auditors and I was very happy to of passed the audit. I also designed and developed the entire frontend. The app allows the user to trade, stake, create bonds and participate in the governance of the protocol all through the app. This is currently a mock of the applicaiton and the client has not yet released their product onto mainet.",
    url: "",
  },
];
</script>
