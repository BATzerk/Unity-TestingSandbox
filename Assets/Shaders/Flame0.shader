Shader "Custom/Tests/Flame0"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _DisplaceTex("Displacement Texture", 2D) = "white" {}
        _TestVal0("TestVal0", Range(0,2)) = 1
        _Magnitude("Magnitude", Range(0,0.1)) = 1
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always
        
        Tags
        {
            "PreviewType" = "Plane"
        }
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
            
            sampler2D _MainTex;
            sampler2D _DisplaceTex;
            float _TestVal0;
            float _Magnitude;

            float4 frag(v2f i) : SV_Target
            {
                //float t = _Time[1];
                //float disp = tex2D(_DisplaceTex, i.uv + float2(t,-t)*0.02).xy;
                //disp = ((disp*2)-1) * _Magnitude;
                
                float4 color = tex2D(_MainTex, i.uv);//+disp);
                //color = lerp(color, tex2D(_MainTex, i.uv), _TestVal0);
                return color;
            }
            ENDCG
        }
    }
}