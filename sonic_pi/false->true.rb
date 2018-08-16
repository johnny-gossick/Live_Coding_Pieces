# @title false->true
# @composer Johnny Gossick

use_bpm 80

#Harmonic and Melodic Content
r1 = (ring :C4, :G3, :A3, :E4, :D4, :G3)
r2 = (ring :E4, :E4, :C4, :E4, :G4)
r3 = (ring :A3, :G3, :D4, :C4)
r4 = (ring :E4, :E4, :C4, :E4, :G4)
r5 = (ring :C2, :D3, :E4)

#Variables used for wait times of layering
#in different loops.
wait1 = 16
wait2 = wait1 * 2

#False means the corresponding loop
#if off.
#True means the corresponding loop is on

#Turn all loops off to start
#Harmonic and Melodic patterns
l1 = false
l2 = false
l3 = false
l4 = false
l5 = false
l6 = false
l7 = false

#Rhythmic Patterns
d1 = false
d2 = false
d3 = false

#Send midi timecode to externcal devices
live_loop :clock do
  midi_clock_tick
  sleep 1
end

#The hiss off a vinyl record.
#This is constant throughout
live_loop :vinyl do
  with_fx :reverb do
    sample :vinyl_hiss, amp: 4, beat_stretch: 50
    sleep(50)
  end
end

#Harmonic and Melodic Patterns 1 - 7
live_loop :loop1 do
  if l1
    with_fx :reverb do
      use_synth :hollow
      sleep(rrand_i 4, 20)
      play (choose r2), release: 4
      sleep (rrand_i 4, 5)
      play (choose r3), release: 2
      sleep (rrand_i 2, 10)
      play (choose r2), release: 4
      sleep (rrand_i 4, 11)
      play (choose r2), release: 5
      sleep 5
      play (choose r2), release: 5
    end
  end
  sleep (rrand_i 5, 8)
end

live_loop :loop2 do
  if l2
    with_fx :lpf do
      use_synth :mod_tri
      sleep(rrand_i 4, 20)
      play r4[tick], amp: 0.5
      sleep (rrand_i 1, 4)
      play r4[tick], amp: 0.5
      sleep (rrand_i 1, 4)
      play r4[tick], amp: 0.5
      sleep (rrand_i 1, 3)
      play r4[tick], amp: 0.5
      sleep 1
      play r3[tick], amp: 0.5
    end
  end
  sleep (rrand_i 8, 12)
end

live_loop :loop3 do
  if l3
    with_fx :slicer do
      use_synth :square
      play (choose r1), amp: 0.25
    end
  end
  sleep rrand_i(2,8)
end

live_loop :loop4 do
  if l4
    use_synth :mod_sine
    play r1[tick]
    sleep (rrand_i 4, 15)
  end
  sleep 1
end

live_loop :loop5 do
  if l5
    with_fx :reverb do
      use_synth :mod_sine
      sleep (rrand_i 4, 16)
      play :D4
      sleep (rrand_i 3, 5)
      play :D4
      sleep 0.5
      play :D4
      sleep (rrand_i 0, 3)
      play :C4
      sleep 0.5
      play :D4
    end
  end
  sleep 1
end

live_loop :loop6 do
  with_fx :lpf do
    with_fx :reverb do
      if l6
        use_synth :pretty_bell
        play_pattern_timed r3.shuffle, 0.25, 1
        play_pattern_timed r2.shuffle, 0.25, 1
      end
      sleep(rrand_i 20,40)
    end
  end
end

live_loop :loop7 do
  with_fx :gverb do
    sleep(rrand_i 20,30)
    if l7
      use_synth :pnoise
      play 20, amp: 0.25
    end
  end
end


#Rhythmic patterns 1 - 3
live_loop :drums1 do
  if d1
    sample :tabla_ghe3, amp: 0.5
    sleep(rrand_i 0,5)
    
    sample :tabla_ghe2, amp: 0.5
  end
  sleep(rrand_i 1,5)
end

live_loop :drums2 do
  if d2
    with_fx :reverb do
      sample :tabla_dhec, amp: 0.5
      sleep(rrand_i 0,2)
      
      sample :tabla_ghe6, amp: 0.5
      
      sleep(rrand_i 0,2)
      
      sample :tabla_ghe3, amp: 0.5
      sleep(rrand_i 0,2)
      
      sample :tabla_ghe2, amp: 0.5
    end
  end
  sleep(rrand_i 1,2)
end

live_loop :drums3 do
  if d3
    with_fx :bitcrusher do
      sync :tick
      sample :drum_bass_soft
      sleep 1
      sample :drum_bass_soft
      sleep 0.25
      sample :drum_bass_soft
      sleep 0.25
      sample :drum_bass_soft
      sleep 0.50
      sample :drum_bass_soft
    end
  end
  sleep (rrand_i 10, 20)
end


#Layer in loops (somewhat) randomly
sleep rrand_i(wait1,wait2)
d1 = true
sleep rrand_i(wait1,wait2)
l1 = true
sleep rrand_i(wait1,wait2)
l2 = true
sleep rrand_i(wait1,wait2)
l3 = true
sleep rrand_i(wait1,wait2)
l4 = true
d2 = true
sleep rrand_i(wait1,wait2)
l5 = true
sleep rrand_i(wait1,wait2)
l6 = true
sleep rrand_i(wait1,wait2)
l7 = true
d3 = true
sleep rrand_i(wait1,wait2)
sleep rrand_i(wait1,wait2)

#End piece
l1 = false
l2 = false
l3 = false
l4 = false
l5 = false
l6 = false
l7 = false
d1 = false
d2 = false
d3 = false
