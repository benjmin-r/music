##| use_midi_defaults port: 'usb_midi_interface', channel: 1


##| live_loop :volca_keys_via_midi_keyboard do
##|   # directly pass the midi input from the keyboard to the volca keys
##|   use_real_time
##|   note, velocity = sync "/midi/vmini_out/0/1/note_on"
##|   midi note, vel: velocity, port: 'usb_midi_interface', channel: 1
##| end


def kn(knob_cc)
  case knob_cc
  when 14 then :knob1
  when 15 then :knob2
  when 16 then :knob3
  when 17 then :knob4
  end
end

def kn1(max_value: 10)
  (get(:knob1) || 1) * max_value / 127
end

def kn2(max_value: 10)
  (get(:knob2) || 1) * max_value / 127
end

def kn3(max_value: 10)
  (get(:knob3) || 1) * max_value / 127
end

def kn4(max_value: 10)
  (get(:knob4) || 1) * max_value / 127
end

def bpm(value)
  set :bpm, value
  use_bpm value
end


live_loop :midi_clock do
  bpm 80
  midi_clock_beat port: 'usb_midi_interface', channel: 1
  sleep 1
end

live_loop :midi_piano do
  # use midi input from the keyboard for controlling a synth in Sonic Pi
  use_real_time
  note, velocity = sync "/midi/vmini_out/0/1/note_on"
  s = synth :piano, note: note, release: kn1
end

live_loop :midi_knobs do
  use_real_time
  knob_num, value = sync "/midi/vmini_out/0/1/control_change"
  set kn(knob_num), value
end

live_loop :audio do
  with_fx :reverb, room: kn2(max_value: 1), damp: kn3(max_value: 1) do
    live_audio :mixer, input: 1, stereo: true
  end
  sleep 1
end
