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

////�O�p�`�̓��͂���A��������o�͂���T���v��
//[maxvertexcount(4)]
//void main(triangle VSOutput input[3] : SV_POSITION,
//		  //�����X�g���[��
//		  inout LineStream<GSOutput> output) {
//	GSOutput element;
//
//	for (uint i = 0; i < 3; i++) {
//		//�����̎n�_
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//
//	}
//
//	//�����̏I�_
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//}

//�v���~�e�B�u�̕���
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
//	//���݂̃X�g���b�v���I��
//	output.RestartStrip();
//
//	//2�ڂ̎O�p�`
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;
//		//X������20���炷
//		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
//		element.normal = input[i].normal;
//		//UV���ܔ{
//		element.uv = input[i].uv * 5.0f;
//		output.Append(element);
//	}
//}

//�O�p�`�̏o��
[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
) {
	GSOutput element;
	//����
	element.normal = input[0].normal;
	element.uv = input[0].uv;

	//1�_��
	element.svpos = input[0].svpos;
	output.Append(element);

	//2�_��
	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0, 0);
	output.Append(element);
	//3�_��
	element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
	output.Append(element);
}