# Welcome to Sonic Pi v2.11.1
live_loop :chords do
  i = rrand_i(0,2)
  play chord(:c2, '7+5-9')[i]
  ##| play scale(:c2, :blues_minor)[i]
  sleep 0.5
  i = rrand_i(0,2)
  play chord(:c4, '7+5-9')[i]
  sleep 0.5
  play chord(:e2, '7+5-9')[i]
  ##| play scale(:c2, :blues_minor)[i]
  sleep 0.5
end

