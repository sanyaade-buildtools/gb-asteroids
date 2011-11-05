-- pick a random texture

function start ()
   local textures = {'small asteroid 1',
                     'small asteroid 2',
                     'small asteroid 3'}

   -- pick a random texture and use it
   sprite.set_texture(textures[random.rand(1,#textures)])
end

function collide (actor)
   if actor.has_tag('bullet') then
      local x,y=transform.position()
      game.scoring.add_points(250)
      layer.spawn('explosion').transform.set_position(x,y)
      layer.spawn('pellet').transform.set_position(x,y)
      self.destroy()
   end
end