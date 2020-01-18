// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,cmtg:SF,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,acwp:False,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|custl-7353-OUT,alpha-8796-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31774,y:32613,ptovrint:False,ptlb:mainColor,ptin:_mainColor,varname:_mainColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:7817,x:31131,y:33198,ptovrint:False,ptlb:depthblend,ptin:_depthblend,varname:_depthblend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_DepthBlend,id:4577,x:31452,y:33198,varname:node_4577,prsc:2|DIST-7817-OUT;n:type:ShaderForge.SFN_OneMinus,id:6075,x:31609,y:33198,varname:node_6075,prsc:2|IN-4577-OUT;n:type:ShaderForge.SFN_Clamp01,id:394,x:31774,y:33198,varname:node_394,prsc:2|IN-6075-OUT;n:type:ShaderForge.SFN_Fresnel,id:3971,x:31774,y:33046,varname:node_3971,prsc:2|NRM-9017-OUT,EXP-7364-OUT;n:type:ShaderForge.SFN_Exp,id:7364,x:31452,y:33014,varname:node_7364,prsc:2,et:0|IN-7554-OUT;n:type:ShaderForge.SFN_Slider,id:7554,x:31124,y:33014,ptovrint:False,ptlb:fresnel,ptin:_fresnel,varname:_fresnel,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Blend,id:7378,x:31967,y:33115,varname:node_7378,prsc:2,blmd:6,clmp:True|SRC-3971-OUT,DST-394-OUT;n:type:ShaderForge.SFN_NormalVector,id:9017,x:31452,y:32857,prsc:2,pt:False;n:type:ShaderForge.SFN_Set,id:5121,x:32137,y:33115,varname:opacityBlend,prsc:2|IN-7378-OUT;n:type:ShaderForge.SFN_Get,id:8796,x:32423,y:33034,varname:node_8796,prsc:2|IN-5121-OUT;n:type:ShaderForge.SFN_Color,id:4106,x:31774,y:32832,ptovrint:False,ptlb:edgeColor,ptin:_edgeColor,varname:_edgeColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:7353,x:31991,y:32693,varname:node_7353,prsc:2|A-7241-RGB,B-4106-RGB,T-394-OUT;proporder:7241-7817-7554-4106;pass:END;sub:END;*/

Shader "Retus001/IntersectTest" {
    Properties {
        _mainColor ("mainColor", Color) = (1,1,1,1)
        _depthblend ("depthblend", Range(0, 1)) = 0.5
        _fresnel ("fresnel", Range(0, 1)) = 1
        _edgeColor ("edgeColor", Color) = (1,1,1,1)
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
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _mainColor;
            uniform float _depthblend;
            uniform float _fresnel;
            uniform float4 _edgeColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float node_394 = saturate((1.0 - saturate((sceneZ-partZ)/_depthblend)));
                float3 finalColor = lerp(_mainColor.rgb,_edgeColor.rgb,node_394);
                float opacityBlend = saturate((1.0-(1.0-pow(1.0-max(0,dot(i.normalDir, viewDirection)),exp(_fresnel)))*(1.0-node_394)));
                return fixed4(finalColor,opacityBlend);
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
