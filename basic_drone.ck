   // connect sine oscillator to D/A convertor (sound card)
   while (true) {
      SinOsc s => dac;
      Std.rand2f( 30, 1000 ) => s.freq;
      Math.random2( 100, 100 ) => int t;
      t::ms => now;
  }
 /* Std.rand(10,1000) */
