# Core Animation

* Is **the** animation framework for iOS and Mac. 
* Pretty much anytime we're animating, it's Core Animation doing the work.
* Core Animation does leverage metal. 

## Layers

* Every UIView is a thin wrapper around a `CALayer`.
* Layers contain all of the details about what the user should be seeing. Just visual.
* Every view has a one backing layer. But can contain many sub layers.
* CALayer is more light weight than a view.
* Layers can't be used with auto layout.
* Don't respond to device or user events.
* When we adjust a view's visual properties, it's really just adjusting its layer's properties.
view.frame = 
view.layer.frame = 

* a layer has properties that we can't modify directly through the view.
  - border
  - corner radius
  - shadow
  - apply 3d transformations.

* If you work directly with a layer, you get way more control.

* CALayers and Core Animation is 2D. 
* it's 2D objects in 3D space.

## Path

* 2.0
* (2.0, 1.0)
* [(), ()]

Paths are just points until we apply them to something visual like a view or a layer.

## Animations

* `UIView.animate` is using Core Animation.
* All animations are powered through Core Animation and layers.

* A layer will automatically animate any property changes implicitly.

### Side Bar

What is metal?

It's an Apple framework for writing really performant, low level graphics code. It was designed to replace OpenGLES.