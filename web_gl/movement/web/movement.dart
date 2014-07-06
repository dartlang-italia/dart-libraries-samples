import 'dart:html';
import 'dart:web_gl' as web_gl;

void main() {
  // TODO: credits to http://learningwebgl.com/lessons/lesson03/index.html
  CanvasElement canvas = querySelector('#canvas');
  web_gl.RenderingContext gl = canvas.getContext('experimental-webgl');
  if (gl != null) {
    gl.viewport(0, 0, canvas.width, canvas.height);
  } else {
    print("WebGL not supported");
  }
  getShader(gl, "#shader-fs");
  // TODO: complete
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

