-- Manages an asteroid field

function start()
   print("field start")

   -- add some asteroids

   create_asteroid('small asteroid')
   create_asteroid('medium asteroid')
   create_asteroid('large asteroid')

end

function advance()
end

function create_asteroid(name)
  print(name)
  print(layer)
   ast = layer.spawn(name)
  ast.notify_death_cb = notify_dead
  return ast
end

function notify_dead(object)
   print("notfiy dead")

    local asteroid_types = {'small asteroid', 'medium asteroid', 'large asteroid'}

    -- pick a random texture and use it
    ast = create_asteroid(asteroid_types[random.rand(1, #asteroid_types)])
   ast.transform.set_position(-100, -100)
   ast.do_not_set_pos = true
end