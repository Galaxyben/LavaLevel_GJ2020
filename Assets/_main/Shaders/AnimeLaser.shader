// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,cmtg:SF,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,acwp:False,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-9377-OUT,alpha-9715-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32160,y:32756,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Slider,id:8420,x:30587,y:32751,ptovrint:False,ptlb:width,ptin:_width,varname:node_9440,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Subtract,id:772,x:30929,y:32691,varname:node_772,prsc:2|A-559-OUT,B-8420-OUT;n:type:ShaderForge.SFN_TexCoord,id:2777,x:30154,y:32413,varname:node_2777,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7656,x:30929,y:32837,varname:node_7656,prsc:2|A-559-OUT,B-8420-OUT;n:type:ShaderForge.SFN_If,id:4556,x:31219,y:32687,varname:node_4556,prsc:2|A-3776-OUT,B-772-OUT,GT-8337-OUT,EQ-8337-OUT,LT-6805-OUT;n:type:ShaderForge.SFN_Vector1,id:6805,x:30929,y:32989,varname:node_6805,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:8337,x:30929,y:33047,varname:node_8337,prsc:2,v1:1;n:type:ShaderForge.SFN_If,id:4096,x:31219,y:32836,varname:node_4096,prsc:2|A-3776-OUT,B-7656-OUT,GT-6805-OUT,EQ-8337-OUT,LT-8337-OUT;n:type:ShaderForge.SFN_Multiply,id:172,x:31405,y:32766,varname:node_172,prsc:2|A-4556-OUT,B-4096-OUT;n:type:ShaderForge.SFN_Tex2d,id:6398,x:30544,y:32428,ptovrint:False,ptlb:noiseTexA,ptin:_noiseTexA,varname:node_4690,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b5ab974462fa8ac41a4d31b230528d98,ntxv:0,isnm:False|UVIN-6375-UVOUT;n:type:ShaderForge.SFN_Add,id:7271,x:30766,y:32528,varname:node_7271,prsc:2|A-5324-OUT,B-2777-UVOUT;n:type:ShaderForge.SFN_Time,id:2765,x:30154,y:32571,varname:node_2765,prsc:2;n:type:ShaderForge.SFN_Panner,id:6375,x:30352,y:32428,varname:node_6375,prsc:2,spu:-1,spv:0.5|UVIN-2777-UVOUT,DIST-1658-OUT;n:type:ShaderForge.SFN_Slider,id:507,x:29997,y:32710,ptovrint:False,ptlb:pannSpeedA,ptin:_pannSpeedA,varname:node_7931,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.5,max:5;n:type:ShaderForge.SFN_Multiply,id:1658,x:30352,y:32589,varname:node_1658,prsc:2|A-2765-T,B-507-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3776,x:30929,y:32528,varname:node_3776,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-7271-OUT;n:type:ShaderForge.SFN_Slider,id:559,x:30587,y:32841,ptovrint:False,ptlb:offset,ptin:_offset,varname:node_4333,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Tex2d,id:3336,x:30544,y:32250,ptovrint:False,ptlb:noiseTexB,ptin:_noiseTexB,varname:node_6421,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7769-UVOUT;n:type:ShaderForge.SFN_Slider,id:2277,x:29981,y:32316,ptovrint:False,ptlb:pnnSpeedB,ptin:_pnnSpeedB,varname:node_3126,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:5;n:type:ShaderForge.SFN_Time,id:6932,x:30138,y:32162,varname:node_6932,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6730,x:30352,y:32118,varname:node_6730,prsc:2|A-6932-T,B-2277-OUT;n:type:ShaderForge.SFN_Panner,id:7769,x:30352,y:32250,varname:node_7769,prsc:2,spu:1,spv:2|UVIN-2777-UVOUT,DIST-6730-OUT;n:type:ShaderForge.SFN_Multiply,id:6404,x:30766,y:32370,varname:node_6404,prsc:2|A-3336-RGB,B-6398-RGB;n:type:ShaderForge.SFN_RemapRange,id:5324,x:30929,y:32370,varname:node_5324,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.5|IN-6404-OUT;n:type:ShaderForge.SFN_Set,id:1608,x:31566,y:32766,varname:mask,prsc:2|IN-172-OUT;n:type:ShaderForge.SFN_Multiply,id:9377,x:32410,y:32812,varname:node_9377,prsc:2|A-7241-RGB,B-272-OUT;n:type:ShaderForge.SFN_Slider,id:272,x:32003,y:32923,ptovrint:False,ptlb:glowPower,ptin:_glowPower,varname:node_272,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:10;n:type:ShaderForge.SFN_Get,id:9715,x:32389,y:32977,varname:node_9715,prsc:2|IN-1608-OUT;proporder:7241-272-8420-6398-507-559-3336-2277;pass:END;sub:END;*/

Shader "Retus001/AnimeLaser" {
    Properties {
        _Color ("Color", Color) = (0,0,0,1)
        _glowPower ("glowPower", Range(1, 10)) = 1
        _width ("width", Range(0, 1)) = 0.1
        _noiseTexA ("noiseTexA", 2D) = "white" {}
        _pannSpeedA ("pannSpeedA", Range(0, 5)) = 1.5
        _offset ("offset", Range(0, 1)) = 0.5
        _noiseTexB ("noiseTexB", 2D) = "white" {}
        _pnnSpeedB ("pnnSpeedB", Range(0, 5)) = 0.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CustomTag"="SF"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #if !UNITY_PASS_FORWARDBASE
            #define UNITY_PASS_FORWARDBASE
            #endif
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _width;
            uniform sampler2D _noiseTexA; uniform float4 _noiseTexA_ST;
            uniform float _pannSpeedA;
            uniform float _offset;
            uniform sampler2D _noiseTexB; uniform float4 _noiseTexB_ST;
            uniform float _pnnSpeedB;
            uniform float _glowPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float3 emissive = (_Color.rgb*_glowPower);
                float3 finalColor = emissive;
                float4 node_6932 = _Time;
                float2 node_7769 = (i.uv0+(node_6932.g*_pnnSpeedB)*float2(1,2));
                float4 _noiseTexB_var = tex2D(_noiseTexB,TRANSFORM_TEX(node_7769, _noiseTexB));
                float4 node_2765 = _Time;
                float2 node_6375 = (i.uv0+(node_2765.g*_pannSpeedA)*float2(-1,0.5));
                float4 _noiseTexA_var = tex2D(_noiseTexA,TRANSFORM_TEX(node_6375, _noiseTexA));
                float node_3776 = (((_noiseTexB_var.rgb*_noiseTexA_var.rgb)*0.5+0.0)+float3(i.uv0,0.0)).r;
                float node_4556_if_leA = step(node_3776,(_offset-_width));
                float node_4556_if_leB = step((_offset-_width),node_3776);
                float node_6805 = 0.0;
                float node_8337 = 1.0;
                float node_4096_if_leA = step(node_3776,(_offset+_width));
                float node_4096_if_leB = step((_offset+_width),node_3776);
                float mask = (lerp((node_4556_if_leA*node_6805)+(node_4556_if_leB*node_8337),node_8337,node_4556_if_leA*node_4556_if_leB)*lerp((node_4096_if_leA*node_8337)+(node_4096_if_leB*node_6805),node_8337,node_4096_if_leA*node_4096_if_leB));
                return fixed4(finalColor,mask);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
