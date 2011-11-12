-- example actor

function start ()
   transform.set_position(display.WIDTH / 2, display.HEIGHT / 2)

   -- start off with full energy
   regain_delay = 0
end

function collide (thing)
   if thing.has_tag('asteroid') then
      if not shields_up then
         controls.disable()
         sprite.play_anim('player explosion')
         audio.play('impact')
      end
   end

   if thing.has_tag('pellet') then
      thing.destroy()
      audio.play('pickup')
      game.scoring.add_points(100)
      energy = energy + 7
      if energy > 100 then
         energy = 100
      end
   end
end

function ui ()
   gui.set_color(1, 1, 1)
   gui.draw_string("Energy", 10, -20, "android")
   gui.set_color(0.2, 1, 0.2)
   gui.draw_rect(80, -5, energy, -10, true)
end