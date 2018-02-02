# Welcome to Sonic Pi v3.0.1

live_loop :dromon do
  with_synth :chipbass do
    play scale(:c2, :aeolian), attack: 2, decay: 5, sustain: 6
    play scale(:c3, :aeolian), attack: 2, sustain: rrand_i(1,5)
    fxs = [:wobble, :echo]
    with_fx fxs.choose do
      play scale(:c3, :aeolian).tick, attack: 0.2, sustain: 0.2
    end
    sleep 5
  end
end

live_loop :dromon2 do
  with_synth :beep do
    play scale(:c2, :aeolian), attack: 2, decay: 5, sustain: 6
    play scale(:c1, :aeolian), attack: 2, pitch: 2, sustain: 6
    sleep 5
  end
end

live_loop :effects_sample do
  sample :elec_bong
  sync "/live_loop/dromon"
end
