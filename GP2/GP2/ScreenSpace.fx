//the vertex shader will receive one vertex as input and will output exactly one vertex.
float4 VS( float4 Pos : POSITION ) : SV_POSITION
{
	return Pos;
}

// pixel shader transformed position of a pixel fragment, it can recieve additional values such as normals and the like
//and will output a float4 which represents the final colour of a pixel.
//the fucntion is tagged with the SC_Target this specifies that the return value of the pixel shader 
//will be used on the render target(back buffer).
float4 PS( float4 Pos : SV_POSITION ) : SV_Target
{
	return float4(1.0f, 1.0f, 0.0f, 1.0f); // Yellow with Alpha = 1
}

//These are compiled with the CompileShader function
//1st Parameter - Shader Version(LPCSTR) - This is the shader model that the shader should be compiled against.

//2nd Parameter - Entry Point(Function) - The function where our shader is implementedd.

//We specify a techique10(a Direct3D10 technique) called render, this enables us to retrieve technique and use it for our houst application(C++ side).
//the we have to pass called P0 again we should name this so we could retrieve the pass in the host application.
//Then in the body of the pass we would put render states for the pass and also set the various shaders that the pass will use.
technique10 Render
{
	pass P0
	{
		SetVertexShader(CompileShader(vs_4_0, VS()));
		SetGeometryShader( NULL );
		SetPixelShader( CompileShader(ps_4_0, PS()));
	}
}