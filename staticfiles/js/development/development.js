const canvas  = document.getElementById('leinwand');
const context = canvas.getContext('2d');

const canvas_width = canvas.offsetWidth;
const canvas_height = canvas.offsetHeight;

context.lineWidth = 2;
context.strokeStyle = '#FAD807';

// let i = 1;

// function lineAnimation () {
//   if (i>700) {
//     cancelAnimationFrame(lineAnimation);
//   } else {
//     i += 2;
//     context.clearRect(0,0,canvas.width,canvas.height);
//     context.beginPath();
//     context.moveTo(0,0);
//     context.lineTo(i+10,i+10);
//     context.stroke();
//     let myReq = requestAnimationFrame(lineAnimation);
//   }
// }
//
// lineAnimation();

let division_factor = canvas_width/10;
for (d=division_factor; d<canvas_width; d+=division_factor) {

  context.beginPath();
  context.moveTo(0, d);
  context.lineTo(d,0);
  context.stroke();

  context.beginPath();
  context.moveTo(d, canvas_height);
  context.lineTo(canvas_width,d);
  context.stroke();

}
