/*
	on jade template
	>canvas#myCanvas(width=400 height=400)
	https://codepen.io/anon/pen/KzKBMW
*/

var localWidth = 400, localHeight = localWidth;

var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
ctx.fillStyle = "#2F2F2F";
ctx.fillRect(0, 0, localWidth, localHeight);

// circle 1
var center = localWidth/2, radius = center-20;
ctx.beginPath();
ctx.strokeStyle = "#F2F2F2";
ctx.lineWidth = 10;
ctx.arc(center,center,radius,0,2*Math.PI);
ctx.closePath()
ctx.stroke();
// circle 2
var moveRatio = 0.12;
var center2X = center*(1+moveRatio*0.866)-5, center2Y = center*(1-moveRatio*0.5), radius2 = radius*(1-moveRatio);
ctx.beginPath();
ctx.strokeStyle = "#F2F2F2";
ctx.lineWidth = 10;
ctx.arc(center2X,center2Y,radius2,0,2*Math.PI);
ctx.closePath()
ctx.stroke();

//triangle
ctx.beginPath();
ctx.strokeStyle = "#FF0000";
ctx.lineWidth = 10;
ctx.moveTo(center,radius*2+20-14);
ctx.lineTo(center-(radius*0.866)+14, center-(radius*0.5));
ctx.lineTo(center+(radius*0.866)-17, center-(radius*0.5));
ctx.closePath();
ctx.stroke();

// red line
ctx.beginPath();
ctx.moveTo(center,radius*2+20-48);
ctx.strokeStyle = "#FF0000";
ctx.lineWidth = 3;
ctx.lineTo(center-((radius-44)*0.866)+5, center-(((radius-42))*0.5));
ctx.closePath();
ctx.stroke();

// white line
ctx.beginPath();
ctx.moveTo(radius*2+20-40,center);
ctx.strokeStyle = "#F2F2F2";
ctx.lineWidth = 3;
ctx.lineTo(radius*2+20+10, center);
ctx.closePath();
ctx.stroke();
ctx.beginPath();
ctx.moveTo(10,center);
ctx.strokeStyle = "#F2F2F2";
ctx.lineWidth = 3;
ctx.lineTo(50, center);
ctx.closePath();
ctx.stroke();

//font
ctx.beginPath();
ctx.fillStyle = "#F2F2F2";
ctx.lineWidth = 3
ctx.font = "150px Georgia, serif";
ctx.fillText("G",center-52,center+40);
ctx.closePath();