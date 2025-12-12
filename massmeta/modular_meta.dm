/*
 * Это основной файл куда будут складываться все наши модульные добавления.
 * Добавлять только:
 *	Модули (.dm файлами)
 * Сам этот файл добавлен в tgstation.dme
 *
 * Все Defines файлы лежат в папке "~meta_defines\"
 *
 * Все файлы должны быть в алфавитном порядке
 */

// Modular files (covered with tests)

// BEGIN_INCLUDE
#include "features\hardsuits\includes.dm"
#include "features\kvass\includes.dm"
#include "features\smites\includes.dm"
#include "features\soviet_crate\includes.dm"
// END_INCLUDE


//master files (unsorted, TODO: need modularization)

#include "code\modules\clothing\clothing.dm"
#include "code\modules\surgery\organs\tongue.dm"
#include "code\modules\surgery\bodyparts\head.dm"
#include "code\modules\mob\living\carbon\human\emote.dm"
#include "code\modules\antags\heretic\items\heretic_armor.dm"
#include "code\obj\items\clothing\masks.dm"
#include "code\modules\research.dm"
#include "code\obj\structures\display_case.dm"
#include "code\modules\antags\uplink_items.dm"
#include "code\obj\items\clothing\belt.dm"
#include "code\modules\announcers.dm"
#include "code\modules\reagents\chemistry\reagents\nitrium.dm"
#include "code\modules\mob\living\simple_animal\hostile\megafauna\colossus.dm"
#include "code\modules\mob\living\basic\space_fauna\space_dragon\space_dragon.dm"
#include "code\modules\projectiles\projectile\beams.dm"
#include "code\modules\mining\lavaland\megafauna_loot.dm"
#include "code\modules\hooch.dm"
#include "code\datums\quirks\positive_quirks\augmented.dm"
#include "code\modules\map_vote.dm"
#include "code\modules\hallucination\fake_chat.dm"

//gay removal (6.21 КоАП РФ)
#include "code\modules\clothing\under\accessories\badges.dm"

//oguzok in kitchen, huh?
#include "code\modules\clothing\under\undersuit.dm"

//Testicular_torsion wizard
#include "code\modules\spells\spell_types\touch\testicular_torsion.dm"
#include "code\modules\antags\wizard\equipment\spellbook_entries\offensive.dm"
