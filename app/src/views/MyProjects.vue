<template>
  <ProjectDisplay title="Projects" :projects="projects" :leftNavigation="leftNavigation" :rightNavigation="rightNavigation"/>
</template>

<script setup lang="ts">
import ProjectDisplay from "@/components/generics/ProjectDisplay.vue";
import { Project, ModalTypes } from "@/types";

const leftNavigation = {
  name: "Home",
  url: "/"
}
const rightNavigation = {
  name: "Client Projects",
  url: "/client-projects"
}
const projects: Project[] = [
  {
    title: "Guinea Pig Costume Party",
    image: "/img/gpcp.png",
    modal: ModalTypes.ProjectInfo,
    description:
      "The Guinea Pig Costume Party is a NFT project that I developed, designed and released by myself. I learned a lot about the developoment of NFTs and designing and NFT site and deploying all of these elements live. It was a great experience and I am very proud of the final product. It is live on mainet so be sure to go check it out!",
    url: "https://www.guineapigcostumeparty.com/",
    twitter: "https://twitter.com/GPCP__",
    github: "https://github.com/jamesdawsonWD/gpcp/",
  },
  {
    title: "SwirlPool",
    image: "/img/swirlpool.png",
    modal: ModalTypes.ProjectInfo,
    description: "Swirlpool is a streamable Automated Market Maker(AMM). This is my current project that I am working on and it is still under development. I have designed and written all the smart contracts and I am currently quite happy with the implementation. It is written with Solidity and uses Superfluid for the streaming services. I am hoping to have the product live on a Matic testnet soon so keep an eye out!",
    github: "https://github.com/jamesdawsonWD/FlowSwap/",
  },
];
</script>
