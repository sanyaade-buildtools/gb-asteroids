-- example actor

function spend_energy (costPerSec)
   if energy < costPerSec * clock.delta_time() then
      return false
   end

   -- expend the energy and delay getting it back
   energy = energy - costPerSec * clock.delta_time()
   regain_delay = clock.time() + 0.5

   return true
end

function start ()
   transform.set_position(display.WIDTH / 2, display.HEIGHT / 2)

   -- start off with full energy
   energy = 100
   regain_delay = 0
end

function advance ()
   turn()
   shoot()
   defenses()
   thrust()

   -- get some energy back
   if clock.time() >= regain_delay then
      energy = energy + (50 * clock.delta_time())
      if energy > 100 then
         energy = 100
      end
   end
end

function turn ()
   if input.key_down(input.KEY_LEFT) then
      transform.rotate(clock.delta_time() * 180)
   end
   
   if input.key_down(input.KEY_RIGHT) then
      transform.rotate(clock.delta_time() * -180)
   end
end

function defenses ()
   shields_up = input.key_down(input.KEY_DOWN) and spend_energy(50)

   if shields_up then
      if not audio.is_playing(shields_sound) then
         shields_sound = audio.play('shields')
      end
   else
      audio.stop(shields_sound)
   end

   -- show the shields sprite if they are up
   shields.set_visible(shields_up)
end

function thrust ()
   thrusting = input.key_down(input.KEY_UP) and spend_energy(10)

   if thrusting then
      local x, y = transform.rotate_point(0, 100 * clock.delta_time())

      rigidbody.clamp_velocity(300)
      rigidbody.apply_impulse(x, y)
      sprite.set_frame('thrust')
      thrusters.start()

      if not audio.is_playing(thruster_sound) then
         thruster_sound = audio.play('thrusters')
      end
   else
      thrusters.stop()
      sprite.set_frame('no-thrust')
      audio.stop(thruster_sound)
   end
end

function shoot ()

   -- check for nova
   if input.key_pressed(input.KEY_P) then
      local asteroids = scene.layer('asteroids').actors()
    
      -- loop over all the asteroids
      for _,asteroid in ipairs(asteroids) do
         print(asteroid) -- TODO: asteroid.explode()
      end
   end

   -- check for bullets
   for i=1,input.key_hits(input.KEY_SPACE),1 do
      if not spend_energy(5 / clock.delta_time()) then
         return
      end

      -- spawn a new bullet
      local bullet = layer.spawn('bullet')
      local x, y = transform.position()
      local vx, vy = rigidbody.velocity()
      local px, py = transform.rotate_point(0, 20)
      local jx, jy = transform.rotate_point(0, 300)

      -- position slightly away from the ship, angle, and fire!
      bullet.transform.set_position(x + px, y + py)
      bullet.transform.set_angle(transform.angle())
      bullet.rigidbody.apply_impulse(vx + jx, vy + jy)

      -- play a sound
      audio.play('laser')
   end
end

function collide (thing)
   if thing.has_tag('asteroid') then
      if not shields_up then
         print('BOOM! - player died')
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
   gui.draw_string("Score: " .. game.scoring.points, 230, -20, "android")
   gui.draw_string("Time: " .. string.format("%.2f", clock.time()), 370, -20, "android")
   gui.set_color(0.2, 1, 0.2)
   gui.draw_rect(80, -5, energy, -10, true)
end