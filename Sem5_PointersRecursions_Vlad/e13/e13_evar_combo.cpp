{
Здравствуйте, Влад.
Вот, что вы мне задали: программа, которая выводит всевозможные комбинации РАЗМЕЩЕНИЕМ n чисел по k, которые вводятся пользователем. Как я и говорил, эта задача - очень простая.
k=3, n=3
123
132
231
213
321
312
}
// Ýòà ïðîãðàììà ïåðåáèðàåò âñå âîçìîæíûå ðàçìåùåíèÿ ÷èñåë îò 1 äî n ïî ê A(k,n)=n!/(n-k)!
#include <iostream>
#include <conio.h>
#include <clocale>
#include <string>
using namespace std;

string skolkonadoprobelov(int u)
{
	string s="";
	for (int i=1; i<=(4-(u>9)-(u>99)-(u>999)-(u>9999) ); i++)
	{
		s+=" ";
	}
	return s;
	
}
int fucktorial(int x)
{
	int z=x;
	x=1;
	for (int y=1; y<=z; y++)
		x*=y;
	return x;
}
int n=6,k=4;
int sese[255];
bool inn(int i)
{
	for (int x=1;x<=k;x++)
	{
		if (sese[x]==i) return true;
	}
	return false;
}
void letsrock(int ks, int* u)
{
	for (int i=1; i<=n; i++)
	{
		if (inn(i)) continue;
		sese[k-ks+1]=i;
		if (ks==1) 
		{
			cout << ++*u << "." << skolkonadoprobelov(*u);
			for (int a=1; a<=k; a++)
				cout << sese[a] << " ";
			cout << endl;
		} else {
			letsrock(ks-1,u);	
		}
		sese[k-ks+1]=-1;
	}
}

int main()
{
	int *u = new int(0);
	setlocale(LC_CTYPE,"Russian");
	/*
// Äëÿ íà÷àëà ïîïðîáóåì âûâåñòè âñå êîìáèíàöèè ïî ÷åòûðå èç 6-è
	int u=0;
	for (int i1=1; i1<=6; i1++)
	{
		for (int i2=1; i2<=6; i2++)
		{
			if (i2==i1) continue;
			for (int i3=1; i3<=6; i3++)
			{
				if (i3==i2) continue;
				if (i3==i1) continue;
				for (int i4 = 1; i4<=6; i4++)
				{
					if (i4==i3) continue;
					if (i4==i2) continue;
					if (i4==i1) continue;
					cout << ++u << "." << skolkonadoprobelov(u) << i1 << " " << i2 << " " << i3 << " " << i4 << endl;
				}
			}
		}
	}
	cout << endl;
	cout << "Âñåãî: " << (fucktorial(n)/(fucktorial(n-k) )  ) << " êîìáèíàöèé." << endl;
	cout << endl;*/
	cout << "Ýòî ïðîãðàììà, êîòîðàÿ âûâîäèò âñå âîçìîæíûå êîìáèíàöèè ðàçìåùåíèÿ ÷èñåë n ïî k.\n";
	cout << "Ââåäèòå n, ïîæàëóéñòà: \a";
	cin >> n;
	cout << "\nÂâåäèòå ê, ïîæàëóéñòà: \a";
	cin >> k;
	for (int i=1;i<=k;i++)
	{
		sese[i]=INT_MAX;
	}
	letsrock(k,u); // Çàïóñê
	cout << endl;
	cout << "Âñåãî: " << (fucktorial(n)/(fucktorial(n-k) )  ) << " êîìáèíàöèé(-è/ÿ)." << endl;
	delete u;
	_getch();
	return 0;
}
