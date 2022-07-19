<script lang="ts" setup>
import SearchBar from "@/components/generics/SearchBar.vue";
import makeBlockie from "ethereum-blockies-base64";
import router from "@/router";
import { Address } from "@/types";
import { addressZero, shortAddress } from "@/utils";
import store from "@/store/";
import { ref, watch } from "vue";
import { useUi } from "@/store/ui";
const ui = useUi();
const address = "0xe946BeCd1276cd0Cb177b7c52200D6a03ee75037";
function blockie(address: Address) {
  return makeBlockie(address);
}
function navigateHome(): void {
  router.push({ path: `/` });
}
function searchCollection(address: Address): void {
  router.push({ path: `/nft/${address}` });
}
</script>

<template>
  <header class="header-nav">
    <div class="content" :class="ui.getDarkMode ? 'dark-mode' : ''">
      <div class="logo-container">
        <a @click.prevent="navigateHome()"><h2>jamesdawson.dev</h2></a>
      </div>
      <div class="nav">
        <a class="social-media" href="https://twitter.com/GPCP_community">
          <img
            v-svg-inline
            class="icon"
            src="@/assets/svg/twitter.svg"
            alt="Twitter"
          />
        </a>
        <a class="social-media" href="https://github.com/jamesdawsonWD/">
          <img
            v-svg-inline
            class="icon"
            src="@/assets/svg/github.svg"
            alt="Github"
          />
        </a>

        <a
          class="ens-domain"
          href="https://app.ens.domains/name/jimjam.eth/details"
          ><h4 class="ens">jimjam.eth</h4>
          <img
            :class="ui.getTransition ? 'opacity-0' : ''"
            class="blockie"
            :src="blockie(address)"
          />
        </a>
      </div>
    </div>
  </header>
</template>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "@/styles";
.opacity-0 {
  opacity: 0;
}
.header-nav {
  height: 75px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  width: 100vw;
  z-index: 20000;
  .dark-mode {
    .logo-container a h2 {
      color: var(--background-color);
    }

    .ens {
      color: var(--background-color);
    }

    .social-media {
      .icon {
        fill: var(--background-color) !important;
      }
    }
  }
  .search-bar {
    width: 700px;
  }
  .ens-domain {
    margin-right: 20px;
  }
  .blockie {
    transition: 0.5s;
    height: 35px;
    width: 35px;
    border-radius: 50%;
  }
  .ens {
    margin-right: 10px;
    transition: 0.5s;

    @include breakpoint(mobileonly) {
      display: none;
    }
    @include breakpoint(tablet) {
      display: none;
    }
    @include breakpoint(phablet) {
      display: block;
    }

    @include breakpoint(laptop) {
      display: block;
    }
    @include breakpoint(desktop) {
      display: block;
    }
  }
  .balance-wallet {
    position: absolute;
    right: 300px;
    height: 55px;
    background: var(--main-font);
    display: flex;
    z-index: 9;
    padding: 0 20px;
    top: 60px;
    align-items: center;
    justify-content: center;
    border-radius: 15px;

    h4 {
      color: var(--first-shade);
      font-size: 12pt;
    }
  }

  h2 {
    font-size: 26pt;
  }
  @include breakpoint(mobileonly) {
    .content {
      .logo-container {
        h2 {
          font-size: 20pt;
        }
      }
      .nav .social-media {
        display: none !important;
      }
    }
  }
  @include breakpoint(tablet) {
    .content {
      .logo-container {
        h2 {
          font-size: 20pt;
        }
      }
      .nav .social-media {
        display: none !important;
      }
    }
  }
  @include breakpoint(phablet) {
    .content {
      .logo-container {
        h2 {
          font-size: 20pt;
        }
      }
      .nav .social-media {
        display: none !important;
      }
    }
  }

  @include breakpoint(laptop) {
    .content {
      .logo-container {
        h2 {
          font-size: 30pt;
        }
      }
      .nav .social-media {
        display: flex !important;
      }
    }
  }
  @include breakpoint(desktop) {
    .content {
      .logo-container {
        h2 {
          font-size: 30pt;
        }
      }
      .nav .social-media {
        display: flex !important;
      }
    }
  }
  .content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    top: 0;
    margin: 0 10px;
    .logo-container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-left: 20px;
      svg {
        height: 10px;
        width: 10px;
      }
      h2 {
        line-height: 20px;
        display: flex;
        justify-content: center;
        transition: 0.5s;
        color: var(--first-shade);
        align-items: center;
      }
    }
    .logo {
      margin-right: 10px;
      top: 10px;
      height: 28px;
    }

    .nav {
      display: flex;
      justify-content: center;
      align-items: center;

      .social-media {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 40px;
        .icon {
          fill: var(--first-shade);
          transition: 0.5s;
          &:hover {
            cursor: pointer;
            fill: var(--main) !important;
          }
        }

        & > * {
          padding: 5px;
          height: 35px;
        }
      }
    }
    .connect,
    .address {
      width: 100px;
      border: none;
      padding: 10px;
      margin: 0 0 0 50px;
      border-radius: 12px;
      background: transparent;
      transition: 0.2s;
      font-size: var(--md-font);
      color: var(--first-shade);
      border: 3px solid var(--main);
      background: var(--main);
      font-weight: 700;
      outline: none;
      display: flex;
      justify-content: center;
      align-items: center;
      &:hover {
        cursor: pointer;
        color: white;
      }
    }

    .address {
      width: auto;
      color: white;
      background: var(--button-color);
    }
    a {
      font-weight: bold;
      color: #2c3e50;
      text-decoration: none;
      display: flex;
      font-size: var(--md-font);
      align-items: center;
      height: 50px;
      justify-content: center;
    }
  }
}
</style>
