displacement wall_displacement() {
  float segmentCount = 5;
  float segmentCoordX = segmentCount*mod(s,1/segmentCount);
  float segmentCoordY = segmentCount*mod(t,1/segmentCount);
  
  float maskConstant = 0.1;

  float displacementMaskX = step(maskConstant, segmentCoordX);
  float displacementMaskY = step(maskConstant, segmentCoordY);
  
  float displacementAmplitude = -0.05;

  //  float disp = displacementAmplitude * clamp(displacementMaskX + displacementMaskY, 0, 1);
  float dispX = displacementAmplitude * displacementMaskX;
  float dispY = displacementAmplitude * displacementMaskY;


  //float disp = dispX + dispY;
  float disp = clamp(dispX + dispY, displacementAmplitude, 0);

  P = P + N*disp;
  N = calculatenormal(P);
}
