arrowedjs
=========

A RaphaelJS plugin that allows you to point to elements with style.

## Don't be like this girl:

![Arrowed Girl](http://img.photobucket.com/albums/v326/woddfellow2/arrowd.png)

Instead, use ArrowedJS to point to things in the coolest way possible: WITH ARROWS

Here's what you need to know:

## Requires:
  * RaphaelJS
  * jQuery/Zepto 

## Methods:
  * Arrowed.init([stage-options], [arrow-options-object]) => Set the stage.  
  * Arrowed.draw([selector-of-source], [selector-of-target], [options-object]) => Draw the arrow out.
  * Arrowed.clear() => Clears all of the arrows drawn on the paper/stage.  Just ``Paper.clear()``
  * Arrowed.remove() => Removes the paper/stage from the DOM.  Just ``Paper.remove()``

## What you can set in options:
### Arrowed.init stage-options:
  * A mix of [Raphael](http://raphaeljs.com/reference.html#Raphael) init things AND few custom things
  * debugger: true/false => Defaults to false and enables the console.logs & a stroke on the edge of the stage/paper

### Arrowed.init arrow-options:
  * [An object of arrow initializations](http://raphaeljs.com/reference.html#Element.attr)
  * The default will be...
  ```
  {
		stroke: 'rgb(57, 180, 213)' / blue
		'stroke-width': 6
		'stroke-linecap': 'round'
		'arrow-end': 'open-wide-midium'
  }
  ```

### Arrowed.draw options:
  * curveOutlier: {x:###, y:###} => tell the arrow where the outlier is
  * curveOutlierBend: [positive, negative] => this is ignored if an outlier is given.
  * sourceStart: [top, right, bottom, left, center] [right, left, center]
  * targetEnd: [top, right, bottom, left, center] [top, right, bottom, left, center]

## V1 does not:
  * erase allows individually.  You must wipe the one and only stage/paper.
  * animate...anything.
