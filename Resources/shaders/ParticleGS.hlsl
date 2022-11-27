#include "Particle.hlsli"

//四角形の頂点数
static const uint vnum = 4;

//センターからのオフセット
static const float4 offset_array[vnum] = {
	float4(-0.5f, -0.5f, 0, 0),	//左下
	float4(-0.5f, +0.5f, 0, 0),	//左上
	float4(+0.5f, -0.5f, 0, 0),	//右下
	float4(+0.5f, +0.5f, 0, 0)	//右上
};

//UVの割り当て
static const float2 uv_array[vnum] = {
	float2(0,1),
	float2(0,0),
	float2(1,1),
	float2(1,0)
};
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
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
) {
	GSOutput element;
	//4点分まわす
	for (uint i = 0; i < vnum; i++) {
		//中心からのオフセットをスケーリング
		float4 offset = offset_array[i] * input[0].scale;
		//中心からのオフセットをビルボード回転(モデル座標)
		offset = mul(matBillboard, offset);

		//オフセット分ずらす(ワールド座標)
		element.svpos = input[0].pos + offset;
		//ビュー、射影変換
		element.svpos = mul(mat, element.svpos);
		element.uv = uv_array[i];
		output.Append(element);
	}
}