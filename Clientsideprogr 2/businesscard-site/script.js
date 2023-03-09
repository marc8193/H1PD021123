const viewPortHeight = document.documentElement.clientHeight;

// Set homepage virtual site height
document.getElementById("homepage").style.height =  viewPortHeight + "px";

// Set about page virtual site height
document.getElementById("about").style.height =  viewPortHeight + "px";

// Auto scroll
const scrollTrigger = viewPortHeight / 6;

let toTopPressed = false;

window.addEventListener("scroll", (event) => {
  if (window.scrollY > scrollTrigger && !toTopPressed) {
    document.getElementById("about").scrollIntoView({ 
      behavior: 'smooth'
    });  
  }

  if (window.scrollY < scrollTrigger) {
    toTopPressed = false;
  } 
});

// To top button
async function toTop() {
  toTopPressed = true;

  document.getElementById("homepage").scrollIntoView({ 
    behavior: 'smooth'
  });
}