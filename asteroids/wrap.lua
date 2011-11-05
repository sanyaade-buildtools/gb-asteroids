
function update ()
   local x,y = transform.position()
   
   if x < -15 then x = x + display.WIDTH + 30 end
   if y < -15 then y = y + display.HEIGHT + 30 end
   if x > display.WIDTH + 15 then x = x - display.WIDTH - 30 end
   if y > display.HEIGHT + 15 then y = y - display.HEIGHT - 30 end

   transform.set_position(x,y)
end