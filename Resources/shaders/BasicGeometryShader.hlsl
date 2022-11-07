#include "BasicShaderHeader.hlsli"

//struct VSOutput
//{
//	float4 pos : SV_POSITION;
//};

//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//) {
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv * 2.0f;
//		output.Append(element);
//	}
//}

////三角形の入力から、線分を一つ出力するサンプル
//[maxvertexcount(4)]
//void main(triangle VSOutput input[3] : SV_POSITION,
//		  //線分ストリーム
//		  inout LineStream<GSOutput> output) {
//	GSOutput element;
//
//	for (uint i = 0; i < 3; i++) {
//		//線分の始点
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//
//	}
//
//	//線分の終点
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//}

//プリミティブの複製
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//) {
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv * 2.0f;
//		output.Append(element);
//	}
//	//現在のストリップを終了
//	output.RestartStrip();
//
//	//2つ目の三角形
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;
//		//X方向に20ずらす
//		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
//		element.normal = input[i].normal;
//		//UVを五倍
//		element.uv = input[i].uv * 5.0f;
//		output.Append(element);
//	}
//}

//三角形の出力
[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
) {
	GSOutput element;
	//共通
	element.normal = input[0].normal;
	element.uv = input[0].uv;

	//1点目
	element.svpos = input[0].svpos;
	output.Append(element);

	//2点目
	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0, 0);
	output.Append(element);
	//3点目
	element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
	output.Append(element);
}