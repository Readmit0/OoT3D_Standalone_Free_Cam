.arm
.text

.global hook_before_GlobalContext_Update
hook_before_GlobalContext_Update:
    push {r0-r12, lr}
    bl before_GlobalContext_Update
    pop {r0-r12, lr}
    cpy r7,r0
    bx lr

.global hook_after_GlobalContext_Update
hook_after_GlobalContext_Update:
    push {r0-r12, lr}
    bl after_GlobalContext_Update
    pop {r0-r12, lr}
.if _JP_==1
    b 0x2E2108
.else
# both USA and EUR
    b 0x2E25F0
.endif

.section .loader
.global hook_into_loader
hook_into_loader:
    push {r0-r12, lr}
    bl loader_main
    pop {r0-r12, lr}
    bl 0x100028
    b  0x100004

.global hook_CameraUpdate
hook_CameraUpdate:
    push {r0-r12, lr}
    cpy r0,r1
    bl Camera_FreeCamEnabled
    cmp r0,#0x0
    pop {r0-r12, lr}
    cpyeq r6,r0
    bxeq lr
    bl Camera_FreeCamUpdate
    ldmia sp!,{r4-r11,pc}

.global hook_MultiplyPlayerSpeed
hook_MultiplyPlayerSpeed:
    vldr.32 s0,[r6,#0x21C]
    push {r0-r12, lr}
    bl Player_GetSpeedMultiplier
    vmov s1,r0
    pop {r0-r12, lr}
    vmul.f32 s0,s1
    bx lr

.global hook_RunAnimationSpeed
hook_RunAnimationSpeed:
    vldr.32 s17,[r5,#0x21C]
    push {r0-r12, lr}
    bl Player_GetSpeedMultiplier
    vmov s1,r0
    pop {r0-r12, lr}
    vmul.f32 s17,s1
    bx lr

.global hook_OoBBombchuOne
hook_OoBBombchuOne:
    cmp r5,#0x0
    bxeq lr
    ldrsh r0,[r5,#0xA]
    bx lr

.global hook_OoBBombchuTwo
hook_OoBBombchuTwo:
    cmp r5,#0x0
    bxeq lr
    ldrsh r0,[r5,#0xC]
    bx lr

.global hook_OoBBombchuThree
hook_OoBBombchuThree:
    cmp r5,#0x0
    bxeq lr
    ldrsh r0,[r5,#0xE]
    bx lr
