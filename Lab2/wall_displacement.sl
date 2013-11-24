displacement wall_displacement() {
  float segmentCount = 5;
  float segmentCoordX = segmentCount*mod(s,1/segmentCount);
  float segmentCoordY = segmentCount*mod(t,1/segmentCount);
  
  float maskConstant = 0.02;

  float displacementMaskX = step(segmentCoordX, maskConstant);
  float displacementMaskY = step(segmentCoordY, maskConstant);
  
  float displacementAmplitude = 0.02;

  float disp = displacementAmplitude * clamp(displacementMaskX + displacementMaskY, 0, 1);

  P = P - N*disp;
  N = calculatenormal(P);
}
