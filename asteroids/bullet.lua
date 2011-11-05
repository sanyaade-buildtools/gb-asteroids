-- example bullet

function start ()
   timeout = clock.time() + 1
end

function update ()
   if clock.time() > timeout then
      self.destroy()
   end
end

function collide (actor)
   if actor.has_tag('asteroid') then
      self.destroy()
      audio.play('boom')
   end
end