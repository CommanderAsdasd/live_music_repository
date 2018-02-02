live_loop :test do
  i = rrand_i(0,2) + tick
  ##| play scale(:c2, :ahirbhairav)[i], attack: 0.1, decay: 0.9
  midi_note_on scale(:c4, :minor)[i], rrand_i(0,127), port: "iac_driver_iac_bus_2"
  midi_pitch_bend rrand_i(0,127), port: "iac_driver_iac_bus_2"
  sleep choose([0.5, 1, 0.25])
end