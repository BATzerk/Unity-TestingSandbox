Shader "Custom/Tests/MousePos"
{
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _MousePos ("MousePos", Vector) = (1,1,1,1)
        //_ObjPos ("ObjPos", Vector) = (1,1,1,1)
    }
    SubShader
    {
        
        Tags {"PreviewType" = "Plane" "Queue"="AlphaTest" "IgnoreProjector"="True" "RenderType"="TransparentCutout"}
        Cull Off // draw backfaces also, comment this line if no need for backfaces
        AlphaTest Greater [_Cutoff]
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
            uniform float4 _MousePos;

            float4 frag(v2f i) : SV_Target
            {
                float2 uvMapped = i.uv/0.4 - float2(0.8,0.8);// + _MousePos;
                float dist = distance(_MousePos, uvMapped);
                float a = dist<0.03 ? 1 : 0;
                float b = 0;//distance(float2(0.31,0.69), i.uv) < 0.01 ? 1:0;
                float c = 0;
                
                //float4 color = float4(uvMapped.x,uvMapped.y,c, 0.1);
                float4 color = float4(a,b,c, 0.1);
                return color;
            }
            ENDCG
        }
    }
}