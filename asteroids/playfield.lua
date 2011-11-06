-- example scene

function start ()
   project.load_assets('main game', true)
   --project.load_assets = 10

   -- create the main layers
   scene.add_layer('stars',0).set_backdrop('backdrop')

   asteroids = scene.add_layer('asteroids',1)
   action = scene.add_layer('player',2)

   -- save the current camera, modify it
   camera.push()

   -- add the player
   player = action.spawn('player')

   -- add some asteroids
   for i=1,3,1 do
      asteroids.spawn('large asteroid')
   end
end

function leave ()
   project.unload_assets('main game')
end

function advance ()
   if input.key_pressed(input.KEY_ESCAPE) then
      engine.quit()
   end
end