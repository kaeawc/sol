define [], () ->
  class Orbit
    constructor: (@telemetry, debug) ->
      time = 0
      pts = []
      limit = @telemetry.period
      parts = @telemetry.eccentricity > .20 ? 300 : 100   # extra precision for high eccentricity
      delta = Math.ceil(limit / parts)
      prev = false
      for i of parts
        pos = @positionAt time
        vector = new THREE.Vector3(pos[0], pos[1], pos[2])
        prev = vector
        pts.push(vector)
        time = time + delta

      points = new THREE.Geometry()
      points.vertices = pts
      points.computeLineDistances() # required for dotted lines

      @path = new THREE.Line(points,
        new THREE.LineDashedMaterial({
          color: 0x0088FF,
          linewidth: 1,
          dashSize: 1,
          gapSize: 0.5
        }), THREE.LineStrip)


      @eccentricity = @telemetry.eccentricity
      @sqrtOfe = Math.sqrt((1 + @eccentricity)/(1 - @eccentricity))
      @semi_major_axis = @telemetry.semi_major_axis
      @i = @telemetry.i * Math.PI / 180
      @o = @telemetry.om * Math.PI / 180
      @p = (@telemetry.w_bar || @telemetry.w + @telemetry.om) * Math.PI / 180 #semi-latus rectum
      @mean_anomaly = @telemetry.mean_anomaly
      @cosOfo = Math.cos @o
      @cosOfi = Math.cos @i
      @sinOfo = Math.sin @o
      @sinOfi = Math.sin @i
      @pMinuso = @p - @o

      @mean_anomaly = @mean_anomaly * Math.PI / 180
      @n = 0
      if (@telemetry.n)
        @n = @telemetry.n * Math.PI / 180
      else
        @n = 2 * Math.PI / @telemetry.period

      @coefficient = @semi_major_axis * (1 - Math.pow(@eccentricity,2))
      @start = @telemetry.epoch

    positionAt: (now, debug) ->
      relative = now - @start
      current_mean_anomaly = @mean_anomaly + @n * relative

      # E0 = 
      # lastdiff = 0
      # diffing = 0

      # while true
      #   E1 = current_mean_anomaly + @eccentricity * Math.sin E0
      #   lastdiff = Math.abs E1-E0
      #   E0 = E1
      #   if lastdiff < 0.0000001 || diffing > 5
      #     break
      #   diffing++

      ratio = Math.tan(current_mean_anomaly / 2)
      true_anomaly = 2 * Math.atan(@sqrtOfe * ratio)

      radius = @coefficient / (1 + @eccentricity * Math.cos(true_anomaly)) * PIXELS_PER_AU

      X = radius * (@cosOfo * Math.cos(true_anomaly + @pMinuso) - @sinOfo * Math.sin(true_anomaly + @pMinuso) * @cosOfi)
      Y = radius * (@sinOfo * Math.cos(true_anomaly + @pMinuso) + @cosOfo * Math.sin(true_anomaly + @pMinuso) * @cosOfi)
      Z = radius * (Math.sin(true_anomaly + @pMinuso) * @sinOfi)
      [X, Y, Z]

  Orbit