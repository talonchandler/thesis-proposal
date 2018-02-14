usepackage("amsmath");
settings.outformat = "pdf";
settings.render=16;
settings.embed=true;
settings.prc=true;
import three;
import graph3;
import grid3;
defaultpen(fontsize(10pt));
currentprojection = perspective(5,5,3);

size(9cm,9cm);

void lens(real x, real y, real radius, real theta) {
     draw(arc((x,-radius*Cos(theta)+y), radius, angle1=90-theta, angle2=90+theta));
     draw(arc((x,radius*Cos(theta)+y), radius, angle1=270-theta, angle2=270+theta));
}


lens(0,0,3,20); label("Objective Lens", (1.1, 0), align=E);
lens(0,4,3,20); label("Tube Lens", (1.1, 4), align=E);
draw(box((-1, -1.95), (1, -2.05))); label("Sample", (1.1, -2.0), align=E);
draw(shift(0, 2)*rotate(-45)*box((-sqrt(2), -0.05), (sqrt(2), 0.05))); label("Dichromatic", (1.1, 1.75), align=E); label("Mirror", (1.1, 2.25), align=E);
draw(shift(-5, 2)*rotate(90)*box((-1, -0.05), (1, 0.05))); label("Source", (-5,0), align=N);
draw((-3, 1)--(-3, 3)); label("Switchable", (-3,0.25), align=N);  label("Polarizer", (-3,-0.25), align=N);  

draw((0, -2)--(-0.95, 0)--(-0.95, 4)--(0, 6)--(0.95, 4)--(0.95, 0)--(0,-2), green+dashed+linewidth(1pt));
draw((0, 6)--(0.125, 6.25), green+dashed+linewidth(1pt));
draw((0, 6)--(-0.125, 6.25), green+dashed+linewidth(1pt));
draw((-5, 2.5)--(-0.5, 2.5)--(-0.5, 0)--(0, -2)--(0.5, 0)--(0.5, 1.5)--(-5, 1.5), blue+linewidth(1pt));

lens(0,6,0.4,20);
lens(0.3,6,0.4,20);
lens(0.6,6,0.4,20);
lens(0.9,6,0.4,20);
lens(-0.3,6,0.4,20);
lens(-0.6,6,0.4,20);
lens(-0.9,6,0.4,20);

label("\textbf{Micro-lens array}", (1.1, 5.9), align=E);
draw(box((-1, 6.2), (1, 6.3))); label("Detector", (1.1, 6.4), align=E);


shipout(scale(4.0)*currentpicture.fit());
