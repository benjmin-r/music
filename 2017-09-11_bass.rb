live_loop :bass do
  with_fx :nlpf do
    sample :bd_boom, beat_stretch: 2
  end
  sleep 2
end

live_loop :bassline do
  #use_bpm 60
  #with_fx :lpf, _slide: 0.8, _slide_shape: 3 do
  #  sample :drum_heavy_kick, amp: 3
  #end
  #sleep 1
end

live_loop :breakline do
  #sample :loop_amen, rate: 1, beat_stretch: 2, amp: 0.6
  #sleep 2
end
