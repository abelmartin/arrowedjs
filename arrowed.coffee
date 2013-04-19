###
  ArrowedJS
  Version 1.0
  Copyright (c) 2013 Abel Martin
  Licensed under the MIT license
###

window.ArrowJS =
  _paper: null
  _paper_element: 'body'
  _target: null
  _source: null

  _arrow_attrs:
    stroke: 'rgb(57, 180, 213)'
    'stroke-width': 6
    'stroke-linecap': 'round'
    'arrow-end': 'open-wide-midium'

  _center: ($element) ->
    offset = $element.offset()
    center = [
      offset.left + ($element.width() / 2)
      offset.top + ($element.height() / 2)
    ]

  _debug_stroke: ->
    @_paper.rect(0, 0, 700, 400, 10).attr({stroke: "#f00"}) if @_paper?

  init: (stage_attrs, arrow_attrs) ->

  clear: ->
    @_paper.clear()
    @_debug_stroke() if @_debug?

  next: (step_number) ->
    $step_image = $('.step_image_' + step_number, @$selector)
    $step_image.show()
    if @_targets[step_number-1]?
      $target = $(@_targets[step_number-1])
      target_offset = $target.offset()
      target_padding = 15
      target_location = [
        target_offset.left + target_padding
        target_offset.top - target_padding + $target.height()
      ]
      @draw_arrow(@_center($step_image), target_location)

  draw_arrow: (image_center_location, target_end_location) ->
    curve_outlier_location = [0, 220]

    arrow_path = [
      ['M'].concat(image_center_location)
      ['S'].concat(curve_outlier_location).concat(target_end_location)
    ]

    arrow = @_paper.path(arrow_path).attr( @_arrow_attrs )

  start: (e) ->
    e.preventDefault() if e?

    @$selector.show()
    @current_step = 1

    unless @_paper?
      @_paper = Raphael('how_it_works', 700, 400)
      $('svg', @$selector).attr(
        'style', 'overflow: hidden; position: absolute;'
      )

    @next(1)
