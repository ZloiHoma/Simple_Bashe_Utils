#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define true 1
#define false 0

typedef struct flags {
  bool b;
  bool e;
  bool n;
  bool s;
  bool t;
  bool v;
} flag;

struct storage {
  char previous;
  char current;
};

void cat_add(int argc, char *argv[], flag *flags);
int read_flags(int argc, char *argv[], flag *flags);
void f_processer(flag *flags_state, FILE *file);
void flag_b(struct storage buf, int *line_counter);
void flag_s(struct storage buf, int *gap_counter, bool *print_bloker_s);
void flag_n(struct storage buf, int *line_counter, bool *print_bloker_s);
void flag_e(struct storage buf, bool *print_bloker_s, flag *flags_state);
void flag_t(struct storage *buf);
void flag_v(struct storage *buf);
