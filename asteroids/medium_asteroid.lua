-- pick a random texture

function start ()
   local textures = {'medium asteroid 1',
                     'medium asteroid 2'}

   -- pick a random texture and use it
   sprite.set_texture(textures[random.rand(1,#textures)])
end