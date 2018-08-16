# @title I_vi_IV_V_I
# @composer Johnny Gossick

# Procedure:
# Slowly morph through I-vi-IV-V-I
# chord progression in a chosen key.
# Should take ~ 4 - 5 minutes.

# Edit these throughout the
# performance:

bpm = 100
bpm1 = bpm * 1 / 1
bpm2 = bpm * 3 / 5
bpm3 = bpm * 2 / 1
note1 = :C4
note2 = :E4
note3 = :G4

# Loop 1
live_loop :loop1 do
  use_bpm bpm1
  midi_note_on note1
  midi_note_off note1
  sleep 1
end

# Loop 2
live_loop :loop2 do
  use_bpm bpm2
  midi_note_on note2
  midi_note_off note2
  sleep 1
end

# Loop 3
live_loop :loop3 do
  use_bpm bpm3
  midi_note_on note3
  midi_note_off note3
  sleep 1
end