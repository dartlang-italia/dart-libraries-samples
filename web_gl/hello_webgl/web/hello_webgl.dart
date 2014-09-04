import 'dart:html';
import 'dart:typed_data';
import 'dart:web_gl' as webgl;
// TODO: add comments
void main() {
  CanvasElement canvas = querySelector('#mycanvas');
  webgl.RenderingContext gl = canvas.getContext('experimental-webgl');

  gl.viewport(0, 0, canvas.width, canvas.height);
  gl.clearColor(0, 0.5, 0, 1);
  gl.clear(webgl.COLOR_BUFFER_BIT);

  // Vertex
  String vertex = """

    attribute vec2 aVertexPosition;
    
    void main() {
        gl_Position = vec4(aVertexPosition, 0.0, 1.0);
    }           

""";

  // Fragment
  String fragment = """

    #ifdef GL_ES
    precision highp float;
    #endif
    
    uniform vec4 uColor;
    
    void main() {
        gl_FragColor = uColor;
    }

""";

  webgl.Shader vertexShader = gl.createShader(webgl.VERTEX_SHADER);
  gl.shaderSource(vertexShader, vertex);
  gl.compileShader(vertexShader);

  webgl.Shader fragmentShader = gl.createShader(webgl.FRAGMENT_SHADER);
  gl.shaderSource(fragmentShader, fragment);
  gl.compileShader(fragmentShader);

  webgl.Program program = gl.createProgram();
  gl.attachShader(program, vertexShader);
  gl.attachShader(program, fragmentShader);
  gl.linkProgram(program);

  if (!gl.getShaderParameter(vertexShader, webgl.COMPILE_STATUS))
      print(gl.getShaderInfoLog(vertexShader));

  if (!gl.getShaderParameter(fragmentShader, webgl.COMPILE_STATUS))
      print(gl.getShaderInfoLog(fragmentShader));

  if (!gl.getProgramParameter(program, webgl.LINK_STATUS))
      print(gl.getProgramInfoLog(program));

  double aspect = canvas.width / canvas.height;

  var vertices = new Float32List.fromList([
        -0.5, 0.5 * aspect, 0.5, 0.5 * aspect, 0.5, -0.5 * aspect,
        -0.5, 0.5 * aspect, 0.5, -0.5 * aspect, -0.5, -0.5 * aspect]);

  webgl.Buffer vbuffer = gl.createBuffer();
  gl.bindBuffer(webgl.ARRAY_BUFFER, vbuffer);
  gl.bufferData(webgl.ARRAY_BUFFER, vertices, webgl.STATIC_DRAW);

  int itemSize = 2;
  int numItems = vertices.length ~/ itemSize;

  gl.useProgram(program);

  webgl.UniformLocation uColor = gl.getUniformLocation(program, 'uColor');

  gl.uniform4fv(uColor, new Float32List.fromList([0.0, 1.0, 0.0, 1.0]));

  int aVertexPosition = gl.getAttribLocation(program, 'aVertexPosition');

  gl.enableVertexAttribArray(aVertexPosition);

  gl.vertexAttribPointer(aVertexPosition, itemSize, webgl.FLOAT, false, 0, 0);

  gl.drawArrays(webgl.TRIANGLES, 0, numItems);

}
