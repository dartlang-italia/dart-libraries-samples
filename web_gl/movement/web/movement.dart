import 'dart:html';
import 'dart:web_gl' as web_gl;
import 'dart:typed_data';

void main() {
  // TODO: credits to http://learningwebgl.com/lessons/lesson03/index.html
  CanvasElement canvas = querySelector('#canvas');
  web_gl.RenderingContext gl = canvas.getContext('experimental-webgl');
  if (gl != null) {
    gl.viewport(0, 0, canvas.width, canvas.height);
  } else {
    print("WebGL not supported");
  }
  web_gl.Shader fragmentShader = getShader(gl, "#shader-fs");
  web_gl.Shader vertexShader = getShader(gl, "#shader-vs");

  web_gl.Program shaderProgram = gl.createProgram();

  gl.attachShader(shaderProgram, vertexShader);
  gl.attachShader(shaderProgram, fragmentShader);

  gl.linkProgram(shaderProgram);

  if (gl.getProgramParameter(shaderProgram, web_gl.LINK_STATUS) == null) {
    print("Could not initialize shaders");
  }

  gl.useProgram(shaderProgram);

  int aVertexPosition = gl.getAttribLocation(shaderProgram, "aVertexPosition");
  gl.enableVertexAttribArray(aVertexPosition);

  int aVertexColor = gl.getAttribLocation(shaderProgram, "aVertexColor");
  gl.enableVertexAttribArray(aVertexColor);

  web_gl.UniformLocation pMatrixUniform = gl.getUniformLocation(shaderProgram,
      "uPMatrix");
  web_gl.UniformLocation mvMatrixUniform = gl.getUniformLocation(shaderProgram,
      "uMVMatrix");

  web_gl.Buffer triangleVertexPositionBuffer = gl.createBuffer();
  gl.bindBuffer(web_gl.ARRAY_BUFFER, triangleVertexPositionBuffer);
  var vertices = [
     0.0,  1.0,  0.0,
    -1.0, -1.0,  0.0,
     1.0, -1.0,  0.0
     ];

  gl.bufferDataTyped(web_gl.ARRAY_BUFFER, new Float32List.fromList(vertices),
      web_gl.RenderingContext.STATIC_DRAW);

  // TODO: continue
}

web_gl.Shader getShader(web_gl.RenderingContext gl, String id) {
  ScriptElement shaderScript = querySelector(id);
  String str = "";
  Node k = shaderScript.firstChild;
  while (k != null) {
    if (k.nodeType == 3) {
      str += k.text;
    }
    k = k.nextNode;
  }

  web_gl.Shader shader;
  if (shaderScript.type == "x-shader/x-fragment") {
    shader = gl.createShader(web_gl.FRAGMENT_SHADER);
  } else if (shaderScript.type == "x-shader/x-vertex") {
    shader = gl.createShader(web_gl.VERTEX_SHADER);
  } else {
    return null;
  }

  gl.shaderSource(shader, str);
  gl.compileShader(shader);

  if (gl.getShaderParameter(shader, web_gl.COMPILE_STATUS) == null) {
    print(gl.getShaderInfoLog(shader));
    return null;
  }

  return shader;
}

