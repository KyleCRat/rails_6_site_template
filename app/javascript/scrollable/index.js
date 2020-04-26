///////////////////////////////////////////////////
// This function uses reqeust animation frame
//   to check scroll position of the page to
//   get a smooth and accurate scroll position
///////////////////////////////////////////////////

window.Scrollable = {};

window.requestAnimationFrame = window.requestAnimationFrame
    || window.mozRequestAnimationFrame
    || window.webkitRequestAnimationFrame
    || window.msRequestAnimationFrame
    || function(f){return setTimeout(f, 1000/60)} // simulate calling code 60

window.cancelAnimationFrame = window.cancelAnimationFrame
    || window.mozCancelAnimationFrame
    || function(requestID){clearTimeout(requestID)} //fall back

Scrollable.scrollDirection = 0;
Scrollable.scrollVelocity = 0;
Scrollable.currentPos = 0;
Scrollable.previousPos = 0;
Scrollable.timestamp = 0;

Scrollable.scrollCheck = function() {
  var scrollPosFrame = requestAnimationFrame(scrollPos);
}

// Detect Scrolling position and set window for all functions to use
function scrollPos() {
  setTimeout(function(){ //throttle requestAnimationFrame to window.scrollFPS
    Scrollable.currentPos = window.pageYOffset;
    Scrollable.scrollVelocity = Scrollable.currentPos - Scrollable.previousPos;
    Scrollable.previousPos = Scrollable.currentPos;

    if(Scrollable.scrollVelocity != 0) {
      var event = new CustomEvent('raf:scrolling', { detail: { position: Scrollable.currentPos, velocity: Scrollable.scrollVelocity } });
      window.dispatchEvent(event);
    }

    window.requestAnimationFrame(scrollPos);
  }, 1000/window.scrollFPS);
}

document.addEventListener('turbolinks:load', function() {
  Scrollable.scrollCheck();
});

// document.addEventListener('raf:scrolling', function(e) {
//   // console.log('pos: '+e.detail.position+' | vel: '+e.detail.velocity);
// });
