#include "libasm.h"
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

int main(void)
{
	char *mystr;
	char *str;
	char mylen;
	char len;

	mylen = ft_strlen("This string is 34 characters long\n");
	len = ft_strlen("This string is 34 characters long\n");
	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strlen   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");
	printf("\033[38;5;28mMy strlen: %d\n", mylen);
	printf("\033[38;5;22mOG strlen: %d\n", len);

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strcpy   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");
	mystr = malloc(sizeof(char) * mylen);
	str = malloc(sizeof(char) * len);
	ft_strcpy(mystr, "This string is characters long");
	strcpy(str, "This string is 34 characters long");
	printf("\033[38;5;28mMy strcpy: %s\n", mystr);
	printf("\033[38;5;22mOG strcpy: %s\n", str);

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strcmp   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");
	printf("\033[38;5;28mMy strcmp: %d\n",
		ft_strcmp(mystr, str));
	printf("\033[38;5;22mOG strcmp: %d\n",
		strcmp(mystr, str));

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝    ft_write   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");
	printf("\033[38;5;28m");
	ft_write(-1, "My write lemao\n", 16);
	perror("error lemao");
	printf("\033[38;5;22m");
	write(1, "OG write lemao\n", 16);
	printf("\033[38;5;46m▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖     END      ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟\n");


	free (str);
	free (mystr);
	return (0);
}
