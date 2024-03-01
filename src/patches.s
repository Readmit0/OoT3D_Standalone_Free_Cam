.arm

.section .patch_before_GlobalContext_Update
.global before_GlobalContext_Update_patch
before_GlobalContext_Update_patch:
    bl hook_before_GlobalContext_Update

.section .patch_after_GlobalContext_Update
.global after_GlobalContext_Update_patch
after_GlobalContext_Update_patch:
    b hook_after_GlobalContext_Update

.section .patch_loader
.global loader_patch
loader_patch:
    b hook_into_loader

.section .patch_CameraUpdate
.global CameraUpdate_patch
CameraUpdate_patch:
    bl hook_CameraUpdate

.section .patch_MultiplyPlayerSpeed
.global MultiplyPlayerSpeed_patch
MultiplyPlayerSpeed_patch:
    bl hook_MultiplyPlayerSpeed

.section .patch_RunAnimationSpeed
.global RunAnimationSpeed_patch
RunAnimationSpeed_patch:
    bl hook_RunAnimationSpeed

.section .patch_BugsRecatchable
.global BugsRecatchable_patch
BugsRecatchable_patch:
    nop

.section .patch_TruthSpinnerSpeed
.global TruthSpinnerSpeed_patch
TruthSpinnerSpeed_patch:
    cmp r2,#0x20
    strh r2,[r4,#0xC4]
    movgt r2,#0x20

.section .patch_AmyBlockCooldownTimer
.global AmyBlockCooldownTimer_patch
AmyBlockCooldownTimer_patch:
    mov r1,#0x1

.section .patch_AmyBlockSpeed
    .word 0x40800000

.section .patch_ArmosCooldownTimer
    mov r0,#0xC

.section .patch_ArmosPushSpeed
    .word 0x3F800000

.section .patch_FireBlockSpeed
    .word 0x3DCCCCCD

.section .patch_MovableBlockSpeed
    .word 0x40800000

.section .patch_MovableBlockCooldownTimer
.global MovableBlockCooldownTimer_patch
MovableBlockCooldownTimer_patch:
    mov r0,#0x1

.section .patch_MilkCrateSpeed
    .word 0x40800000

.section .patch_MilkCrateCooldownTimer
.global MilkCrateCooldownTimer_patch
MilkCrateCooldownTimer_patch:
    mov r0,#0x1

.section .patch_ISGCrouchStab
.global ISGCrouchStab_patch
ISGCrouchStab_patch:
    nop

.section .patch_ISGPutaway
.global ISGPutaway_patch
ISGPutaway_patch:
    nop

.section .patch_OoBBombchuOne
.global OoBBombchuOne_patch
OoBBombchuOne_patch:
    bl hook_OoBBombchuOne

.section .patch_OoBBombchuTwo
.global OoBBombchuTwo_patch
OoBBombchuTwo_patch:
    bl hook_OoBBombchuTwo

.section .patch_OoBBombchuThree
.global OoBBombchuThree_patch
OoBBombchuThree_patch:
    bl hook_OoBBombchuThree

.section .patch_ItemGiveBombchuDropOne
.global ItemGiveBombchuDropOne_patch
ItemGiveBombchuDropOne_patch:
    mov r1,#0x96

.section .patch_ItemGiveBombchuDropTwo
.global ItemGiveBombchuDropTwo_patch
ItemGiveBombchuDropTwo_patch:
    mov r1,#0x96

.section .patch_ConvertBombDropOne
.global ConvertBombDropOne_patch
ConvertBombDropOne_patch:
    b hook_ConvertBombDropOne

.section .patch_ConvertBombDropTwo
.global ConvertBombDropTwo_patch
ConvertBombDropTwo_patch:
    b hook_ConvertBombDropTwo
