define :beat1 do
  sample :drum_bass_hard
  sleep 1
  sample :drum_bass_hard
  sleep 0.25
  sample :bd_boom, amp: 8, attack: 2
  sleep 0.75
  sample :drum_bass_hard
  sleep 0.75
  sample :bd_boom, attack: 2, amp: 6
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard
  sample :drum_bass_hard, lpf: rrand(80, 131)
  sleep 1
end

define :m1 do
  use_synth :chipbass
  play :a1, release: 4, cutoff: rrand(70, 130), pitch: rrand(-6, 6)
  use_synth :hollow
  play :c, release: 4, pitch: rrand(1, 12)
  sleep 2
  use_synth :dark_ambience
  play :c2, release: 2, amp: rrand(1, 6)
  sleep 2
end

define :bass1 do
  play_chord [15, 20, 35], sustain: 2, release: 4, amp: 6
  sleep 4
end

live_loop :beat1 do
  use_bpm 80
  beat1
end

live_loop :m1  do
  sync :beat1
  m1
end

live_loop :bass1 do
  sync :beat1
  bass1
end
