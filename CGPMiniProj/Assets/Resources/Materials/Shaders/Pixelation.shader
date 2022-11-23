Shader "Hidden/Pixelation"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _pixels ("Resolution", int) = 512 // Total Screen resolution
        _pw ("Pixel Width", float) = 64 // How wide each pixel is
        _ph ("Pixel Height", float) = 64 // How tall each pixel is
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


            // Data passed to vertex shader
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            // Data passed from vertex to fragment shader
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };


            //Vertex shader -- Passes all variables from input to fragment
            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            // Define all variables
            float _pixels;
            float _pw;
            float _ph;
            float _dx;
            float _dy;
            sampler2D _MainTex;

            fixed4 frag(v2f i) : SV_Target
            {
                _dx = _pw * (1 / _pixels); // X screen resolution
                _dy = _ph * (1 / _pixels); // Y screen resolution
                float2 coord = float2(_dx * floor(i.uv.x / _dx), _dy * floor(i.uv.y / _dy));
                // Generate a replacement uv map called coord

                fixed4 col = tex2D(_MainTex, coord); // pass coord to the 2D texture
                return col;
            }
            ENDCG
        }
    }
}