let tooltip = document.createElement('div');
tooltip.className = 'tooltip';


document.addEventListener('mouseover', function(event){
  let zielobjekt = event.target;
  if (zielobjekt.tagName == 'BUTTON') {document.body.append(tooltip)}
  let zielobjekt_koordinaten = zielobjekt.getBoundingClientRect();
  eintrag.innerHTML = zielobjekt_koordinaten.top;
  tooltip.innerHTML = zielobjekt.dataset.wert;
  tooltip.style.width = zielobjekt_koordinaten.width + 'px';

  tooltip.style.top =   scrollY + zielobjekt_koordinaten.top
                      - tooltip.clientHeight - 5 + 'px';

  if (tooltip.getBoundingClientRect().top < 0) {
    tooltip.style.top =   scrollY + zielobjekt_koordinaten.bottom + 5 + 'px'; }

  tooltip.style.left = zielobjekt_koordinaten.x + 'px';
});

document.addEventListener('mouseout', function(event) {
  let zielobjekt = event.target;
  if (zielobjekt.tagName == 'BUTTON') {tooltip.remove()}
});


let canvas;
let context;
const factor = 0.4;

// window.onload = function() {
//   canvas = document.getElementById('leinwand');
//   context = canvas.getContext('2d');
//   console.log(context);

  // function setCanvasSize (factor_x, factor_y) {
  //   canvas.width  = window.innerWidth * factor_x;
  //   canvas.height = window.innerWidth * factor_y;
  // }
  //
  // setCanvasSize(factor, factor);
// }

// function setSize(event) {
//   canvas.width  = event.target.screen.availWidth * factor;
//   canvas.height = event.target.screen.availWidth * factor;
// }
//
// window.addEventListener('orientationchange', function(event) {
//   setSize(event);
//   console.log(event.target.screen);
// });
//

// context.beginPath();

// context.lineWidth = 0.5;
// context.strokeStyle = '#FAD807';

// let itemsArray = [];
// let division_factor = canvas_width/10;
// let offset_factor = division_factor/2
//
// for (d=division_factor; d<canvas_width; d+=division_factor) {
//   itemsArray.push(new lineObjects(d));  
// }
//
// function lineObjects (d) {
//   this.division_factor = d;
//   this.moveToX = (canvas_width - this.division_factor) + offset_factor;
//   this.lineToY = (canvas_height - this.division_factor) + offset_factor;
//   this.speed = Math.random() * 25;
//   this.draw = function() {
//     context.beginPath();
//     context.moveTo(this.moveToX, 0);
//     context.lineTo(this.moveToX - this.speed, this.speed);
//     context.stroke();
//     if (this.speed <= 700) {
//       this.speed += 3;
//       requestAnimationFrame(this.draw.bind(this))
//     }
//     };
// }
//
// itemsArray.forEach(element => element.draw());
