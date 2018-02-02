# Welcome to Sonic Pi v3.0.1
define :sequencer do |x|
  if x == 1
    return true
  else
    return false
  end
end

##| puts(sequencer(1))

live_loop :melod do
  with_fx :echo, mix: 0.8 do
    beat_numbers = (ring 1,1,1,1,
                    1,1,0,0,
                    1,1,1,0,
                    0,1,1,1)
    
    ##| synths = [:blade, :dtri, :beep]
    ##| use_synth synths.choose
    use_synth :beep
    ##| i = rrand_i(0,6)
    if sequencer(beat_numbers.tick)
      play scale(:c3, :chinese).choose, amp: 0.2, attack: rrand(0, 0.01), sustain: rrand(0,0.1), decay: rrand(0, 0.1)
      sleep 0.25
    end
    sleep 0.5
    ##| sleep [0.25, 0.125, 0.5, 0.75].choose
    ##| play scale(:f3, :)[i]
    ##| sleep 0.25
  end
end

live_loop :melod2 do
  use_synth :saw
  ##| play scale(:c3, :phrygian).tick, amp: 0.2
  ##| play chord(:c2, '1'), amp: 0.5
  sleep 1
  ##| sync "/live_loop/melod"
  ##| use_
end

live_loop :drums do
  ##| sample :elec_beep, amp: 0.2
  sleep 0.5
  sample :drum_cymbal_closed
  sleep 0.5
  sample :drum_heavy_kick, amp: 0.5
  ##| sleep 0.25
  
  ##| sample :drum_snare_hard, amp:
  sleep 0.25
end
