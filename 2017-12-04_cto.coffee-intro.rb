use_synth :tb303

with_fx :reverb, room: 0.8, amp: 1 do

  live_loop :wowowowow do
    with_fx :gverb, phase: 0.25, amp: 0.4 do
      co = (line 40, 70, steps: 8).tick
      play :e2, cutoff: co, release: 4, attack: 1, cutoff_attack: 4, cutoff_release: 2, amp: 0.2
      sleep 4
    end
  end

  live_loop :dingeling do
    play scale(:e1, :major).choose, release: 0.25, cutoff: rrand(50, 100), res: 0.9, wave: 1, amp: 0.2
    sleep 0.25
  end
end
