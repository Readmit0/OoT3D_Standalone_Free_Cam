OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(loader_patch)
SECTIONS
{
	. = 0x100000;
	.patch_loader 0x100000 : {
		*(.patch_loader)
	}

	.patch_CameraUpdate 0x2D84C8 : {
		*(.patch_CameraUpdate)
	}

	.patch_before_GlobalContext_Update 0x4523B0 : {
		*(.patch_before_GlobalContext_Update)
	}

	.patch_after_GlobalContext_Update 0x452454 : {
		*(.patch_after_GlobalContext_Update)
	}

	.patch_MultiplyPlayerSpeed 0x251D34 : {
		*(.patch_MultiplyPlayerSpeed)
	}

	.patch_RunAnimationSpeed 0x2BE70C : {
		*(.patch_RunAnimationSpeed)
	}

	.patch_BugsRecatchable 0x212090 : {
		*(.patch_BugsRecatchable)
	}

	.patch_TruthSpinnerSpeed 0x1CD814 : {
		*(.patch_TruthSpinnerSpeed)
	}

	.patch_AmyBlockCooldownTimer 0x196ECC : {
		*(.patch_AmyBlockCooldownTimer)
	}

	.patch_AmyBlockSpeed 0x196F3C : {
		*(.patch_AmyBlockSpeed)
	}

	.patch_ArmosCooldownTimer 0x10B41C : {
		*(.patch_ArmosCooldownTimer)
	}

	.patch_ArmosPushSpeed 0x10B5C4 : {
		*(.patch_ArmosPushSpeed)
	}

	.patch_FireBlockSpeed 0x3E0BB4 : {
		*(.patch_FireBlockSpeed)
	}

	.patch_ISGCrouchStab 0x360690 : {
		*(.patch_ISGCrouchStab)
	}

	.patch_ISGPutaway 0x32B4AC : {
		*(.patch_ISGPutaway)
	}

	. = 0x4C99A8;
	. = ALIGN(4);
	.loader : {
		*(.loader*)
	}

	. = 0x005C7000;
	.text : {
		__text_start = . ;
		*(.text)
		*(.text.*)
		*(.rodata)
		*(.data)
		*(.bss)
		*(COMMON)
		__text_end  = . ;
	}
}
