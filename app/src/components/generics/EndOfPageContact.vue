<template>
  <section class="end-of-page-contact">
    <div v-if="!success" class="end-of-page-form">
      <h1 :class="[darkMode ? 'dark-mode' : '']">
        {{ title ? title : "Interested in working with me?" }}
      </h1>
      <div class="form-row" :class="[darkMode ? 'form-dark-mode' : '']">
        <label>Email</label>
        <input
          v-model="email"
          type="email"
          @keypress="validateEmail(email)"
          :class="[error ? 'error' : '']"
        />
      </div>
      <div class="form-row" :class="[darkMode ? 'form-dark-mode' : '']">
        <label>Message</label>
        <textarea v-model="message" />
      </div>

      <Button
        :title="error ? 'Enter valid email' : 'Send'"
        buttonStyle="submit"
        @clicked="
          postData('https://www.jamesdawson.dev/api/emails', {
            email,
            message,
          })
        "
      />
    </div>
    <div v-if="success">
      <h1 :class="[darkMode ? 'dark-mode' : '']">I will be in touch soon!</h1>
    </div>
  </section>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";
import Button from "@/components/generics/Button.vue";
defineProps<{ text: string; title?: string; darkMode?: boolean }>();
const success = ref(false);
const error = ref(false);

function validateEmail(email: string) {
  console.log(email);
  const re = /\S+@\S+\.\S+/;
  error.value = !re.test(email);
}

async function postData(url = "", data = {}) {
  if (error.value) return;
  const newData = {
    ...data,
    to: "jamesdawsonwd@gmail.com",
    template: "alpha-signup",
  };
  try {
    const info: RequestInit = {
      method: "POST", // *GET, POST, PUT, DELETE, etc.
      mode: "cors", // no-cors, *cors, same-origin
      cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
      credentials: "same-origin", // include, *same-origin, omit
      headers: {
        "Content-Type": "application/json",
        // 'Content-Type': 'application/x-www-form-urlencoded',
      },
      referrerPolicy: "no-referrer", // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
      body: JSON.stringify(newData), // body data type must match "Content-Type" header
    };
    const response = await fetch(url, info);
    if (response.status == 201) {
      success.value = true;
    } else {
      success.value = false;
    }
  } catch (e) {
    success.value = false;
  }
}
</script>

<style scoped lang="scss">
@import "@/styles";

.end-of-page-contact {
  .error {
    border: 2px solid var(--error) !important;
  }
  .dark-mode {
    color: var(--first-shade);
  }
  @include breakpoint(mobileonly) {
    width: 80vw;
    padding-right: 0px;
    h1 {
      font-size: 25pt;
    }
  }
  @include breakpoint(tablet) {
    width: 80vw;

    h1 {
      font-size: 30pt;
    }
  }
  @include breakpoint(phablet) {
    width: initial;
    h1 {
      font-size: 40pt;
    }
  }

  @include breakpoint(laptop) {
    width: initial;
    h1 {
      font-size: 50pt;
    }
  }
  @include breakpoint(desktop) {
    width: initial;
    h1 {
      font-size: 60pt;
    }
  }
  & > * {
    margin-top: 30px;
  }
  h1 {
    @include Lobster_Bold;
    color: var(--background-color);
  }
}
</style>
