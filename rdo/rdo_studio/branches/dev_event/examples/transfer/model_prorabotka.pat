$Pattern �������_�������_������ : irregular_event
$Relevant_resources
	_�������: ������� Keep 
	������  : ������  Create 
$Time = �_������_������ (200, 1) 
$Body
_������� 
	Convert_event 
		����_������ += 1;
������
    Convert_event trace
		�����_������ = _�������.����_������; 
		���_����� = �_���_����� (900.0, 1800.0);
		�������   = �_���_��������;
		��������� = ������;
$End

$Pattern �������_�������_����������_������� : rule 
$Relevant_resources
	������: ������ Keep
$Body
������
	Choice from ������.��������� = ������
	Convert_rule
		����������_�������_�_������ = �_����������_�_����������_��������_������ ( ������.���_����� / ������ ); 
		��������� = ����������;
$End

$Pattern �������_����������_������������_�������_�_���������_�������_������ : rule
$Relevant_resources
	������             : ������              Keep  
	�����������_������ : �����������_������� Keep 
$Body
������ 
	Choice from ������.��������� = ���������� or ������.��������� = ��������_����������������_������ 
	Convert_rule
	if  (������.��������� = ����������) 
	{	
		�������_�_������ = ����������_�������_�_������;
		��������� = �������������_�������;
		����� = ������.����������_�������_�_������;
	}
	else
	{	
		��������� = �������������_�������;
		����� = ������.�������_�_������;
	}
�����������_������
	Choice from �����������_������.������� = ������.������� and ����_������������_������� = 0
			and (�����������_������.��������� = ������ or �����������_������.��������� = ����������)  
	Convert_rule
	if (�����������_������.��������� = ������)
	{	
		�����_������������_������� += 1;
		��������� = �������������_�������; 
	}
	else
		��������� = �������������_�������;
$End

$Pattern ���������_�������: rule  
$Relevant_resources
	�����������_������: �����������_������� Keep
	������            : ������              Keep 
$Body
�����������_������
	Choice from �����������_������.��������� = �������������_�������
	Convert_rule
		��������� = ���������_���������_1;
������    
	Choice from ������.��������� = �������������_������� and ������.������� = �����������_������.�������
	Convert_rule
		��������� = ���������_���������_1;
$End 

$Pattern �������_�������������_������_������: rule  
$Relevant_resources
	������            : ������              Keep 
	�����������_������: �����������_������� Keep 
$Body
������    
	Choice from ������.��������� = ���������_���������_1
	Convert_rule
		if (������.�������_�_������ > (60 - �����������_������.�������_����������_�������)) 
		{
			�������_�_������ -= 60 - �����������_������.�������_����������_�������;
		}
		else 
		{
			�������_�_������ = 0; 
			��������� = ������������;
			�����_����������_������� = �����������_������.�����_������������_�������;
		}
		
�����������_������
	Choice from �����������_������.��������� = ���������_���������_1
	Convert_rule
		if ((60 - �����������_������.�������_����������_�������) <= ������.�����) 
		{	
			�������_����������_������� = 60;
			��������� = �����������;
		}
		if ((60 - �����������_������.�������_����������_�������) > ������.�����)
			�������_����������_������� = �����������_������.�������_����������_������� + ������.�����;	
$End 

/*$Pattern �������_�������������_������_�����������_������: rule  
$Relevant_resources
	������            : ������              NoChange  
	�����������_������: �����������_������� Keep 
$Body
������ 
	Choice from ������.��������� = ���������_���������_1
�����������_������    
	Choice from �����������_������.��������� = ���������_���������_1
	Convert_rule
		����_������������_������� = 1;
		if ((60 - �����������_������.�������_����������_�������) <= ������.�����) 
		{	
			�������_����������_������� = 60;
			��������� = �����������;
		}
		else
			�������_����������_������� = �����������_������.�������_����������_������� + ������.����������_�������_�_������;
$End */

$Pattern �������_������_������ : rule
$Relevant_resources
	������ : ������              Keep 
$Body
������ 
	Choice from ������.����_������ = 1
	Convert_rule
	����_������ = 0;
		if (������.�������_�_������ = 0)
			��������� = ������������;
		else
			��������� = ��������_����������������_������;
$End

$Pattern �������_������_���������� : rule
$Relevant_resources
	�����������_������: �����������_������� Keep 
$Body
�����������_������
	Choice from �����������_������.����_������������_������� = 1
	Convert_rule
	����_������������_������� = 0;
		if (�����������_������.�������_����������_������� = ������_�_�������)
			��������� = �����������;
		else
			��������� = ����������;
			�����_��������������_������ = 0;
$End

$Pattern �������_����������_�������: rule 
$Relevant_resources
    �����������_������: �����������_������� Keep 
	������            : �������             Create 
	_����             : ����                Keep 
$Body
�����������_������
	Choice from �����������_������.��������� = �����������
	Convert_rule 
		�������_����������_������� = 0;
		��������� = ������;
������
	Convert_rule trace
		��������� = �����������;
		������� = �����������_������.�������;
		�����_������� = �����������_������.�����_������������_�������;                             
		����������� = ������;
_����
	Convert_rule 
	if (����������_�������_�_����� >= 60)
		����������_�������_�_����� -= 60; 
	else 
	{ 
		������� -= 60;
		����������_�������_�_����� = 0;
	}
$End










$Pattern �������_��������_������� : operation 
$Relevant_resources
	������              : �������  			  Keep Keep
	_�������_�����������: �����_�����������  Keep Keep
