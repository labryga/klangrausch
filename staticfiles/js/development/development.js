
const wand = document.getElementById("leinwand");
const c = wand.getContext("2d");
const wand_w = wand.offsetWidth, wand_h = wand.offsetHeight;
c.translate(wand_w/2, wand_h/2);
c.save();

function sun () {
  c.lineWidth = 2;
  for (let i=1; i<97; i++ ) {
      c.rotate((2 * Math.PI / 96) * i);
      c.beginPath();
      if (i%2 == 0) {
          c.moveTo(0, Math.random() * 90 + 170);
          c.lineTo(0, wand_h/2 - 20);
      } else {
          c.moveTo(0, 270);
          c.lineTo(0, wand_h/2 - 20);
      }
      c.stroke();
      c.restore();
  }
  c.clearRect(0, 0, wand.width, wand.height);
}

// setInterval(sun, 1000);


