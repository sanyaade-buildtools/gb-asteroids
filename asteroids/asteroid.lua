-- asteroid script



function start ()
   local x = random.rand(0, display.WIDTH)
   local y = random.rand(0, display.HEIGHT)

   -- set the direction of travel
   local dx = 300 * (random.uniform() - 0.5)
   local dy = 300 * (random.uniform() - 0.5)
   
   -- position the sprite in the middle of the display
   if do_not_set_pos ~= true then
       transform.set_position(x, y)
   end

   -- star the asteroid in motion and another to spin it
   rigidbody.apply_impulse(dx, dy)
   rigidbody.apply_impulse(0, random.rand(-1, 1), 3, 0)
end

function leave ()
   print(msg)
   if notify_death_cb ~= nil then
    notify_death_cb(self)
  end

end

