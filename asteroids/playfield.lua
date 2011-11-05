-- example scene

function start ()
   project.load_assets('main game', true)
   --project.load_assets = 10

   -- create the main layers
   starfield = scene.add_layer('stars',0)
   asteroids = scene.add_layer('asteroids',1)
   action = scene.add_layer('player',2)

   -- save the current camera, modify it
   camera.push()

   -- add the starfield
   starfield.spawn('backdrop').transform.set_position(display.WIDTH / 2,
                                                      display.HEIGHT / 2)

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

   if input.key_down(input.KEY_A) then
      camera.scroll(-60 * clock.delta_time(), 0)
   end

   if input.key_down(input.KEY_D) then
      camera.scroll(60 * clock.delta_time(), 0)
   end

   if input.key_down(input.KEY_W) then
      camera.zoom(2)
   else
      camera.zoom(1)
   end
end