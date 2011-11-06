

function start ()
   local x = random.rand(0, display.WIDTH)
   local y = random.rand(0, display.HEIGHT)
   local textures = {'large asteroid 1',
                     'large asteroid 2',
                     'large asteroid 3'}

   -- pick a random texture and use it
   sprite.set_texture_frame('rocks',textures[random.rand(1,#textures)])
   
   -- position the sprite somewhere on the display
   transform.set_position(x, y)
end

function collide (actor)
   if actor.has_tag('bullet') then
      local x,y = transform.position()

      layer.spawn('explosion').transform.set_position(x,y)
      layer.spawn('pellet').transform.set_position(x,y)

      for i=1,3,1 do
         layer.spawn('medium asteroid').transform.set_position(x,y)
      end

      -- add some points and blow us up
      game.scoring.add_points(100)
      self.destroy()
   end
end