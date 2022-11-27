#include "Particle.hlsli"

//�l�p�`�̒��_��
static const uint vnum = 4;

//�Z���^�[����̃I�t�Z�b�g
static const float4 offset_array[vnum] = {
	float4(-0.5f, -0.5f, 0, 0),	//����
	float4(-0.5f, +0.5f, 0, 0),	//����
	float4(+0.5f, -0.5f, 0, 0),	//�E��
	float4(+0.5f, +0.5f, 0, 0)	//�E��
};

//UV�̊��蓖��
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
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
) {
	GSOutput element;
	//4�_���܂킷
	for (uint i = 0; i < vnum; i++) {
		//���S����̃I�t�Z�b�g���X�P�[�����O
		float4 offset = offset_array[i] * input[0].scale;
		//���S����̃I�t�Z�b�g���r���{�[�h��](���f�����W)
		offset = mul(matBillboard, offset);

		//�I�t�Z�b�g�����炷(���[���h���W)
		element.svpos = input[0].pos + offset;
		//�r���[�A�ˉe�ϊ�
		element.svpos = mul(mat, element.svpos);
		element.uv = uv_array[i];
		output.Append(element);
	}
}