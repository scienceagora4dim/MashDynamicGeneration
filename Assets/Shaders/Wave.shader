Shader "Custom/Wave" {
	Properties{
		_DiffuseColor("Diffuse Color",Color) = (0.0,0.0,1.0)
	}

	SubShader{
		Tags{ "RenderType" = "Opaque" }
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		struct Input {
			float4 color : COLOR;
			float3 viewDir;
		};
		float4 _DiffuseColor;
		void vert(inout appdata_full v) {
			v.vertex.x += sin(v.vertex.x)*cos(v.vertex.y);
			v.vertex.y += sin(v.vertex.x)*sin(v.vertex.y);
			v.vertex.z += cos(v.vertex.x);

			//v.vertex.x += cos(atan(v.vertex.z / v.vertex.x) + _Time.w);
			//v.vertex.z += sin(atan(v.vertex.z / v.vertex.x) + _Time.w);
		}
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _DiffuseColor;
		}
		ENDCG
	}
	Fallback "Diffuse"
}
