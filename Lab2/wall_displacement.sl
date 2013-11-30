displacement wall_displacement() {
  float segmentCount = 5;
  //Gets the segmentCoordinates. Could probably be its own shader.
  float segmentCoordX = segmentCount*mod(s,1/segmentCount);
  float segmentCoordY = segmentCount*mod(t,1/segmentCount);
  
  float maskConstant = 0.05;

  float displacementMaskX = step(maskConstant, segmentCoordX);
  float displacementMaskY = step(maskConstant, segmentCoordY);
  
  float displacementAmplitude = -0.01;

  //  float disp = displacementAmplitude * clamp(displacementMaskX + displacementMaskY, 0, 1);
  float dispX = displacementAmplitude * displacementMaskX;
  float dispY = displacementAmplitude * displacementMaskY;


  //needed in order to not get of 2*displacementAmplitude
  float disp = max(dispX,dispY);

  P = P + N*disp;
  N = calculatenormal(P);
}
