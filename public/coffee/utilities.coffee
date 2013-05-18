define () ->

  window.toJED = (d)->
    return Math.floor((d.getTime() / (1000 * 60 * 60 * 24)) - 0.5) + 2440588

  window.fromJED = (jed) ->
    return new Date(1000*60*60*24 * (0.5 - 2440588 + jed))

  window.getColorFromPercent = (value, highColor, lowColor) ->
      r = highColor >> 16
      g = highColor >> 8 & 0xFF
      b = highColor & 0xFF

      r += ((lowColor >> 16) - r) * value
      g += ((lowColor >> 8 & 0xFF) - g) * value
      b += ((lowColor & 0xFF) - b) * value

      return (r << 16 | g << 8 | b)