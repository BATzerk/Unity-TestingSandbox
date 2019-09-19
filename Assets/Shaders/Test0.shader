Shader "Custom/Tests/Test0"
{
    SubShader
    {
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
                //float t = _Time[1];
                //float offsetX = sin(t+v.vertex.y*3) * 1;
                //float offsetY = 0;//sin(t+v.vertex.y*1.2) * 0.1;
                //o.vertex = UnityObjectToClipPos(v.vertex + float4(offsetX,offsetY,0,0));
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float4 frag(v2f i) : SV_Target
            {
                //float4 color = float4((i.uv.g+i.uv.r)/2, 1,1, 1);
                float t = _Time[1];
                float4 color = float4(i.uv.x*sin(t), i.uv.y, 1, 1);
                return color;
            }
            ENDCG
        }
    }
}