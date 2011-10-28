
function update ()
   local x,y = transform.position()
   
   if x < -10 then x = x + display.WIDTH + 20 end
   if y < -10 then y = y + display.HEIGHT + 20 end
   if x > display.WIDTH + 10 then x = x - display.WIDTH - 20 end
   if y > display.HEIGHT + 10 then y = y - display.HEIGHT - 20 end

   transform.set_position(x,y)
end