#include "s21_cat.h"

int main(int argc, char *argv[]) {
  flag flags = {0};
  read_flags(argc, argv, &flags);
  cat_add(argc, argv, &flags);
  return 0;
}

void cat_add(int argc, char *argv[], flag *flags) {
  FILE *file;
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] != '-') {
      file = fopen(argv[i], "r");
      f_processer(flags, file);
    }
  }
}

int read_flags(int argc, char *argv[], flag *flags) {
  int cur_f = 0;
  struct option long_options[] = {{"number-nonblank", no_argument, 0, 'b'},
                                  {"number", no_argument, 0, 'n'},
                                  {"squeeze-blank", no_argument, 0, 's'},
                                  {0, 0, 0, 0}};
  while ((cur_f = getopt_long(argc, argv, "bevEnstT", long_options, NULL)) !=
         -1) {
    switch (cur_f) {
      case 'b':
        flags->b = true;
        flags->n = false;
        break;
      case 'e':
        flags->e = true;
        flags->v = true;
        break;
      case 'v':
        flags->v = true;
        break;
      case 'E':
        flags->e = true;
        break;
      case 'n':
        flags->n = true;
        if (flags->b) flags->n = false;
        break;
      case 's':
        flags->s = true;
        break;
      case 't':
        flags->t = true;
        flags->v = true;
        break;
      case 'T':
        flags->t = true;

        break;
      case '?':
        fprintf(
            stderr,
            "cat: illegal option -- p\n usage: cat [-belnstuv] [file ...]\n");
    }
  }
  return optind;
}

void f_processer(flag *flags_state, FILE *file) {
  struct storage buf = {10, 0};
  int ch;
  bool print_bloker_s = false;
  int line_counter = 1;
  int gap_counter = 0;

  while ((ch = fgetc(file)) != EOF) {
    buf.current = ch;
    if (flags_state->b == true) {
      flag_b(buf, &line_counter);
    }
    if (flags_state->s == true) {
      flag_s(buf, &gap_counter, &print_bloker_s);
    }
    if (flags_state->n == true) {
      flag_n(buf, &line_counter, &print_bloker_s);
    }
    if (flags_state->e == true) {
      flag_e(buf, &print_bloker_s, flags_state);
    }
    if (flags_state->t == true) {
      flag_t(&buf);
    }
    if (flags_state->v == true) {
      flag_v(&buf);
    }
    if (flags_state->s == 1) {
      if (buf.current == '\n' && print_bloker_s == false) {
        printf("%c", buf.current);
      } else if (buf.current != '\n') {
        printf("%c", buf.current);
      }
    } else if (flags_state->s == 0) {
      printf("%c", buf.current);
    }
    buf.previous = ch;
  }
}

void flag_b(struct storage buf, int *line_counter) {
  if ((buf.previous == '\n') && (buf.current != '\n')) {
    printf("%6d\t", (*line_counter)++);
  }
}

void flag_s(struct storage buf, int *gap_counter, bool *print_bloker_s) {
  if ((buf.previous == '\n') && (buf.current == '\n')) {
    (*gap_counter)++;
  } else {
    *gap_counter = 0;
  }
  *print_bloker_s = (*gap_counter >= 2);
}

void flag_n(struct storage buf, int *line_counter, bool *print_bloker_s) {
  if (buf.previous == 10 && (*print_bloker_s == false)) {
    printf("%6d\t", (*line_counter)++);
  }
}

void flag_e(struct storage buf, bool *print_bloker_s, flag *flags_state)  //?
{
  if (buf.current == 10 && ((*print_bloker_s) == false)) {
    if (flags_state->b && buf.current == '\n' && buf.previous == '\n') {
      printf("      \t$");
    } else {
      printf("$");
    }
  }
}

void flag_t(struct storage *buf) {
  if (buf->current == '\t') {
    buf->current += 64;
    printf("^");
  }
}

void flag_v(struct storage *buf) {
  if ((buf->current >= 0 && buf->current <= 32) &&
      (buf->current != ' ' && buf->current != '\n' && buf->current != '\r' &&
       buf->current != '\t')) {
    buf->current += 64;
    printf("^");
  }
  if (buf->current == 127) {
    buf->current -= 64;
    printf("^");
  }
}
