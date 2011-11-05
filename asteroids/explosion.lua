-- explosion effect

function start ()
   emitter.start()
end

function advance ()
   if not emitter.is_running() then
      self.destroy()
   end
end
