// �������� �� ������������ �������, ����������� �������� ���� operation,
// �.�. �������� ������������ ����� ������������ � ������� ������
$Pattern �������_������������_������� : operation
$Relevant_resources
	// � �������� ����������� �������� ���������:
	// 1. ������������ ��������������, � ������ �������� �������
	// 2. ������ �� ��������, ������� ��������� � ��������� ������
	// 3. ������ �� ������������, ������� ����� (��������� = ��������) �
	//    ����� (������ ���) ����� ���������� �������
	// ��� ����, ��������� �������������� ���������� ������ � ������ �������� (Keep/NoChange),
	// ������ ������ ����� ������ �� ������ � ����� ������� (Keep/Erase), � ����������
	// �������� ���� ��������� � � ������ � � ����� ������� (Keep/Keep)
	_��������������: �������������� Keep NoChange
	_������        : �������        Keep Erase
	_����������    : �����������    Keep Keep
$Time = ������������_������������( _����������.������������_min, _����������.������������_max )
/*
����������������� ������� ���������� �� ������������ ������ (��. FUN), ���������
�������� ������������ ��������� ������������
*/
$Body
_��������������
	// ������� ����� ��������, ���� ������� �� �����
	Choice from _��������������.����������_�_������� > 0
	Convert_begin
		// � ������ �������� ������ ������������ �� ������� � ������ �����������
		����������_�_�������--;

_������
	// �������� �������, ������� ��� �� ����� �������
	Choice from _������.��������� == ������
	Convert_begin
		// � ������ �������� �������� ��������� �������, ����� ��� �� ���������� ������
		��������� = �����_�������;

_����������
	// ������� ����� ��������, ���� ���������� ��������, � �� ����� ����� ���������� �������
	Choice from _����������.���������_����������� == �������� and _����������.���_������� == _������.���
	with_min( _����������.����������_����������� ) // ���� ����� ��������� ������������
	                                               // ������������� ������� Choice from, ��
												   // ������� ���� �� ���, ��� ������ �����
												   // �������� ��������
	Convert_begin
		// � ������ �������� ���������� ��������� � ��������� �����
		���������_�����������  = �����;
	Convert_end
		// ����� ������� ���������� ���������� ���������, �...
		���������_�����������  = ��������;
		// ...��� ���������� �������� ������� ����������� ��������
		����������_�����������++;
$End
