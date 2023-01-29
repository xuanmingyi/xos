
void kmain(void) {
	const char *str = "my first kernel";
	
	char *videoptr = (char*) 0xb8000;

	unsigned int i = 0;
	unsigned int j = 0;
	unsigned int screensize = 80 * 25 * 2;

	while( j < screensize) {
		videoptr[j] = ' ';
		videoptr[j+1] = 0x07;
		j = j + 2;
	}

	j = 0;

	while(str[j] != '\0') {
		videoptr[i] = str[j];
		videoptr[i+1] = 0x07;
		++j;
		i = i + 2;
	}
	return;
}
