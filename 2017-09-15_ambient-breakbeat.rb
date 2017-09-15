
live_loop :b3 do
  ##| sync :b1
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5
end


live_loop :b1 do
  sample :drum_tom_lo_soft
  sample :bd_boom
  sleep 0.25
  sample :bd_fat, amp: 2
  sleep 0.5
  sample :bd_tek
  sleep 0.5
  sample :bd_klub
  sleep 0.25
  sample :bd_tek
  sleep 0.5
end

live_loop :b2 do
  sync :b1
  sample :ambi_glass_hum, release: 6, attack: 3, rate: 0.5, cutoff: rrand(60, 120), pitch: rrand(-1, 1)
  sleep sample_duration(:ambi_glass_hum)
end

live_loop :b4 do
  sync :b1
  sample :ambi_dark_woosh, amp: 1, release: 6, rate: 0.5
  sleep sample_duration :ambi_soft_buzz
end


