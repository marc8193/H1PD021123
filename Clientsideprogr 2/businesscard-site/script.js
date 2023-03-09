const viewPortHeight = document.documentElement.clientHeight;

// Set homepage virtual site height
document.getElementById("homepage").style.height =  viewPortHeight + "px";

// Set about page virtual site height
document.getElementById("about").style.height =  viewPortHeight + "px";

const scrollTrigger = viewPortHeight / 6;

window.addEventListener("scroll", (event) => {
  if (window.scrollY > scrollTrigger) {
    document.getElementById("about").scrollIntoView({ 
      behavior: 'smooth'
    });  
  }
});