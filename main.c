#include "libasm.h"		/*	assembly lib			*/
#include <unistd.h>		/*	read & write			*/
#include <stdlib.h>		/*	malloc & free			*/
#include <string.h>		/*	strlen, strcmp, strcpy	*/
#include <stdio.h>		/*	printf					*/
#include <fcntl.h>		/*	O_CREAT etc.			*/

int main(void)
{
	char *mystr;
	char *str;
	char mylen;
	char len;
	int fd;

	mylen = ft_strlen("This string is 34 characters long\n");
	len = ft_strlen("This string is 34 characters long\n");
	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strlen   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");

	printf("\033[38;5;28mMy strlen: %d\n", mylen);
	printf("\033[38;5;22mOG strlen: %d\n", len);

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strcpy   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");

	mystr = malloc(sizeof(char) * mylen);
	if (!mystr)
		return (-1);
	str = malloc(sizeof(char) * len);
	if (!str)
		return (-1);
	ft_strcpy(mystr, "This string is characters long");
	strcpy(str, "This string is 34 characters long");
	printf("\033[38;5;28mMy strcpy: %s\n", mystr);
	printf("\033[38;5;22mOG strcpy: %s\n", str);

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strcmp   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");

	printf("\033[38;5;28mMy strcmp: %d\n",
		ft_strcmp(mystr, str));
	printf("\033[38;5;22mOG strcmp: %d\n",
		strcmp(mystr, str));
	free (str);
	free (mystr);

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝    ft_write   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\033[38;5;28m\n");

	ft_write(1, "My write lemao\n", 16);
	perror("error status");
	errno = 0;
	write(1, "OG write lemao\n", 16);
	perror("error status");
	errno = 0;
	printf("\033[38;5;46m  _______________ fd = -1 _______________\033[38;5;22m\n\n");
	ft_write(-1, "My write lemao\n", 16);
	perror("error status");
	errno = 0;
	write(-1, "OG write lemao\n", 16);
	perror("error status");
	errno = 0;

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝    ft_read    ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\033[38;5;28m\n");

	mystr = malloc(sizeof(char) * 30);
	if (!mystr)
		return (-1);
	str = malloc(sizeof(char) * 30);
	if (!str)
		return (-1);

	fd = open("file", O_RDONLY);
	ft_read(fd, mystr, 30);
	mystr[29] = '\0';
	printf("My read: [%s]\n", mystr);
	perror("error status");
	errno = 0;
	close(fd);

	fd = open("file", O_RDONLY);
	read(fd, str, 30);
	str[29] = '\0';
	printf("Their read: [%s]\n", str);
	perror("error status");
	errno = 0;
	close(fd);

	free (str);
	free (mystr);

	printf("\033[38;5;46m  _______________ fd = -1 _______________\033[38;5;22m\n\n");
	ft_read(-1, "My read lemao\n", 16);
	perror("error status");
	errno = 0;
	read(-1, "OG read lemao\n", 16);
	perror("error status");
	errno = 0;

	printf("\033[38;5;46m▛▝▝▝▝▝▝▝▝▝▝▝▝▝   ft_strdup   ▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜\n");

	mystr = malloc(sizeof(char) * mylen);
	if (!mystr)
		return (-1);
	str = malloc(sizeof(char) * len);
	if (!str)
		return (-1);
	mystr = ft_strdup("This string is 34 characters long");
	str = strdup("This string is 34 characters long");
	printf("\033[38;5;28mMy strdup: %s\n", mystr);
	printf("\033[38;5;22mOG strdup: %s\n", str);

	printf("\033[38;5;46m▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖     END      ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟\n");


	free (str);
	free (mystr);
	return (0);
}
