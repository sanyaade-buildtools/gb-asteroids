-- health packet

function start ()
   local x = random.rand(0, display.WIDTH)
   local y = random.rand(0, display.HEIGHT)
   local dx = 50 * (random.uniform() - 0.5)
   local dy = 50 * (random.uniform() - 0.5)

   -- set it up on the screen randomly and push it
   transform.set_position(x,y)
   rigidbody.apply_impulse(dx, dy)
end

function advance ()
   local vx, vy = rigidbody.velocity()
   local x, y = transform.position()

   if vx > 0 and x > display.WIDTH then
      self.destroy()
   end

   if vy > 0 and y > display.HEIGHT then
      self.destroy()
   end

   if vx < 0 and x < 0 then
      self.destroy()
   end

   if vy < 0 and y < 0 then
      self.destroy()
   end
end