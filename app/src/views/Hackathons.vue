<template>
  <ProjectDisplay
    title="Hackathons"
    :projects="projects"
    :leftNavigation="leftNavigation"
    :rightNavigation="rightNavigation"
  />
</template>

<script setup lang="ts">
import ProjectDisplay from "@/components/generics/ProjectDisplay.vue";
import { Project, ModalTypes } from "@/types";

const leftNavigation = {
  name: "Client Projects",
  url: "/client-projects",
};
const rightNavigation = {
  name: "Home",
  url: "/",
};
const projects: Project[] = [
  {
    title: "Super Karma - Non-Profit DAO",
    image: "/img/superkarma.png",
    modal: ModalTypes.ProjectInfo,
    description:
      "This was a team hackathon project where we decided to attempt to create a non-profit Decentralised Autonomous Organisation. The concept was that the DAO would manage generic charitable concepts that users could donate too. For example, 'Cancer Research Fund'. The DAO would then accept donations in crypto even if through the super fluid streaming services and the DAO would then decide where the money actually went.",
    url: "https://www.youtube.com/watch?v=rkUYmG2Qrqs&t=151s",
    github: "https://github.com/jamesdawsonWD/SuperKarma",
  },
  {
    title: "SpaceDx - NFT Game",
    image: "/img/spacedx.png",
    modal: ModalTypes.ProjectInfo,
    description:
      "The project that I solo developed that rewarded me a finalist position in the ETH Global Hackathon. This was one of the first Web3 projects that I ever worked on.",
    url: "https://www.youtube.com/watch?v=JNjNNGuNDe0&t=14s",
    github: "https://github.com/jamesdawsonWD/spacedx",
  },
  {
    title: "Zygo Finance - Interest limit orders",
    image: "/img/zygo.png",
    modal: ModalTypes.ProjectInfo,
    description:
      "A limit ordering system that uses bots to execute limit orders on behalf of users. Using this system we Zygo finance would be able to earn interest on Limit orders using decentralised interest pools such as Aave.",
    url: "https://www.youtube.com/watch?v=pUeF24jTk_E&t=71s",
    github: "https://github.com/jamesdawsonWD/zygo",
  },
];
</script>