$Time = 20//�_��������_������� (6, 1)
$Body
������
	Choice from ������.��������� = �����������
	Convert_begin
		��������� = ���������; //��� �� ��� ���������� ����������� :)
	Convert_end
		��������� = �����_�_��������;
_�������_�����������
	Choice from _�������_�����������.��������� = �������� 
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = ��������;
$End

$Pattern �������_�������� : operation 
$Relevant_resources
	������         : �������        Keep     Keep
	_�����_��������: �����_�������� Keep     Keep
$Time = 20//�_�������� (6, 1)
$Body
������
	Choice from ������.��������� = �����_�_��������
	Convert_begin
		��������� = ��������;
	Convert_end
		��������� = �����_�_��������;
_�����_��������
	Choice from _�����_��������.��������� = ��������
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = ��������;
$End

$Pattern �������_����������_��_�������� : operation
$Parameters 
	�����_��������: such_as ������.�������
	������_����   : such_as ������_�����������.�������������� 
	�����_����    : such_as ������_�����������.��������������
	����������    : real 
	�����������   : such_as �������.�����������
$Relevant_resources
	c����� : ������� Keep Keep
$Time = 20//�_�����_�_���� (����������*10/500, 0.1)
$Body
c�����
	Choice from c�����.��������� = �����_�_�������� and c�����.������� = �����_�������� 
		and c�����.�������������� = ������_���� and c�����.����������� = �����������
	Convert_begin
		��������� = �_����;
	Convert_end
		��������� = ������;
		�������������� = �����_����;
$End

$Pattern �������_�����������_��������_�_�������� : rule
$Relevant_resources
	�������            : ����������_������ NoChange 
	�������_���������� : ������_���������� NoChange
	�������_�����������: �����_����������� NoChange 
	������             : ������� Keep 
$Body
�������
�������_����������
�������_�����������
������
	Choice from ������.��������� = ������ 
	Convert_rule
	if (������.�������������� = �������.��������������) 
		��������� = ������_��_�������;
	if (������.�������������� = �������_����������.��������������)
		��������� = ������_��_���������;
	if (������.�������������� = �������_�����������.��������������) 
		��������� = ������_�_����; 
$End

$Pattern �������_�����������_������� : operation
$Relevant_resources
	������ : ������� 	 	   Keep Keep
	�������: ����������_������ Keep Keep
$Time = 5//�_�����������_������� (6, 1)
$Body
������
	Choice from ������.��������� = ������_��_������� 
	Convert_begin
		��������� = �����������_�������;
	Convert_end
		��������� = ������_�������;
�������
	Choice from �������.��������� = �������� and �������.�������������� = ������.��������������
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = ��������;
$End

$Pattern �������_������_��������_�����_������� : rule
$Relevant_resources
	_�����_�����_�����: �����_�����_����� NoChange 
	������			  : ������� Keep
$Body
_�����_�����_����� 
������
	Choice from ������.��������� = ������_�������
	Convert_rule
	if (������.�������������� = _�����_�����_�����.��������������)
		��������� = ����������_�������_�����;
	else 
		��������� = �����_�_��������;
$End

$Pattern �������_�����_����� : operation
$Relevant_resources
	������            : �������           Keep Keep
	_�����_�����_�����: �����_�����_����� Keep Keep
$Time = 20//�_�����_����� (6, 1)
$Body
������
	Choice from ������.��������� = ����������_�������_�����
	Convert_begin
		��������� = �����_�����;
	Convert_end
		��������� = �����_�_��������;
_�����_�����_�����
	Choice from ��������� = ��������
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = ��������;
$End

$Pattern �������_��������� : operation
$Relevant_resources
	������          : ������� 		    Keep 	 Keep
	�����_����������: ������_���������� Keep 	 Keep
	������          : ������            NoChange Keep 
	_�������        : �������           NoChange Keep
$Time = 20//�_��������� (6, 1)
$Body
������
	Choice from ������.��������� = ������_��_���������
	Convert_begin
		��������� = ���������;
	Convert_end
		��������� = ����������_�����;
�����_����������
	Choice from �����_����������.�������������� = ������.�������������� and �����_����������.��������� = ��������
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = ��������;
������ 
	Choice from ������.�����_����������_������� = ������.�����_�������
	Convert_end
		��������� = ���������;
_������� 
	Convert_end
		����������_�����������_������ +=1;
$End

$Pattern �������_����� : operation
$Relevant_resources
	������     : �������      Keep Keep
	�����_�����: ������_����� Keep Keep
$Time = 20//�_����� (6, 1)  
$Body
������
	Choice from ������.��������� = ����������_�����
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = �����_�_��������;
		����������� = ��������;
�����_�����
	Choice from �����_�����.��������� = �������� and �����_�����.�������������� = ������.��������������
	Convert_begin
		��������� = �����;
	Convert_end
		��������� = ��������;
$End

$Pattern �������_��������_�������_�_���� : operation
$Relevant_resources
	������: ������� NoChange Erase
	����  : �����   NoChange Keep
$Time = 20//�_��������_�������_�_���� (6, 1)
$Body
������
����
	Choice from ������.��������� = ������_�_����
	Convert_end
		����������_�������_�_����� += 60; 
$End

$Pattern �������_��������_������ : rule
$Relevant_resources
	������: ������ Erase
$Body
������
	Choice from ������.��������� = ���������
$End
