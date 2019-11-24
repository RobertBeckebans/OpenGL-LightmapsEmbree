// ------------------------------------------------------------------
// INPUTS -----------------------------------------------------------
// ------------------------------------------------------------------

layout(location = 0) in vec3 VS_IN_Position;
layout(location = 1) in vec2 VS_IN_UV;
layout(location = 2) in vec2 VS_IN_LightmapUV;
layout(location = 3) in vec3 VS_IN_Normal;
layout(location = 4) in vec3 VS_IN_Tangent;
layout(location = 5) in vec3 VS_IN_Bitangent;

// ------------------------------------------------------------------
// UNIFORMS ---------------------------------------------------------
// ------------------------------------------------------------------

layout(std140) uniform GlobalUniforms
{
    mat4 view_proj;
    mat4 light_view_proj;
    vec4 cam_pos;
};

uniform mat4 u_Model;
uniform int  u_CascadeIndex;

// ------------------------------------------------------------------
// MAIN -------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    gl_Position = light_view_proj * u_Model * vec4(VS_IN_Position, 1.0);
}

// ------------------------------------------------------------------