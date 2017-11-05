live_loop :midi_piano do
  use_real_time
  ##| control_knob = sync "/midi/keystation_mini_32/1/1/control_change"
  note, velocity = sync "/midi/keystation_mini_32/1/1/note_on"
  with_fx :echo do
    use_synth :piano
    puts(note)
    play note: note, amp: velocity / 127.0
  end
end


live_loop :drum do
  with_fx :ring_mod, freq: 2 do
    sample :drum_heavy_kick
    sleep 0.3
    sample :drum_snare_soft
    sleep 0.2
  end
end

live_loop :melody do
  with_fx :ring_mod, freq: 2 do
    play (ring :c2, :e3, :f4).tick
    sleep 0.2
    play scale(:c3, :dorian).tick
    sleep 0.2
    sync :drum
  end
end


##| ##| live_loop :melody do
##|   with_fx :ring_mod, freq: 2 do
##|     duration = sample_duration :ambi_dark_woosh
##|     sample :ambi_dark_woosh5
##|     sleep duration / 2
##|   end
##| end

##| live_loop :sample do
##|   with_fx :ring_mod, freq: 2 do
##|     if i % 4 == 0
##|       duration = sample_duration :ambi_dark_woosh, pitch: 2

##|       sample :ambi_dark_woosh
##|       sleep duration / 2
##|     end
##|   end