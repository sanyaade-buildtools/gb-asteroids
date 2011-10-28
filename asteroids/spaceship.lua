-- example actor

function start ()
   transform.set_position(display.WIDTH / 2, display.HEIGHT / 2)
end

function advance ()
   move()
   shoot()
end

function move ()
   if input.key_down(input.KEY_LEFT) then
      transform.rotate(clock.delta_time() * 180)
   end
   
   if input.key_down(input.KEY_RIGHT) then
      transform.rotate(clock.delta_time() * -180)
   end

   if input.key_down(input.KEY_UP) then
      local x, y = transform.rotate_point(0, 100 * clock.delta_time())
      rigidbody.apply_impulse(x, y)
   end
end

function shoot ()
   for i=1,input.key_hits(input.KEY_SPACE),1 do
      local bullet = layer.spawn('bullet')
      local x, y = transform.position()
      local vx, vy = rigidbody.velocity()
      local px, py = transform.rotate_point(0, 20)
      local jx, jy = transform.rotate_point(0, 300)

      -- position slightly away from the ship, angle, and fire!
      bullet.transform.set_position(x + px, y + py)
      bullet.transform.set_angle(transform.angle())
      bullet.rigidbody.apply_impulse(vx + jx, vy + jy)
   end
end