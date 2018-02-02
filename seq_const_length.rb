n = 0
pattern = Array.new
slpt = Array.new
while n < 6
  pattern[n] = scale(:g4, :chinese)[rrand_i(0,7)]
  qntz = rrand_i(1,2)
  slpt[n] = (1.0 / qntz).round(2)
  ##| puts(slpt[n])
  n += 1
end
patIter = 0
live_loop :test do
  with_bpm 90 do
    ##| i = rrand_i(0,7)
    ##| play scale(:c2, :ahirbhairav)[i], attack: 0.1, decay: 0.9
    ## midi_note_on scale(:c2, :minor_pentatonic)[i], rrand_i(0,40), port: "iac_driver_iac_bus_2", channel: 1
    if patIter < pattern.length
      midi_note_on pattern[patIter], rrand_i(0,40), port: "iac_driver_iac_bus_2", channel: 1
      sleep slpt[patIter]
      patIter += 1
    else
      patIter = 0
      sleep slpt[patIter]
    end
    ##| midi_pitch_bend rrand_i(100,127), port: "iac_driver_iac_bus_2"
    ##| puts slpt[patIter]
    ##| sleep slpt[patIter]
  end
end

live_loop :test2 do
  i = rrand_i(0,2) + tick
  ##| play scale(:c2, :ahirbhairav)[i], attack: 0.1, decay: 0.9
  midi_note_on scale(:c3, :minor_pentatonic)[i], rrand_i(0,40), port: "iac_driver_iac_bus_2", channel: 3
  midi_pitch_bend rrand_i(0,127), port: "iac_driver_iac_bus_2"
  sleep [0.5, 1, 0.25].choose
  ##| sync "/live_loop/test"
  sleep 100
end