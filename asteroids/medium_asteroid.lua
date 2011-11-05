-- pick a random texture

function start ()
   local textures = {'medium asteroid 1',
                     'medium asteroid 2'}

   -- pick a random texture and use it
   sprite.set_texture(textures[random.rand(1,#textures)])
end

function collide (actor)
   if actor.has_tag('bullet') then
      local x,y=transform.position()

      for i=1,3,1 do
         layer.spawn('small asteroid').transform.set_position(x,y)
      end

      -- add some points and blow us up
      game.scoring.add_points(150)
      self.destroy()
   end
end