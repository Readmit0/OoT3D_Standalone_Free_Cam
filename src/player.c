#include "z3D/z3D.h"


f32 Player_GetSpeedMultiplier(void) {
    f32 speedMultiplier = 1;

    gItemUsabilityTable[ITEM_MASK_KEATON] = 0x09;
    gItemUsabilityTable[ITEM_MASK_SKULL]  = 0x09;
    gItemUsabilityTable[ITEM_MASK_SPOOKY] = 0x09;
    gItemUsabilityTable[ITEM_MASK_BUNNY]  = 0x09;
    gItemUsabilityTable[ITEM_MASK_GORON]  = 0x09;
    gItemUsabilityTable[ITEM_MASK_ZORA]   = 0x09;
    gItemUsabilityTable[ITEM_MASK_GERUDO] = 0x09;
    gItemUsabilityTable[ITEM_MASK_TRUTH]  = 0x09;

    if (PLAYER->currentMask == 4 && PLAYER->stateFuncPtr == (void*)0x4BA378) {
        speedMultiplier *= 1.5;
    }
    return speedMultiplier;
}

const u32 ItemSlots[] = {
    0,  1,  2,  3,  4,  5,  6,  7,  7,  8,  9,  9,   10,  11,  12,  13,  14,  15,  16,  17,  18,  18, 18, 18,
    18, 18, 18, 18, 18, 18, 18, 18, 18, 23, 23, 23,  23,  23,  23,  23,  23,  23,  23,  23,  23,  22, 22, 22,
    22, 22, 22, 22, 22, 22, 22, 22, 3,  3,  3,  255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 24, 25,
};

typedef enum {
    AMMODROPS_VANILLA,
    AMMODROPS_BOMBCHU,
    AMMODROPS_NONE,
} AmmoDropsSetting;

u8 ammoDrops;

// overrides the incoming dropId to either a bombchu drop (5)
// or no drop (-1) as appropriate
u32 Item_ConvertBombDrop(u32 dropId) {
    u8 hasBombs  = (gSaveContext.items[ItemSlots[ITEM_BOMB]] != ITEM_NONE);
    u8 hasChus   = (gSaveContext.items[ItemSlots[ITEM_BOMBCHU]] != ITEM_NONE);
    u8 bombCount = gSaveContext.ammo[ItemSlots[ITEM_BOMB]];
    u8 chuCount  = gSaveContext.ammo[ItemSlots[ITEM_BOMBCHU]];

    if (gSettingsContext.ammoDrops != AMMODROPS_BOMBCHU) {
        if (hasBombs) {
            return dropId;
        } else {
            return -1;
        }
    }

    if (!hasBombs && !hasChus) {
        return -1;
    } else if (hasBombs && !hasChus) {
        return dropId;
    } else if (!hasBombs && hasChus) {
        return 5;
    } else {
        if (bombCount <= 15) {
            if (chuCount < bombCount) {
                return 5;
            } else {
                return dropId;
            }
        } else if (chuCount <= 15) {
            return 5;
        } else {
            if (gRandInt % 2) {
                return 5;
            } else {
                return dropId;
            }
        }
    }
}
