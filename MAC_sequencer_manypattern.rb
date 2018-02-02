n = 0
pattern1 = pattern2 = Array.new
slpt1 = slpt2 = Array.new
while n < 10 #pattern size
  pattern1[n] = scale(:c5, :chinese, num_octaves: 4)[rrand_i(0,7)]
  pattern2[n] = scale(:c5, :chinese, num_octaves: 4)[rrand_i(0,7)]
  qntz1 = rrand_i(1,4) # rythm
  slpt1[n] = (1.0 / qntz1).round(4)
  slpt2[n] = (1.0 / qntz1).round(4)
  puts(slpt1[n])
  n += 1
end

patIter = 0

live_loop :mainmelody do
  with_bpm 90 do
    ##| i = rrand_i(0,7)
    ##| play scale(:c2, :ahirbhairav)[i], attack: 0.1, decay: 0.9
    ## midi_note_on scale(:c2, :minor_pentatonic)[i], rrand_i(0,40), port: "iac_driver_iac_bus_2", channel: 1
    if patIter < pattern1.length
      midi_note_on pattern1[patIter], rrand_i(0,2), port: "iac_driver_iac_bus_2", channel: 1
      ##| puts slpt[patIter]
      puts slpt1
      sleep slpt1[patIter]
      patIter += 1
    else
      puts "lol"
      puts slpt1[patIter]
      patIter = 0
      sleep slpt1[patIter]
    end
    midi_pitch_bend rrand_i(100,127), port: "iac_driver_iac_bus_2"
    ##| puts slpt[patIter]
    ##| sleep slpt[patIter]
  end
end

live_loop :additionalCV do
  i = rrand_i(0,2) + tick
  midi_local_control_on
  midi_note_on :c5, port: "iac_driver_iac_bus_2", channel: 3
  sleep [0.5, 1, 0.25].choose
  ##| sync "/live_loop/test"
  ##| sleep 100
end