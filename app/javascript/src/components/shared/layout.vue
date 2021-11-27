<template>
  <div id="main" class='container full-height'>
    <!-- <nav-top></nav-top> -->
    <div class='row'>
      <slot/>
    </div>
  </div>
</template>

<style>
#app{
  /* background-image: url("https://images.unsplash.com/photo-1611318285008-ff902cd59e5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1400&q=80") */
background-image: url("https://images.unsplash.com/photo-1612892483236-52d32a0e0ac1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1500&q=80"); 
}
html, body {
  height: 100%;
}

.full-height {
  height: 100%;
  
}
#main {
  height: 100vh;
  width: 100vh;
  background-color: black
  };
</style>
