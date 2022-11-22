Shader "Unlit/RetroSudoLightShader"
{
    Properties
    {
        _BaseColor ("BaseColor", Color) = (0,0,0,1)         // Base Unlit color
        _OrientationAngle("Angel", Range(0.0, 90.0)) = 45   // Max angle between normal and player vector
        
        [Header (Close Range)]  //All variables pertaining too close range lighting
        _CloseRange ("CloseRange", Float) = 1                   //Range for close range lighting
        _CloseColor ("CloseStandardColor", Color) = (0,0,0,1)   //Base color for close range fragments
        _CloseOrientatedRange("CloseAngleRange", Float) = 1.5   //"Close" Range for all correctly orientated fragments
        _CloseOrientatedColor("CloseAngleColor", Color) = (0,0,0,1) // Color for all orientated fragments within the given range
        
        [Header (Medium Range)] //See Close Range 
        _MediumRange ("MedRange", Float) = 2
        _MediumColor ("MedStandardColor", Color) = (0,0,0,1)
        _MediumOrientatedRange("MedAngleRange", Float) = 1.5
        _MediumOrientatedColor("MedAngleColor", Color) = (0,0,0,1)
        
        [Header (Far Range)]    //See Close Range
        // No lit color, Uses Base Color Instead
        _FarOrientatedRange("FarAngleRange", Float) = 1.5
        _FarOrientatedColor("FarAngleColor", Color) = (0,0,0,1)
        
        [Header (Player Pos)]
        _PlayerPos ("PlayerPos", Vector) = (0,0,0,1)    //3D position the sudo lighting engine is based around
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                //float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                //float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
                float4 pos : SV_POSITION;
                float4 pos_world_space : TEXCOORD0;
            };

            float4 _BaseColor;
            float4 _PlayerPos;
            float _OrientationAngle;
            
            float _CloseRange;
            float _CloseOrientatedRange;
            float4 _CloseColor;
            float4 _CloseOrientatedColor;

            float _MediumRange;
            float _MediumOrientatedRange;
            float4 _MediumColor;
            float4 _MediumOrientatedColor;
            
            float _FarOrientatedRange;
            float4 _FarOrientatedColor;
            

            v2f vert (appdata v)
            {
                v2f o;
                
                o.pos = UnityObjectToClipPos(v.vertex);
                o.pos_world_space = mul(unity_ObjectToWorld, v.vertex);
                //o.uv = v.uv;
                o.normal = v.normal;
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = _BaseColor; //Set the base color for all fragments
                float3 FragToPlayerVector = i.pos_world_space.xyz - _PlayerPos.xyz;
                float AngleToPlayer =50;
                //acos((dot(mul(i.normal.xz, unity_ObjectToWorld), FragToPlayerVector) / length(i.normal.xz)) / length(FragToPlayerVector));
                
                if (length(FragToPlayerVector) <= _CloseRange)
                {
                    col = _CloseColor;
                    /*if (AngleToPlayer >= _OrientationAngle)
                    {
                        col = _CloseOrientatedColor;
                    }*/
                    return col;
                }

                if (length(FragToPlayerVector) <= _MediumRange)
                {
                    col = _MediumColor;
                    /*if (AngleToPlayer >= _OrientationAngle)
                    {
                        col = _MediumOrientatedColor;
                    }*/
                    return col;
                }
                
                
                /*if (AngleToPlayer >= _OrientationAngle)
                {
                    col = _FarOrientatedColor;
                }*/
                
                
                /*float AngleToPlayer = acos((dot(i.normal.xyz, FragToPlayerVector) / length(i.normal.xyz)) / length(FragToPlayerVector));
                if (AngleToPlayer <= _OrientationAngle)
                {
                    col = _CloseColor;
                }*/
                return col;
            }
            ENDCG
        }
    }
}
