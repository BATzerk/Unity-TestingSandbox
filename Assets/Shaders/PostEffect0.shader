Shader "Custom/Tests/PostEffect0"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

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
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
				//float oscOff = 0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
			
    //        fixed4 frag (v2f i) : SV_Target
    //        {
    //            //col.rgb = 1 - col.rgb;
				//fixed4 col2 = tex2D(_MainTex, i.uv + float2(-0.01f, 0));
				//fixed4 col3 = tex2D(_MainTex, i.uv + float2( 0.01f, 0));
				//fixed4 col4 = tex2D(_MainTex, i.uv + float2(0, -0.01f));
				//fixed4 col5 = tex2D(_MainTex, i.uv + float2(0,  0.01f));


				//fixed4 col = tex2D(_MainTex, i.uv);
				//col.rgb = col.rgb*0.6f;
				//col.rgb += col2.rgb*0.1f;
				//col.rgb += col3.rgb*0.1f;
				//col.rgb += col4.rgb*0.1f;
				//col.rgb += col5.rgb*0.1f;

    //            return col;
    //        }
            fixed4 frag (v2f i) : SV_Target
            {
				float offsetY = sin(i.uv.x*5 + _Time[1])*0.1f;
				fixed4 col = tex2D(_MainTex, i.uv + float2(0, offsetY));
				//oscOff += 0.001f;
                return col;
            }
            ENDCG
        }
    }
}
