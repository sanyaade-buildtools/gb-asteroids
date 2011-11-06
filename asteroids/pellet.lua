-- pellet

function start ()
   -- save a reference to the player
   player = scene.find_layer('player').find_actor('player')

   -- start the particle system
   emitter.start()
end

function advance ()
   local px,py = player.transform.position()
   local x,y = transform.position()
   local dx = px-x
   local dy = py-y
   local d = math.sqrt(dx*dx + dy*dy)
   
   dx = (dx * 100) / d
   dy = (dy * 100) / d

   -- slowly apply force towards the player
   rigidbody.clamp_velocity(150)
   rigidbody.apply_impulse(dx, dy)

   -- check to see if it's dead
   if not emitter.is_running() then
      self.destroy()
   end
end