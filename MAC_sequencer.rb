# Welcome to Sonic Pi v2.11.1

def plus_time(startTime, time)
  endTime = startTime + time
  ##| maxDuration = sample_duration(sample)
  ##| puts(maxDuration)
  if endTime > 1
    endTime = 1
  end
  return endTime
end



HercSample = "/Users/atankovskiy/strakh.wav"


live_loop :sampleg_ytp do
  rndStart = rand(0..1)
  rndFinish = plus_time(rndStart, rand(0..0.1))
  rndRate = [-2,-1,0.5,1].choose
  rndPitch = rand(0.8..2)
  ##| j = i + 0.1
  sample HercSample, compress: 1, amp: 10, rate: rndRate, start: rndStart, finish: rndFinish, pitch: rndPitch
  sleep sample_duration HercSample, amp: 4, rate: rndRate, start: rndStart, finish: rndFinish, pitch: rndPitch
end