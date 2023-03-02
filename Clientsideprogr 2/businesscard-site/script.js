const viewPortHeight = document.documentElement.clientHeight;

// Set homepage virtual site height
document.getElementById("homepage").style.height =  viewPortHeight + "px";

// Set about page virtual site height
document.getElementById("about").style.height =  viewPortHeight + "px";

// Allign image vertically
const imageDivHeight = document.getElementById("image").clientHeight;

document.getElementById("profile").style.marginTop = (imageDivHeight / 2.5) + "px";

const scrollTrigger = viewPortHeight / 6;

window.addEventListener("scroll", (event) => {
  if (window.scrollY > scrollTrigger) {
    document.getElementById("about").scrollIntoView({ 
      behavior: 'smooth'
    });  
  }
});