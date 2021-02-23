#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>
#include <errno.h>

extern size_t	ft_strlen(char *str);
extern char		*ft_strcpy(char *dest, char *src);
extern int		ft_strcmp(char *s1, char *s2);
extern size_t	ft_write(int fd, void *buf, size_t size);
extern ssize_t	ft_read(int fd, void *buf, size_t count);
extern char 	*ft_strdup(const char *s);

#endif
