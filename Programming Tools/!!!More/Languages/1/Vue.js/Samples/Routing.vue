<div id="app">
  <router-view></router-view>
</div>
...

<script>
...
const User = {
  template: '<div>User {{ $route.params.id }}</div>'
};

const router = new VueRouter({
  routes: [
    { path: '/user/:id', component: User }
  ]
});
...
</script>
