// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Retus001/RetroOverlay"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Mask("Mask", 2D) = "white" {}
		_Higlights("Higlights", Color) = (0.3972944,0.7354578,0.9056604,0)
		_Background("Background", Color) = (1,0.495283,0.495283,0)
		_OverlayA("Overlay A", 2D) = "white" {}
		_OverlayB("Overlay B", 2D) = "white" {}
		_OverlayC("Overlay C", 2D) = "white" {}
		_SpeedA("Speed A", Range( -5 , 5)) = 0
		_SpeedB("Speed B", Range( -5 , 5)) = 0
		_SpeedC("Speed C", Range( -5 , 5)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodirlightmap nofog 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Background;
		uniform float4 _Higlights;
		uniform sampler2D _OverlayA;
		uniform float _SpeedA;
		uniform sampler2D _OverlayB;
		uniform float _SpeedB;
		uniform sampler2D _OverlayC;
		uniform float _SpeedC;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float _Cutoff = 0.5;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float mulTime23 = _Time.y * 0.05;
			float2 temp_cast_0 = (_SpeedA).xx;
			float2 panner18 = ( mulTime23 * temp_cast_0 + i.uv_texcoord);
			float2 temp_cast_1 = (_SpeedB).xx;
			float2 panner19 = ( mulTime23 * temp_cast_1 + i.uv_texcoord);
			float2 temp_cast_2 = (_SpeedC).xx;
			float2 panner20 = ( mulTime23 * temp_cast_2 + i.uv_texcoord);
			float4 lerpResult7 = lerp( _Background , _Higlights , ( tex2D( _OverlayA, panner18 ).a + tex2D( _OverlayB, panner19 ).a + tex2D( _OverlayC, panner20 ).a ));
			o.Emission = lerpResult7.rgb;
			o.Alpha = 1;
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			clip( ( 1.0 - tex2D( _Mask, uv_Mask ) ).r - _Cutoff );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16100
204;92;1408;665;1462.053;659.1911;1.726679;True;True
Node;AmplifyShaderEditor.RangedFloatNode;29;-1999.805,-10.73607;Float;False;Property;_SpeedB;Speed B;8;0;Create;True;0;0;False;0;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-2001.817,66.68147;Float;False;Property;_SpeedC;Speed C;9;0;Create;True;0;0;False;0;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-1998.975,-85.13737;Float;False;Property;_SpeedA;Speed A;7;0;Create;True;0;0;False;0;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;22;-1958.757,-267.1191;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;23;-1898.434,-153.5061;Float;False;1;0;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;18;-1610.887,-261.0812;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;19;-1605.858,-86.14312;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;20;-1600.829,101.871;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;5;-1290.029,125.1885;Float;True;Property;_OverlayC;Overlay C;6;0;Create;True;0;0;False;0;173f7ef42e4701f409782bb296ae7131;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1290.03,-68.8532;Float;True;Property;_OverlayB;Overlay B;5;0;Create;True;0;0;False;0;76577e499c3442449987e6bc4f4a815d;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-1289.408,-260.0956;Float;True;Property;_OverlayA;Overlay A;4;0;Create;True;0;0;False;0;8a1fa414971114746b6d959038ff8242;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;10;-863.7057,-383.285;Float;False;Property;_Background;Background;3;0;Create;True;0;0;False;0;1,0.495283,0.495283,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;9;-865.123,-216.1545;Float;False;Property;_Higlights;Higlights;2;0;Create;True;0;0;False;0;0.3972944,0.7354578,0.9056604,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-653.7379,221.6014;Float;True;Property;_Mask;Mask;1;0;Create;True;0;0;False;0;4ca300e0be9545d4e980dbb8e51d3ddf;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;6;-872.2013,-30.61135;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;17;-259.8273,226.3458;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;7;-523.7762,-33.444;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;16;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Retus001/RetroOverlay;False;False;False;False;True;True;True;False;True;True;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;TransparentCutout;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;18;0;22;0
WireConnection;18;2;26;0
WireConnection;18;1;23;0
WireConnection;19;0;22;0
WireConnection;19;2;29;0
WireConnection;19;1;23;0
WireConnection;20;0;22;0
WireConnection;20;2;30;0
WireConnection;20;1;23;0
WireConnection;5;1;20;0
WireConnection;4;1;19;0
WireConnection;3;1;18;0
WireConnection;6;0;3;4
WireConnection;6;1;4;4
WireConnection;6;2;5;4
WireConnection;17;0;2;0
WireConnection;7;0;10;0
WireConnection;7;1;9;0
WireConnection;7;2;6;0
WireConnection;16;2;7;0
WireConnection;16;10;17;0
ASEEND*/
//CHKSM=BA96D72813DF1BC00C368E1839CF958C6C9EF250