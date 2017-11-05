live_loop :sync do
  cue :rythm1
  sleep 1
end

live_loop :sync2 do
  cue :rythm2
  sleep 0.5
end

live_loop :bass do
  play scale(:c2, :aeolian).tick, pitch: rrand(0, 0.1)
  sync :rythm2
end

live_loop :melody do
  synthesizes = [:mod_sine]
  use_synth synthesizes.choose
  i = tick + rrand_i(1,7)
  play scale(:c3, :aeolian)[i], amp: rrand(0.2, 0.4), note_slide: 2
  sync :rythm2
end

live_loop :drums do
  sample :drum_heavy_kick
  sync :rythm1
  sync :melody
end