-- example scene

function start ()
   project.load_assets('main game', true)

   -- create the main layers
   starfield = scene.add_layer('stars',0)
   asteroids = scene.add_layer('asteroids',1)
   layer = scene.add_layer('player',2)


   -- add the starfield
   starfield.spawn('backdrop').transform.set_position(display.WIDTH / 2,
                                                      display.HEIGHT / 2)

   -- add the player
   player = layer.spawn('player')


   -- Spawn asteroids field
   asteroids.spawn('asteroid field')

   -- add some asteroids
   -- asteroids.spawn('small asteroid')
   -- asteroids.spawn('medium asteroid')
   -- asteroids.spawn('large asteroid')
end

function leave ()
   project.unload_assets('main game')
end

function advance ()
   if input.key_pressed(input.KEY_ESCAPE) then
      engine.quit()
   end
end