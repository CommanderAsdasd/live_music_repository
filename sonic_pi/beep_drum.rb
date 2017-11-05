# Welcome to Sonic Pi v2.11.1
live_loop :drums do
  bd_samples = [:bd_tek, :bd_fat, :drum_cymbal_hard, []]
  sample bd_samples.choose
  puts((0.1...0.5))
  sample :elec_beep, beat_stretch: 01
  sleep [0.25, 0.5, 0.5].choose
end