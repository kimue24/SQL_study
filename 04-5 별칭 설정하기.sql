--���� ������� ����Ͽ� ����ϱ�
SELECT ENAME, SAL, SAL*12+COMM, COMM
FROM EMP;

--���ϱ⸦ ������� �ʰ� ����� ���� �� ���� ����ϱ�
SELECT ENAME, SAL*12+COMM, COMM
FROM EMP;

--��Ī�� ����Ͽ� ����� ���� �� ���� ����ϱ�
SELECT ENAME AS �̸�, SAL AS �޿�, SAL*12+COMM AS �߰���,COMM AS ��Ī
FROM EMP;