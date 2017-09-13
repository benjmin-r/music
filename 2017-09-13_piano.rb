live_loop :md, sync: :bass do
  use_synth :piano
  play_chord [:g, :d]
  play :e, release: 1
  sleep 1

  play :e
  sleep 0.25
  play :a
  sleep 0.25
  play :a
  sleep 0.25
  play_chord [:c, :g]
  sleep 0.25

  sleep 0.25
  play :c, release: 3
  sleep 0.75

  play :a
  sleep 0.25
  play :e
  sleep 0.25
  play :e
  sleep 0.25
  play :g
  sleep 0.25
end
