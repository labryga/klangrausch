const canvas  = document.getElementById('leinwand');
const context = canvas.getContext('2d');

const canvas_width = canvas.offsetWidth;
const canvas_height = canvas.offsetHeight;

context.lineWidth = 2;
context.strokeStyle = '#FAD807';

let itemsArray = [];
let division_factor = canvas_width/10;
let offset_factor = division_factor/2

for (d=division_factor; d<canvas_width; d+=division_factor) {
  itemsArray.push(new lineObjects(d));  
}

function lineObjects (d) {
  this.division_factor = d;
  this.moveToX = (canvas_width - this.division_factor) + offset_factor;
  this.lineToY = (canvas_height - this.division_factor) + offset_factor;
  this.speed = 0;
  this.draw = function() {
    context.beginPath();
    context.moveTo(this.moveToX, 0);
    context.lineTo(this.moveToX - this.speed, this.speed);
    context.stroke();
    if (this.speed <= 700) {
      this.speed += 2;
      requestAnimationFrame(this.draw.bind(this))
    }
    };
}

itemsArray.forEach(element => element.draw());
