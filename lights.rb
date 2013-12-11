require 'green_shoes'

Shoes.app {

  # creates a light at the given position with the given color
  def light(position, color)
    fill gray
    light = oval(left:10 + 90*position, top:10, radius:40)
    light.hover do
      puts "HOVER at #{position}"
      light.style(fill: color)
    end
    light.leave do
      puts "LEAVE at #{position}"
      light.style(fill: gray)
    end

    return light
  end

  def run_chase_animation(lights = [])
    frames_per_second = lights.length

    animate frames_per_second do |frame|
      light_idx = frame % frames_per_second

      # set all the lights to green
      lights.each{ |light| light.style(fill: green) }

      # set the light_idx light to red
      lights[light_idx].style(fill: red)
    end
  end

  lights = [light(0, fuchsia),
            light(1, blue),
            light(2, green)]

  lights[1].click do
    run_chase_animation(lights)
  end

}
