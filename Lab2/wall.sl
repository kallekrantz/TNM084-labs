surface wall() {
  //Calculates coordinates for each wallsegment
  float segmentCount = 5;
  float segmentCoordX = segmentCount*mod(s,1/segmentCount);
  float segmentCoordY = segmentCount*mod(t,1/segmentCount);

  float segmentStep = 0.5;

  float segmentNoise = 2*noise(35*noise(t)+segmentCoordX, 35*noise(s)+segmentCoordY);
  float segmentStep = smoothstep(segmentStep, 1, segmentNoise);
  float segmentColor = 1 - segmentNoise * segmentStep;
  //We have now the color for the material of the pixel


  //Mixing the color tones
  Ci = color(0.7, 0.7, 0.7-0.15*segmentColor);
  
  //Below is for some nice Phong-Shading in order to see real difference the the displacementg
  normal Nf = faceforward(normalize(N), I);
  Oi = Os;
  Ci = Oi * (Ci * (ambient() + 0.5*diffuse(Nf)) + 1 * 0.5 * specular(Nf, -I, 0.1));
}
