# @title the_phases_of_you
# @composer Johnny Gossick

# Steve Reich inspired phase

use_bpm 180

base = 1
offset = base * 0.002

# Edit these throughout the performance
notes = (ring :A3, :F3, :G4, :E4, :F3, :D3, :B3, :C3, :A3)

# Slow Loop
live_loop :slow do
  midi_note_on notes.tick
  sleep base + offset
end

# Fast Loop
live_loop :fast do
  midi_note_on notes.tick
  sleep base - offset
end