-- example scene

function start ()
   project.load_assets('main game', true)

   -- create the background layer
   scene.add_layer('stars').set_backdrop('backdrop')

   -- create the gameplay layers
   asteroids = scene.add_layer('asteroids')
   action = scene.add_layer('player')
   wave = scene.add_layer('wave')

   -- add the player
   player = action.spawn('player')

   -- spawn asteroids state
   state = spawn_asteroids
end

function leave ()
   project.unload_assets('main game')
end

function spawn_asteroids ()
   -- add some large asteroids
   for i=1,3,1 do
      asteroids.spawn('large asteroid')
   end

   -- level bonus points countdown timer
   bonus_timer = 60.0

   -- switch states
   state = play_game
end

function advance ()
   if input.key_pressed(input.KEY_ESCAPE) then
      engine.quit()
   end

   -- run the current state
   state()
end

function play_game ()
   if #asteroids.find_actors('asteroid') == 0 then
      state = add_bonus_points
   else
      -- count down the bonus timer
      bonus_timer = bonus_timer - clock.delta_time()

      if bonus_timer < 0 then
         bonus_timer = 0
      end
   end
end

function add_bonus_points ()
   local new_time = bonus_timer - clock.delta_time() * 10

   -- add some points for the extra time left over
   game.scoring.add_points((bonus_timer - new_time) * 1000)

   -- update the time left
   bonus_timer = new_time

   -- switch to the next state when no time is left
   if bonus_timer < 0 then
      bonus_timer = 0
      state = spawn_asteroids
   end
end

function ui ()
   local time_left = string.format("%.2f", bonus_timer)
   local score = string.format("%d", game.scoring.points)

   -- show how much time is left for bonus points
   gui.set_color(1, 1, 1)
   gui.draw_string("Time: " .. time_left, 370, -20, "android")

   -- show the player's current score
   gui.draw_string("Score: " .. score, 230, -20, "android")

   --gui.window(100, 100, 100, 100)
   foo=gui.checkbox(150,150,foo)
   test=gui.button(200,150,"welcome")
end