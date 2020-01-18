// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,cmtg:SF,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,acwp:False,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|custl-586-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32326,y:32733,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.2688679,c3:0.2757499,c4:1;n:type:ShaderForge.SFN_SceneColor,id:8865,x:32313,y:32964,varname:node_8865,prsc:2|UVIN-8742-OUT;n:type:ShaderForge.SFN_ScreenPos,id:8639,x:31678,y:32667,varname:node_8639,prsc:2,sctp:2;n:type:ShaderForge.SFN_Multiply,id:586,x:32525,y:32949,varname:node_586,prsc:2|A-7241-RGB,B-8865-RGB;n:type:ShaderForge.SFN_Add,id:8935,x:31869,y:32829,varname:node_8935,prsc:2|A-8639-UVOUT,B-8823-OUT;n:type:ShaderForge.SFN_Tex2d,id:224,x:31474,y:32737,ptovrint:False,ptlb:Displace,ptin:_Displace,varname:_Displace,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29e7be3707affdb4a97b71fcd5f8e658,ntxv:3,isnm:True|UVIN-9913-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:9913,x:31290,y:32737,varname:node_9913,prsc:2,sctp:1;n:type:ShaderForge.SFN_Multiply,id:8823,x:31678,y:32829,varname:node_8823,prsc:2|A-224-R,B-7716-OUT;n:type:ShaderForge.SFN_Slider,id:7716,x:31317,y:32966,ptovrint:False,ptlb:RefractionPower,ptin:_RefractionPower,varname:_RefractionPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:8742,x:32103,y:32964,ptovrint:False,ptlb:UseNormal,ptin:_UseNormal,varname:_UseNormal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-8935-OUT,B-7392-OUT;n:type:ShaderForge.SFN_ScreenPos,id:1283,x:31678,y:33152,varname:node_1283,prsc:2,sctp:2;n:type:ShaderForge.SFN_Tex2d,id:7779,x:31296,y:33105,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29e7be3707affdb4a97b71fcd5f8e658,ntxv:3,isnm:True|UVIN-4711-UVOUT;n:type:ShaderForge.SFN_Append,id:1138,x:31491,y:33105,varname:node_1138,prsc:2|A-7779-R,B-7779-G;n:type:ShaderForge.SFN_Multiply,id:4459,x:31678,y:33023,varname:node_4459,prsc:2|A-7716-OUT,B-1138-OUT;n:type:ShaderForge.SFN_Add,id:7392,x:31869,y:33023,varname:node_7392,prsc:2|A-4459-OUT,B-1283-UVOUT;n:type:ShaderForge.SFN_Panner,id:4711,x:31090,y:33105,varname:node_4711,prsc:2,spu:1,spv:1|UVIN-9359-UVOUT,DIST-3411-OUT;n:type:ShaderForge.SFN_TexCoord,id:9359,x:30864,y:33027,varname:node_9359,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:8842,x:30657,y:33190,varname:node_8842,prsc:2;n:type:ShaderForge.SFN_Slider,id:8827,x:30500,y:33337,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_8827,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:3411,x:30864,y:33190,varname:node_3411,prsc:2|A-8842-T,B-8827-OUT;proporder:7241-224-7716-8742-7779-8827;pass:END;sub:END;*/

Shader "Retus001/RefractionBoi" {
    Properties {
        _Color ("Color", Color) = (1,0.2688679,0.2757499,1)
        _Displace ("Displace", 2D) = "bump" {}
        _RefractionPower ("RefractionPower", Range(0, 1)) = 0
        [MaterialToggle] _UseNormal ("UseNormal", Float ) = 0
        _Normal ("Normal", 2D) = "bump" {}
        _speed ("speed", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CustomTag"="SF"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
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
            uniform sampler2D _GrabTexture;
            uniform float4 _Color;
            uniform sampler2D _Displace; uniform float4 _Displace_ST;
            uniform float _RefractionPower;
            uniform fixed _UseNormal;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 _Displace_var = UnpackNormal(tex2D(_Displace,TRANSFORM_TEX(float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg, _Displace)));
                float4 node_8842 = _Time;
                float2 node_4711 = (i.uv0+(node_8842.g*_speed)*float2(1,1));
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_4711, _Normal)));
                float3 finalColor = (_Color.rgb*tex2D( _GrabTexture, lerp( (sceneUVs.rg+(_Displace_var.r*_RefractionPower)), ((_RefractionPower*float2(_Normal_var.r,_Normal_var.g))+sceneUVs.rg), _UseNormal )).rgb);
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
