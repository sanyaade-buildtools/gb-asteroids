-- example actor

function advance ()
   turn()
   shoot()
   defenses()
   thrust()
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
   shields_up = input.key_down(input.KEY_DOWN) and scene.spend_energy(50)

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
   thrusting = input.key_down(input.KEY_UP) and scene.spend_energy(10)

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
   for i=1,input.key_hits(input.KEY_SPACE),1 do
      if not scene.spend_energy(5 / clock.delta_time()) then
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
