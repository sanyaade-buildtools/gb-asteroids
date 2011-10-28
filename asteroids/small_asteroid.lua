-- pick a random texture

function start ()
   local textures = {'small asteroid 1',
                     'small asteroid 2',
                     'small asteroid 3'}

   -- pick a random texture and use it
   sprite.set_texture(textures[random.rand(1,#textures)])
end