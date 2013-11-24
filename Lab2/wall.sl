surface wall() {
  //Calculates coordinates for each wallsegment
  float segmentCount = 5;
  float segmentCoordX = segmentCount*mod(s,1/segmentCount);
  float segmentCoordY = segmentCount*mod(t,1/segmentCount);

  float segmentStep = 0.5;

  float segmentNoise = 2*noise(35*noise(t)+segmentCoordX, 35*noise(s)+segmentCoordY);
  float segmentStep = smoothstep(segmentStep, 1, segmentNoise);
  float segmentColor = 1 - segmentNoise * segmentStep;

  Ci = color(1, 1, 1-0.5*segmentColor);
  Oi = Os;
}
