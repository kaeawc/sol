define [], () ->
  return [
    {
      name : 'Mercury'
      orbit : 
        mean_anomaly : 174.79252722
        epoch : 2451545.0
        semi_major_axis : 0.38709927
        eccentricity : 0.20563593
        i : 7.00497902
        w_bar : 77.45779628
        w : 29.12703035
        L : 252.25032350
        om : 48.33076593
        period : 87.969
      color : 0xAA9900
      diameter : 0.05
    },{
      name : 'Venus'
      orbit : 
        mean_anomaly : 50.37663232
        epoch : 2451545.0
        semi_major_axis : 0.72333566
        eccentricity : 0.00677672
        i : 3.39467605
        w_bar : 131.60246718
        w : 54.92262463
        L : 181.97909950
        om : 76.67984255
        period : 224.701
      color : 0x663300
      diameter : 0.1
    },{
      name : 'Earth'
      orbit : 
        mean_anomaly : -2.47311027
        epoch : 2451545.0
        semi_major_axis :1.00000261
        eccentricity : 0.01671123
        i : 0.00001531
        w_bar : 102.93768193
        w : 102.93768193
        L : 100.46457166
        om : 0
        period : 365.256
      color : 0x336699
      diameter : 0.1
    },{
      name : 'Mars'
      orbit : 
        mean_anomaly : 19.39019754
        epoch : 2451545.0
        semi_major_axis : 1.52371034
        eccentricity : 0.09339410
        i : 1.84969142
        w_bar : -23.94362959    # longitude of perihelion
        w : -73.5031685         # argument of perihelion
        L : -4.55343205         # mean longitude
        om : 49.55953891        # longitude of ascending node
        period : 686.980
      color : 'red'
      diameter : 0.1
    },{
      name : 'Jupiter'
      orbit :
        # 149597871
        semi_major_axis                : 5.20426657676164 #  778547200 #_km_(5.204267_au)   
        aphelion                       : 816520800  #_km_(5.458104_au)   5.45810441379878
        argument_of_perihelion         : 275.066 #°
        average_orbital_speed          : 13.07 #_km/s[3]
        axial_tilt                     : 3.13 #°[3]
        eccentricity                   : 0.04838624
        eccentricity                   : 0.048775
        epoch                          : 2451545.0
        equatorial_radius              : 71492
        equatorial_rotation_velocity   : 12.6 #_km/s
        equatorial_surface_gravity     : 24.79 #_m/s2[3][b]
        escape_velocity                : 59.5  #_km/s[3][b]
        flattening                     : 0.06487
        i                              : 1.30439695
        L                              : 34.39644051
        longitude_of_ascending_node    : 100.492 #
        mean_anomaly                   : 19.66796068
        mass                           : 1.8986*1027 #_kg[3]
        mean_density                   : 1.326 #_g/cm3[3][b]
        mean_radius                    : 69911 #km
        north_pole_declination         : 64.496 #°
        north_pole_right_ascension     : 268.057 #°
        om                             : 100.47390909
        orbital_period                 : 4332.59 #_days
        perihelion                     : 740573600  #_km_(4.950429_au)  4.95042873972451
        period                         : 4332.589
        polar_radius                   : 66854
        satellites                     : 67
        sidereal_rotation_period       : 9.925 #_h[9]_(9_h_55_m_30_s)
        surface_area                   : 6.1419*1010 #_km2[b][7]
        synodic_period                 : 398.88 #_days[3]
        volume                         : 1.4313*1015 #_km3[3][b]
        w                              : -85.74542926
        w_bar                          : 50.72847983
        inclination :
          ecliptic : 1.305
          suns_equator : 6.09
          invariable_plane : 0.32
        apparent_magnitude :
          min: -1.6
          max: -2.94
        composition :
          h2 : 89.8
          he : 10.2
          ch4 : 0.3
          nh3 : 0.026
          hd : 0.003
          c2h6 : 0.0006
          h2o : 0.0004
      color : 'orange'
      diameter : 0.5
    }
  ]