// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,cmtg:SF,iptp:1,cusa:True,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:True,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,acwp:False,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:True,atwp:True,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1873,x:33229,y:32719,varname:node_1873,prsc:2|emission-7591-OUT,alpha-603-OUT;n:type:ShaderForge.SFN_Tex2d,id:4805,x:32205,y:32724,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4158-OUT;n:type:ShaderForge.SFN_Multiply,id:1086,x:32466,y:32813,cmnt:RGB,varname:node_1086,prsc:2|A-4805-RGB,B-5983-RGB,C-5376-RGB;n:type:ShaderForge.SFN_Color,id:5983,x:32205,y:33093,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:5376,x:32205,y:33242,varname:node_5376,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1749,x:32679,y:32813,cmnt:Premultiply Alpha,varname:node_1749,prsc:2|A-1086-OUT,B-603-OUT;n:type:ShaderForge.SFN_Multiply,id:603,x:32466,y:32987,cmnt:A,varname:node_603,prsc:2|A-9697-A,B-5983-A,C-5376-A;n:type:ShaderForge.SFN_Add,id:7591,x:32872,y:32813,varname:node_7591,prsc:2|A-1749-OUT,B-6807-OUT;n:type:ShaderForge.SFN_Tex2d,id:2193,x:32544,y:32391,ptovrint:False,ptlb:EmissionTex,ptin:_EmissionTex,varname:node_2193,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-7055-OUT;n:type:ShaderForge.SFN_Color,id:260,x:32544,y:32571,ptovrint:False,ptlb:EmissionColor,ptin:_EmissionColor,varname:node_260,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6807,x:32722,y:32571,varname:node_6807,prsc:2|A-2193-RGB,B-260-RGB,C-5502-OUT;n:type:ShaderForge.SFN_Slider,id:5502,x:32387,y:32740,ptovrint:False,ptlb:EmissionPower,ptin:_EmissionPower,varname:node_5502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Time,id:2910,x:31099,y:32755,varname:node_2910,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3004,x:31302,y:32900,varname:node_3004,prsc:2|A-2910-TDB,B-4351-OUT;n:type:ShaderForge.SFN_Slider,id:4351,x:30942,y:32898,ptovrint:False,ptlb:PannSpeedY,ptin:_PannSpeedY,varname:node_4351,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-20,cur:0,max:20;n:type:ShaderForge.SFN_Slider,id:5723,x:30942,y:32539,ptovrint:False,ptlb:PannSpeedX,ptin:_PannSpeedX,varname:node_5723,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-20,cur:0,max:20;n:type:ShaderForge.SFN_TexCoord,id:4091,x:31099,y:32613,varname:node_4091,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1427,x:31302,y:32489,varname:node_1427,prsc:2|A-2910-TDB,B-5723-OUT;n:type:ShaderForge.SFN_Panner,id:2270,x:31302,y:32613,varname:node_2270,prsc:2,spu:1,spv:0|UVIN-4091-UVOUT,DIST-1427-OUT;n:type:ShaderForge.SFN_Panner,id:13,x:31302,y:32755,varname:node_13,prsc:2,spu:0,spv:1|UVIN-4091-UVOUT,DIST-3004-OUT;n:type:ShaderForge.SFN_Add,id:4616,x:31474,y:32680,varname:node_4616,prsc:2|A-2270-UVOUT,B-13-UVOUT;n:type:ShaderForge.SFN_Divide,id:5777,x:31638,y:32680,varname:node_5777,prsc:2|A-4616-OUT,B-2691-OUT;n:type:ShaderForge.SFN_Vector1,id:2691,x:31474,y:32799,varname:node_2691,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:9697,x:32205,y:32907,ptovrint:False,ptlb:OpacityMask,ptin:_OpacityMask,varname:node_9697,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Set,id:4774,x:31794,y:32680,varname:UVPann,prsc:2|IN-5777-OUT;n:type:ShaderForge.SFN_Get,id:4158,x:32021,y:32724,varname:node_4158,prsc:2|IN-4774-OUT;n:type:ShaderForge.SFN_Get,id:7055,x:32363,y:32391,varname:node_7055,prsc:2|IN-4774-OUT;proporder:4805-5983-4351-5723-9697-2193-260-5502;pass:END;sub:END;*/

Shader "Retus001/UIBorder" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _PannSpeedY ("PannSpeedY", Range(-20, 20)) = 0
        _PannSpeedX ("PannSpeedX", Range(-20, 20)) = 0
        _OpacityMask ("OpacityMask", 2D) = "white" {}
        _EmissionTex ("EmissionTex", 2D) = "black" {}
        _EmissionColor ("EmissionColor", Color) = (1,1,1,1)
        _EmissionPower ("EmissionPower", Range(0, 10)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
        [MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
        _Stencil ("Stencil ID", Float) = 0
        _StencilReadMask ("Stencil Read Mask", Float) = 255
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _StencilComp ("Stencil Comparison", Float) = 8
        _StencilOp ("Stencil Operation", Float) = 0
        _StencilOpFail ("Stencil Fail Operation", Float) = 0
        _StencilOpZFail ("Stencil Z-Fail Operation", Float) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CanUseSpriteAtlas"="True"
            "PreviewType"="Plane"
            "CustomTag"="SF"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            Stencil {
                Ref [_Stencil]
                ReadMask [_StencilReadMask]
                WriteMask [_StencilWriteMask]
                Comp [_StencilComp]
                Pass [_StencilOp]
                Fail [_StencilOpFail]
                ZFail [_StencilOpZFail]
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #if !UNITY_PASS_FORWARDBASE
            #define UNITY_PASS_FORWARDBASE
            #endif
            #pragma multi_compile _ PIXELSNAP_ON
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            uniform sampler2D _EmissionTex; uniform float4 _EmissionTex_ST;
            uniform float4 _EmissionColor;
            uniform float _EmissionPower;
            uniform float _PannSpeedY;
            uniform float _PannSpeedX;
            uniform sampler2D _OpacityMask; uniform float4 _OpacityMask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                #ifdef PIXELSNAP_ON
                    o.pos = UnityPixelSnap(o.pos);
                #endif
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_2910 = _Time;
                float2 UVPann = (((i.uv0+(node_2910.b*_PannSpeedX)*float2(1,0))+(i.uv0+(node_2910.b*_PannSpeedY)*float2(0,1)))/2.0);
                float2 node_4158 = UVPann;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_4158, _MainTex));
                float4 _OpacityMask_var = tex2D(_OpacityMask,TRANSFORM_TEX(i.uv0, _OpacityMask));
                float node_603 = (_OpacityMask_var.a*_Color.a*i.vertexColor.a); // A
                float2 node_7055 = UVPann;
                float4 _EmissionTex_var = tex2D(_EmissionTex,TRANSFORM_TEX(node_7055, _EmissionTex));
                float3 emissive = (((_MainTex_var.rgb*_Color.rgb*i.vertexColor.rgb)*node_603)+(_EmissionTex_var.rgb*_EmissionColor.rgb*_EmissionPower));
                float3 finalColor = emissive;
                return fixed4(finalColor,node_603);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
