bits 64
default rel

section .text
global asm_cpuid

asm_cpuid:
;;  Arguments:
;; (u)EDI: CPUID input for EAX
;; (u)ESI: CPUID input for ECX
;; (*)RDX: CPUID output for EAX
;; (*)RCX: CPUID output for EBX
;; (*)R8:  CPUID output for ECX
;; (*)R9:  CPUID output for EDX
  push rbx
  push rcx
  push rdx

  mov eax, edi
  mov ecx, esi

  cpuid

  mov dword [r8], ecx
  mov dword [r9], edx
  pop rdx
  mov dword [rdx], eax
  pop rcx
  mov dword [rcx], ebx

  pop rbx
  ret

section .note.GNU-stack
;;; Shut up linker
