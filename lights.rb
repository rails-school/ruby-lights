require 'green_shoes'

Shoes.app {

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

  l0 = light(0, red)
  l1 = light(1, blue)
  l2 = light(2, green)

  l1.click do
    frames_per_second = 30
    animate 3 do |frame|
      frame = frame % 3
      l0.style(fill: green)
      l1.style(fill: green)
      l2.style(fill:green)
      if (frame == 0)
        l0.style(fill: red)
      elsif (frame == 1)
        l1.style(fill: red)
      else
        l2.style(fill: red)
      end
    end
  end

}