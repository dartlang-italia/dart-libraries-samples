# dart:web_gl


The properties of a WebGL rendering context.
 *
If [alpha] is `true`, then the context has an alpha channel.
 *
If [antialias] is `true`, then antialiasing is performed by the browser, but
only if the browser's implementation of WebGL supports antialiasing.
 *
If [depth] is `true`, then the context has a depth buffer of at least 16
bits.
 *
If [premultipliedAlpha] is `true`, then the context's colors are assumed to
be premultiplied. This means that color values are assumed to have  been
multiplied by their alpha values. If [alpha] is `false`, then this flag is
ignored.
 *
If [preserveDrawingBuffer] is `false`, then all contents of the context are
cleared. If `true`, then all values will remain until changed or cleared.
 *
If [stencil] is `true`, then the context has a stencil buffer of at least 8
bits.
 
