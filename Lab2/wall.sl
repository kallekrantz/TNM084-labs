surface wall() {
  //Calculates coordinates for each wallsegment
  float segmentCount = 8;
  float segmentCoordX = segmentCount*mod(s,1/segmentCount);
  float segmentCoordY = segmentCount*mod(t,1/segmentCount);

  float segmentStep = 0.45;
  

  //Modulate the local coordinates against the global to get some unique noise for each segment
  float segmentNoise = noise((25*noise(t) + 4*segmentCoordX), 35*(noise(s))+3*segmentCoordY);
  //Seperate the noise components so we have space. 
  float segmentStepped = smoothstep(segmentStep, 1, segmentNoise);
  
  float intensity = segmentStepped;
  
  //Mixing the color tones
  Ci = color(0.7) - color(0,0,0.3*intensity);

  //Give me a good normal direction
  normal Nf = faceforward(normalize(N), I);
  
  //Below is for some nice Phong-Shading in order to see real difference the the displacement 
  Oi = Os;
  Ci = Oi * (Ci * (ambient() 
                   + 0.5 * diffuse(Nf)
                   ) + 
             1 * 0.5 * specular(
                                Nf, 
                                -I, 
                                0.1
                                )
             );
}
