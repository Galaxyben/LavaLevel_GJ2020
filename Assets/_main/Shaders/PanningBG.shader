// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:1,cusa:True,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:True,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:True,atwp:True,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1873,x:33229,y:32719,varname:node_1873,prsc:2|emission-1749-OUT;n:type:ShaderForge.SFN_Multiply,id:1086,x:32812,y:32818,cmnt:RGB,varname:node_1086,prsc:2|A-981-OUT,B-5983-RGB,C-5376-RGB;n:type:ShaderForge.SFN_Color,id:5983,x:32551,y:32915,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:5376,x:32551,y:33079,varname:node_5376,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1749,x:33025,y:32818,cmnt:Premultiply Alpha,varname:node_1749,prsc:2|A-1086-OUT,B-603-OUT;n:type:ShaderForge.SFN_Multiply,id:603,x:32812,y:32992,cmnt:A,varname:node_603,prsc:2|A-981-OUT,B-5983-A,C-5376-A;n:type:ShaderForge.SFN_TexCoord,id:519,x:31784,y:32777,varname:node_519,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:5919,x:31562,y:32875,varname:node_5919,prsc:2;n:type:ShaderForge.SFN_Panner,id:1455,x:32006,y:32777,varname:node_1455,prsc:2,spu:1,spv:1|UVIN-519-UVOUT,DIST-4409-OUT;n:type:ShaderForge.SFN_Slider,id:8300,x:31405,y:33022,ptovrint:False,ptlb:pannSpeedA,ptin:_pannSpeedA,varname:node_8300,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:0,max:5;n:type:ShaderForge.SFN_Multiply,id:4409,x:31784,y:32922,varname:node_4409,prsc:2|A-5919-TSL,B-8300-OUT;n:type:ShaderForge.SFN_Tex2d,id:2576,x:32177,y:32759,ptovrint:False,ptlb:TexA,ptin:_TexA,varname:node_2576,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:154c8b2a3dd668c4286b29c05bef3e41,ntxv:0,isnm:False|UVIN-1455-UVOUT;n:type:ShaderForge.SFN_Slider,id:2786,x:31405,y:33116,ptovrint:False,ptlb:pannSpeedB,ptin:_pannSpeedB,varname:node_2786,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:0,max:5;n:type:ShaderForge.SFN_Multiply,id:1429,x:31784,y:33054,varname:node_1429,prsc:2|A-5919-TSL,B-2786-OUT;n:type:ShaderForge.SFN_Panner,id:6558,x:32006,y:32943,varname:node_6558,prsc:2,spu:1,spv:1|UVIN-519-UVOUT,DIST-1429-OUT;n:type:ShaderForge.SFN_Slider,id:9947,x:31405,y:33216,ptovrint:False,ptlb:pannSpeedC,ptin:_pannSpeedC,varname:node_9947,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:0,max:5;n:type:ShaderForge.SFN_Multiply,id:5360,x:31784,y:33193,varname:node_5360,prsc:2|A-5919-TSL,B-9947-OUT;n:type:ShaderForge.SFN_Panner,id:7771,x:32006,y:33103,varname:node_7771,prsc:2,spu:1,spv:1|UVIN-519-UVOUT,DIST-5360-OUT;n:type:ShaderForge.SFN_Tex2d,id:5357,x:32177,y:32943,ptovrint:False,ptlb:TexB,ptin:_TexB,varname:_Smoke_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e9122e075ab59d044a5f509b510e84c1,ntxv:0,isnm:False|UVIN-6558-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5696,x:32177,y:33129,ptovrint:False,ptlb:TexC,ptin:_TexC,varname:node_5696,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f6bbcbdc4e5553a46b44a00ee894c6c7,ntxv:0,isnm:False|UVIN-7771-UVOUT;n:type:ShaderForge.SFN_Lerp,id:981,x:32551,y:32759,varname:node_981,prsc:2|A-5696-RGB,B-1371-OUT,T-5357-A;n:type:ShaderForge.SFN_Lerp,id:1371,x:32371,y:32759,varname:node_1371,prsc:2|A-5357-RGB,B-2576-RGB,T-2576-A;proporder:5983-8300-2576-2786-9947-5357-5696;pass:END;sub:END;*/

Shader "Retus001/PanningBG" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _pannSpeedA ("pannSpeedA", Range(-5, 5)) = 0
        _TexA ("TexA", 2D) = "white" {}
        _pannSpeedB ("pannSpeedB", Range(-5, 5)) = 0
        _pannSpeedC ("pannSpeedC", Range(-5, 5)) = 0
        _TexB ("TexB", 2D) = "white" {}
        _TexC ("TexC", 2D) = "white" {}
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
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            
            
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
            #pragma multi_compile_instancing
            #pragma multi_compile _ PIXELSNAP_ON
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _TexA; uniform float4 _TexA_ST;
            uniform sampler2D _TexB; uniform float4 _TexB_ST;
            uniform sampler2D _TexC; uniform float4 _TexC_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( float, _pannSpeedA)
                UNITY_DEFINE_INSTANCED_PROP( float, _pannSpeedB)
                UNITY_DEFINE_INSTANCED_PROP( float, _pannSpeedC)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                #ifdef PIXELSNAP_ON
                    o.pos = UnityPixelSnap(o.pos);
                #endif
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_5919 = _Time;
                float _pannSpeedC_var = UNITY_ACCESS_INSTANCED_PROP( Props, _pannSpeedC );
                float2 node_7771 = (i.uv0+(node_5919.r*_pannSpeedC_var)*float2(1,1));
                float4 _TexC_var = tex2D(_TexC,TRANSFORM_TEX(node_7771, _TexC));
                float _pannSpeedB_var = UNITY_ACCESS_INSTANCED_PROP( Props, _pannSpeedB );
                float2 node_6558 = (i.uv0+(node_5919.r*_pannSpeedB_var)*float2(1,1));
                float4 _TexB_var = tex2D(_TexB,TRANSFORM_TEX(node_6558, _TexB));
                float _pannSpeedA_var = UNITY_ACCESS_INSTANCED_PROP( Props, _pannSpeedA );
                float2 node_1455 = (i.uv0+(node_5919.r*_pannSpeedA_var)*float2(1,1));
                float4 _TexA_var = tex2D(_TexA,TRANSFORM_TEX(node_1455, _TexA));
                float3 node_981 = lerp(_TexC_var.rgb,lerp(_TexB_var.rgb,_TexA_var.rgb,_TexA_var.a),_TexB_var.a);
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 emissive = ((node_981*_Color_var.rgb*i.vertexColor.rgb)*(node_981*_Color_var.a*i.vertexColor.a));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
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
            #pragma multi_compile _ PIXELSNAP_ON
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
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
                #ifdef PIXELSNAP_ON
                    o.pos = UnityPixelSnap(o.pos);
                #endif
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
