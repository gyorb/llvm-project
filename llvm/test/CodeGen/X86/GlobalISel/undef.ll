; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-linux-gnu -global-isel -verify-machineinstrs < %s -o - | FileCheck %s --check-prefix=ALL

define i8 @test() {
; ALL-LABEL: test:
; ALL:       # %bb.0:
; ALL-NEXT:    retq
  ret i8 undef
}

define i8 @add_undef_i8(i8 %a) {
; ALL-LABEL: add_undef_i8:
; ALL:       # %bb.0:
; ALL-NEXT:    movl %edi, %eax
; ALL-NEXT:    addb %al, %al
; ALL-NEXT:    # kill: def $al killed $al killed $eax
; ALL-NEXT:    retq
  %r = add i8 %a, undef
  ret i8 %r
}

define i16 @add_undef_i16(i16 %a) {
; ALL-LABEL: add_undef_i16:
; ALL:       # %bb.0:
; ALL-NEXT:    movl %edi, %eax
; ALL-NEXT:    addw %ax, %ax
; ALL-NEXT:    # kill: def $ax killed $ax killed $eax
; ALL-NEXT:    retq
  %r = add i16 %a, undef
  ret i16 %r
}

define i16 @add_undef_i16_commute(i16 %a) {
; ALL-LABEL: add_undef_i16_commute:
; ALL:       # %bb.0:
; ALL-NEXT:    addw %di, %ax
; ALL-NEXT:    retq
  %r = add i16 undef, %a
  ret i16 %r
}

define i32 @add_undef_i32(i32 %a) {
; ALL-LABEL: add_undef_i32:
; ALL:       # %bb.0:
; ALL-NEXT:    movl %edi, %eax
; ALL-NEXT:    addl %eax, %eax
; ALL-NEXT:    retq
  %r = add i32 %a, undef
  ret i32 %r
}

define float @test3() {
; ALL-LABEL: test3:
; ALL:       # %bb.0:
; ALL-NEXT:    retq
  ret float undef
}

define float @test4(float %a) {
; ALL-LABEL: test4:
; ALL:       # %bb.0:
; ALL-NEXT:    addss %xmm0, %xmm0
; ALL-NEXT:    retq
  %r = fadd float %a, undef
  ret float %r
}

