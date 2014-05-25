/*
Здравствуйте, Влад.
Тут программа, что вы вчера задали - игра против искусственного интеллекта, где надо из цепочки чисел брать слева 2 или 1, и у кого к концу будет больше - тот и победил. 
*/
#include <iostream>
#include <cstdlib>
#include <time.h>
using namespace std;

const int fish = 20;
int h;
int k[fish];
int rez[fish];
int answers[fish];

int f (int i)
{
	if (answers[i] != INT_MAX) return answers[i]; else
	{
		int o=0,d=0;
		if (i<fish-1)
		{  //42
			o=f(i+1); //o - ÷òî áóäåò ó âðàãà, åñëè ìû âûáåðåì 1  27
			if (i<fish-2) d=f(i+2); //d - ÷òî áóäåò ó âðàãà, åñëè âûáåðåì 2  51
			if (k[i]+k[i+1]-d>=k[i]-o) {answers[i]=k[i]+k[i+1]-d; return (k[i]+k[i+1]-d);} else {answers[i]=k[i]-o; return (k[i]-o);};
		} else {answers[i]=k[i]; return k[i];}
	}
}

int main ()
{
	setlocale(0,"");
	srand((unsigned)time(NULL));
	cout << endl;
	cout << "Ýòî èãðà, â êîòîðîé íåâîçìîæíî âûèãðàòü. /n";
	cout << "Ëó÷øåå, ÷òî âàñ ìîæåò æäàòü - ýòî íè÷åéíàÿ ñìåðòü./n";
	cout << "Èãðàåòå âû è êîìïüþòåð äâàæäû ñ îäíèì íàáîðîì ÷èñåë: /n";
	cout << "Îäèí ðàç - êîãäà ïåðâûì õîäèòå âû;/n";
	cout << "Âòîðîé ðàç - êîãäà ïåðâûì õîäèò êîìïüþòåð;/n";
	cout << "Êàæäûé õîä âû ìîæåòå âçÿòü ñëåâà îäíî èëè äâà ÷èñëà, ñîîòâåòñòâåííî ââîäÿ '1' èëè '2', âçÿòûå ÷èñëà ïðèáàâëÿþòñÿ ê âàøèì î÷êàì./n";
	cout << "Ïîáåæäàåò òîò, êòî íàáåð¸ò ê êîíöó áîëüøå î÷êîâ./n";
	cout << endl;
	for (int i=0; i<fish; i++){
		h = (rand() % 50) + 1;
		k[i]=h;
		answers[i]=INT_MAX;
		rez[i]=h;
	}
	int igrok = 0,comp = 0;
	int ukaz = 0; 
	int IiliII;
	for (int n=ukaz; n<fish; n++)
			cout << k[n] << " ";
		cout << endl;
		cout << "Your score = " << igrok << endl;
		cout << endl;
	while (k[fish-1] != 0) {
		//Õîä ÷åëîâåêà...
		if (k[fish-1]==0) break;
		cout << endl;
		cout << "Your turn: ";
		cin >> IiliII;
		if (IiliII > 2) break;
		if (IiliII < 1) break;
		igrok+=k[ukaz];
		k[ukaz]=0;
		ukaz++;
		if (k[fish-1]==0) break;
		if (IiliII > 1) {
			igrok+=k[ukaz];
			k[ukaz]=0;
			ukaz++; 
		}
		if (k[fish-1]==0) break;
		for (int n=ukaz; n<fish; n++)
			cout << k[n] << " ";
		cout << endl;
		cout << "Your score = " << igrok << endl;
		cout << endl;
		//Òåïåðü õîä êîìïüþòåðà...
		if (k[fish-1]==0) break;
		cout << "CPU's turn... ";
		if (fish-ukaz>2) {if ( k[ukaz]+k[ukaz+1]-f(ukaz + 2) > k[ukaz]-f(ukaz + 1) ) IiliII=2; else IiliII=1;} else IiliII=fish-ukaz;
		cout << IiliII << endl;
		comp+=k[ukaz];
		k[ukaz]=0;
		ukaz++;
		if (k[fish-1]==0) break;
		if (IiliII == 2)
		{
			comp+=k[ukaz];
			k[ukaz]=0;
			ukaz++;
		}  
		cout << "CPU's score = " << comp << endl;
		for (int n=ukaz; n<fish; n++)
			cout << k[n] << " ";
		cout << endl;
	}
	cout << "Âaø ñ÷¸ò - " << igrok << endl;
	int rezigrok = igrok;
	cout << "Ñ÷¸ò ìàøèíû - " << comp << endl;
	int rezcomp = comp;
	if (igrok > comp) cout << "Ïîçäðàâëÿþ ñ ïîáåäîé! /n";
	else if (comp > igrok) cout << "Ïîçäðàâëÿþ ñ ïðîèãðûøåì! /n";
	else cout << "Ïîçäðàâëÿþ ñ íè÷ü¸é! /n";
	cout << endl;
	cout << "À òåïåðü äàâàéòå ïîïðîáóåì íàîáîðîò è ïîñìîòðèì, êàêîé áóäåò ðåçëüòàò: ";
	cout << endl;
	cout << endl;

	igrok = 0;
	comp = 0;
	ukaz = 0; 
	for (int i=0; i<fish; i++){
		k[i]=rez[i];
	}	
	for (int n=ukaz; n<fish; n++)
		cout << k[n] << " ";
	cout << endl;
	cout << "Your score = " << igrok << endl;
	cout << endl;
	while (k[fish-1] != 0) {
		//Òåïåðü õîä êîìïüþòåðà...
		if (k[fish-1]==0) break;
		cout << "CPU's turn... ";
		if (fish-ukaz>2) {if ( k[ukaz]+k[ukaz+1]-f(ukaz + 2) > k[ukaz]-f(ukaz + 1) ) IiliII=2; else IiliII=1;} else IiliII=fish-ukaz;
		cout << IiliII << endl;
		comp+=k[ukaz];
		k[ukaz]=0;
		ukaz++;
		if (k[fish-1]==0) break;
		if (IiliII == 2)
		{
			comp+=k[ukaz];
			k[ukaz]=0;
			ukaz++;
		}  
		cout << "CPU's score = " << comp << endl;
		for (int n=ukaz; n<fish; n++)
			cout << k[n] << " ";
		cout << endl;
		//Õîä ÷åëîâåêà...
		if (k[fish-1]==0) break;
		cout << endl;
		cout << "Your turn: ";
		cin >> IiliII;
		if (IiliII > 2) break;
		if (IiliII < 1) break;
		igrok+=k[ukaz];
		k[ukaz]=0;
		ukaz++;
		if (k[fish-1]==0) break;
		if (IiliII > 1) {
			igrok+=k[ukaz];
			k[ukaz]=0;
			ukaz++; 
		}
		if (k[fish-1]==0) break;
		for (int n=ukaz; n<fish; n++)
			cout << k[n] << " ";
		cout << endl;
		cout << "Your score = " << igrok << endl;
		cout << endl;
	}
	cout << "Âaø ñ÷¸ò, êàê 1-âîõîäÿùåãî - " << igrok << endl;
	cout << "À êîìïüþòåð èç òàêîãî ïîëîæåíèÿ íàáðàë - " << rezcomp << endl;
	cout << endl;
	cout << "Ñ÷¸ò ìàøèíû, êàê 2-ðîõîäÿùåãî - " << comp << endl;
	cout << "À âû èç òàêîãî ïîëîæåíèÿ íàáðàëè - " << rezigrok << endl;
	if (igrok > comp) cout << "Ïîçäðàâëÿþ ñ ïîáåäîé! /n";
	else if (comp > igrok) cout << "Ïîçäðàâëÿþ ñ ïðîèãðûøåì! /n";
	else cout << "Ïîçäðàâëÿþ ñ íè÷ü¸é! /n";
	system("pause");
	return 0;
}
