define :deep_bass do
  play_chord [15, 20, 35], sustain: 1, release: 1
  sleep 0.5
  sample :bd_boom
  sleep 0.25
  sample :bd_fat
  sleep 0.5
  sample :bd_fat
  sleep 0.25
  sample :bd_fat

  play_chord [15, 20, 25], sustain: 1, release: 2
  sleep 3
end

define :kick do
  with_fx :lpf, _slide: 0.8, _slide_shape: 3 do
    sample :drum_heavy_kick, rate: 0.75
  end
end

live_loop :bass do
  deep_bass
end

live_loop :backbeat, sync: :bass do
  sleep 0.5
  kick
  sleep 0.25
  kick
  sleep 0.5
  kick
  sleep 0.25
  kick
  sleep 3
end

