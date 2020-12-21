<template>
  <div id="tuto">
    <button-clicked v-bind:initial-count="0"></button-clicked>
  </div>
</template>

<script>
Vue.component('button-clicked', {
  props: ['initialCount'],
  data: () => ({
    count: 0,
  }),
  template: '<button v-on:click="onClick">Clicked {{ count }} times</button>',
  computed: {
    countTimesTwo() {
      return this.count * 2;
    }
  },
  watch: {
    count(newValue, oldValue) {
      console.log(`The value of count is changed from ${oldValue} to ${newValue}.`);
    }
  },
  methods: {
    onClick() {
      this.count += 1;
    }
  },
  mounted() {
    this.count = this.initialCount;
  }
});

new Vue({
  el: '#tuto',
});
</script>
