###
  ArrowedJS
  Version 1.0
  Copyright (c) 2013 Abel Martin
  Licensed under the MIT license
###

window.ArrowJS =
  _paper: null
  _target: null
  _source: null

  _paper_element: 'body'
  _target_padding: 15

  _arrow_attrs:
    stroke: 'rgb(57, 180, 213)'
    'stroke-width': 6
    'stroke-linecap': 'round'
    'arrow-end': 'open-wide-midium'

  _debug_stroke: ->
    @_paper.rect(0, 0, 700, 400, 10).attr({stroke: "#f00"}) if @_paper?

  _center: ($element) ->
    offset = $element.offset()
    center = [
      offset.left + ($element.width() / 2)
      offset.top + ($element.height() / 2)
    ]

  _draw_arrow: (image_center_location, target_end_location) ->
    curve_outlier_location = [0, 220]

    arrow_path = [
      ['M'].concat(image_center_location)
      ['S'].concat(curve_outlier_location).concat(target_end_location)
    ]

    arrow = @_paper.path(arrow_path).attr( @_arrow_attrs )

  init: (stage_attrs, arrow_attrs) ->
    @_stage_attrs = stage_attrs
    @_arrow_attrs = arrow_attrs
    unless @_paper?
      @_paper = Raphael('how_it_works', 700, 400)
      $('svg', @$selector).attr(
        'style', 'overflow: hidden; position: absolute;'
      )

  clear: ->
    @_paper.clear()
    @_debug_stroke() if @_debug?

  remove: ->
    @_paper.remove()

  draw: (source_selector, target_selector, options) ->
    $source = $(source_selector)
    $target = $(target_selector)
    target_offset = $target.offset()
    target_location = [
      target_offset.left + @_target_padding
      target_offset.top - @_target_padding + $target.height()
    ]

    @_draw_arrow(@_center($source_selector), target_location)
