char chrtobyte(char);

void include(unsigned *, char);
void exclude(unsigned *, char);
unsigned substr(unsigned, unsigned);
unsigned intersection(unsigned, unsigned);
unsigned getunion(unsigned, unsigned);
unsigned difference(unsigned, unsigned);
char in(char, unsigned);

char chrtobyte(char c){
	c-=48;
	return c;
}

void include(unsigned *s, char c){
  *s |= (1<<c);
}
void exclude(unsigned *s, char c){
  *s &= ~(1<<c);
}
unsigned substr(unsigned s1, unsigned s2){
  return (s1 & ~s2);
}
unsigned intersection(unsigned s1, unsigned s2){
  return (s1 & s2);
}
unsigned getunion(unsigned s1, unsigned s2){
  return (s1 | s2);
}
unsigned difference(unsigned s1, unsigned s2){
  return (s1 ^ s2);
}
char in(char c, unsigned s){
  if (1<<c & s) return 255; else return 0;
}
