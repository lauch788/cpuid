#include <inttypes.h>
#include <stdio.h>

extern void asm_cpuid(uint32_t eax_in,
                      uint32_t ecx_in,
                      uint32_t *eax,
                      uint32_t *ebx,
                      uint32_t *ecx,
                      uint32_t *edx);

static int
check_sse(void)
{
  uint32_t eax = { 0 };
  uint32_t ebx = { 0 };
  uint32_t ecx = { 0 };
  uint32_t edx = { 0 };

  asm_cpuid(0x0000000D, 0, &eax, &ebx, &ecx, &edx);

  return !!(eax & 0x1);
}

int
main(int argc, char *argv[])
{
  printf("%d\n", check_sse());
  return 0;
}
