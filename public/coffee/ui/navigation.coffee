define [], () ->
  window.setTimeout () ->
    $('div.navbar').addClass 'half-transparency'
    $('div.navbar').mouseenter () ->
      $('div.navbar').removeClass 'half-transparency'
    $('div.navbar').mousedown () ->
      $('div.navbar').removeClass 'half-transparency'
    $('div.navbar').mouseleave () ->
      $('div.navbar').addClass 'half-transparency'
  , 1000

  return