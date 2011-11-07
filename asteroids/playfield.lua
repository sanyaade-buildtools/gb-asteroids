-- example scene

function start ()
   project.load_assets('main game', true)

   -- create the background layer
   scene.add_layer('stars',0).set_backdrop('backdrop')

   -- create the gameplay layers
   asteroids = scene.add_layer('asteroids',1)
   action = scene.add_layer('player',2)

   -- add the player
   player = action.spawn('player')

   -- add some large asteroids
   for i=1,3,1 do
      asteroids.spawn('large asteroid')
   end

   -- start the health packet counter
   timer = clock.time() + 10
end

function leave ()
   project.unload_assets('main game')
end

function advance ()
   timer = timer - clock.delta_time()

   if input.key_pressed(input.KEY_ESCAPE) then
      engine.quit()
   end

   if timer < 0 then
      action.spawn('health')

      -- do another in 10 seconds
      timer = clock.time() + 10
   end
end