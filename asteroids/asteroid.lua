-- asteroid script

function start ()
   local dx = 300 * (random.uniform() - 0.5)
   local dy = 300 * (random.uniform() - 0.5)

   -- start the asteroid in motion and another to spin it
   rigidbody.apply_impulse(dx, dy)
   rigidbody.apply_impulse(0, random.rand(-1, 1), 3, 0)
end