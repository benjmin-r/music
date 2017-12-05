use_synth :tb303

with_fx :reverb, room: 0.8 do

  define :wowowow do
    with_fx :gverb, phase: 0.25, amp: 0.4 do
      amp = (line 1, 0.3, steps: 3).tick
      co = (line 70, 50, steps: 3).tick
      play :e3, cutoff: co, release: 4, attack: 0.5, cutoff_attack: 2, cutoff_release: 4, amp: amp
      sleep 4
    end
  end

  in_thread do
    3.times do
      wowowow
    end
  end

  48.times do
    amp = (line 0.2, 0, steps: 48).tick
    play scale(:e3, :major).choose, release: 0.25, cutoff: rrand(50, 100), res: 0.9, wave: 1, amp: amp
    sleep 0.25
  end
end

