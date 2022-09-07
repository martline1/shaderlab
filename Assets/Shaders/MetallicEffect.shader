Shader "Exercises/MetallicEffect" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Cube("cube", CUBE) = "" {}
        // Add range
        _Metallic ("Metallic", Range(0,3)) = 0
    }
    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert
        float4 _Color;
        sampler2D _MainTex;
        samplerCUBE _Cube;
        float _Metallic;
        struct Input {
            float2 uv_MainTex;
            float3 worldRefl;
        };
        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Emission = texCUBE(_Cube, IN.worldRefl);
            o.Metallic = _Metallic;
        }
        ENDCG
    }
}
