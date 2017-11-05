# Welcome to Sonic Pi v2.11.1
live_loop :chords do
  with_fx :ring_mod do
    play chord(:E3, 'm7+9')
    sleep [1,0.5].choose
    play chord(:E3, 'm11+').tick
    sleep [1,0.5].choose
  end
end

live_loop :bass do
  
  use_synth :blade
  play chord(:E2, 'm7+9').choose
  sleep [1,0.5].choose
  play chord(:E2, 'm11+').choose
  sleep [1,0.5].choose
end

