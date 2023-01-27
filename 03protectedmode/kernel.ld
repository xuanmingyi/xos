SECTIONS
{
	. = 0xc0001500;
	.text :
	{
		kernel_main = .;
		*(.text)
	}
}
