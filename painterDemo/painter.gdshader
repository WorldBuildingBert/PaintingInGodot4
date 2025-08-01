shader_type spatial;

uniform sampler2D paintTexture;

void fragment() {
	ALBEDO = mix(vec3(1.0,0.0,0.0), vec3(0.0,1.0,0.5), texture(paintTexture, UV).r);
}

