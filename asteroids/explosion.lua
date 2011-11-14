-- explosion effect

function start ()
   shockwave.start()
   bits.start()
end

function advance ()
   if not shockwave.is_running() and not bits.is_running() then
      self.destroy()
   end
end
