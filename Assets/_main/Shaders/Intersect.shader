// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|custl-7353-OUT,alpha-8796-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31705,y:32453,ptovrint:False,ptlb:mainColor,ptin:_mainColor,varname:_mainColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:7817,x:31131,y:33196,ptovrint:False,ptlb:depthblend,ptin:_depthblend,varname:_depthblend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_DepthBlend,id:4577,x:31452,y:33196,varname:node_4577,prsc:2|DIST-7817-OUT;n:type:ShaderForge.SFN_OneMinus,id:6075,x:31609,y:33196,varname:node_6075,prsc:2|IN-4577-OUT;n:type:ShaderForge.SFN_Clamp01,id:394,x:31774,y:33196,varname:node_394,prsc:2|IN-6075-OUT;n:type:ShaderForge.SFN_Fresnel,id:3971,x:31774,y:33046,varname:node_3971,prsc:2|NRM-9017-OUT,EXP-7364-OUT;n:type:ShaderForge.SFN_Exp,id:7364,x:31452,y:33014,varname:node_7364,prsc:2,et:0|IN-7554-OUT;n:type:ShaderForge.SFN_Slider,id:7554,x:31124,y:33014,ptovrint:False,ptlb:fresnel,ptin:_fresnel,varname:_fresnel,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Blend,id:7378,x:31967,y:33115,varname:node_7378,prsc:2,blmd:6,clmp:True|SRC-3971-OUT,DST-394-OUT;n:type:ShaderForge.SFN_NormalVector,id:9017,x:31452,y:32857,prsc:2,pt:False;n:type:ShaderForge.SFN_Set,id:5121,x:32137,y:33115,varname:opacityBlend,prsc:2|IN-7378-OUT;n:type:ShaderForge.SFN_Get,id:8796,x:32423,y:33034,varname:node_8796,prsc:2|IN-5121-OUT;n:type:ShaderForge.SFN_Color,id:4106,x:31705,y:32812,ptovrint:False,ptlb:edgeColor,ptin:_edgeColor,varname:_edgeColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:7353,x:32155,y:32526,varname:node_7353,prsc:2|A-102-OUT,B-5118-OUT,T-394-OUT;n:type:ShaderForge.SFN_Tex2d,id:9164,x:31705,y:32624,ptovrint:False,ptlb:mainTex,ptin:_mainTex,varname:node_9164,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:102,x:31895,y:32453,varname:node_102,prsc:2|A-7241-RGB,B-9164-RGB,C-3612-OUT;n:type:ShaderForge.SFN_Multiply,id:5118,x:31898,y:32812,varname:node_5118,prsc:2|A-4106-RGB,B-9164-RGB,C-3612-OUT;n:type:ShaderForge.SFN_Slider,id:3612,x:31852,y:32668,ptovrint:False,ptlb:emissivePower,ptin:_emissivePower,varname:node_3612,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:10;proporder:7241-7817-7554-4106-9164-3612;pass:END;sub:END;*/

Shader "Retus001/Intersect" {
    Properties {
        _mainColor ("mainColor", Color) = (1,1,1,1)
        _depthblend ("depthblend", Range(0, 1)) = 0.5
        _fresnel ("fresnel", Range(0, 1)) = 1
        _edgeColor ("edgeColor", Color) = (1,1,1,1)
        _mainTex ("mainTex", 2D) = "white" {}
        _emissivePower ("emissivePower", Range(1, 10)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _mainTex; uniform float4 _mainTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _mainColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _depthblend)
                UNITY_DEFINE_INSTANCED_PROP( float, _fresnel)
                UNITY_DEFINE_INSTANCED_PROP( float4, _edgeColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _emissivePower)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float4 _mainColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _mainColor );
                float4 _mainTex_var = tex2D(_mainTex,TRANSFORM_TEX(i.uv0, _mainTex));
                float _emissivePower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _emissivePower );
                float4 _edgeColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _edgeColor );
                float _depthblend_var = UNITY_ACCESS_INSTANCED_PROP( Props, _depthblend );
                float node_394 = saturate((1.0 - saturate((sceneZ-partZ)/_depthblend_var)));
                float3 finalColor = lerp((_mainColor_var.rgb*_mainTex_var.rgb*_emissivePower_var),(_edgeColor_var.rgb*_mainTex_var.rgb*_emissivePower_var),node_394);
                float _fresnel_var = UNITY_ACCESS_INSTANCED_PROP( Props, _fresnel );
                float opacityBlend = saturate((1.0-(1.0-pow(1.0-max(0,dot(i.normalDir, viewDirection)),exp(_fresnel_var)))*(1.0-node_394)));
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
