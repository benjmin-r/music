use_bpm 40

use_synth :chipbass


live_loop :bass do

  notes = scale(:e1, :minor_pentatonic)
  n = notes.choose
  additional_notes = chord_degree :i, n, :minor_pentatonic

  play n, attack: 0.125, release: 2, amp: 0.5
  4.times do
    play additional_notes.tick, amp: 0.5
    sleep 0.125
  end

  sleep 2
end

live_loop :hihat do
  ##| play :d4, attack: 0.1, release: 0.1, amp: 0.25
  sample :drum_cymbal_closed, attack: 0.1, release: 0.1, amp: 0.5
  sleep 0.25
end


live_loop :kicks do
  with_fx :lpf, cutoff: 100 do
    sample :drum_bass_hard, amp: 1
    sleep 0.5
  end
end

live_loop :break do
  sync :bass

  2.times do
    2.times do
      sample :drum_heavy_kick
      sleep 0.25
    end

    2.times do
      sample :drum_heavy_kick
      sleep 0.125
    end
  end
end





