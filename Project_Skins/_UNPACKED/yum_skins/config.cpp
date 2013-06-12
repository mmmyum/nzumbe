// config.bin - 23:59:02 06/11/13, generated in 0.05 seconds
// Generated by unRap v1.06 by Kegetys
// Separate rootclasses: Disabled, Automatic comments: Enabled

#define private		0
#define protected		1
#define public		2

#define TEast		0
#define TWest		1
#define TGuerrila		2
#define TCivilian		3
#define TSideUnknown		4
#define TEnemy		5
#define TFriendly		6
#define TLogic		7

#define true	1
#define false	0

class CfgPatches {
	class yum_skins {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"dayz"};
	};
};

class CfgMagazines {
	class CA_Magazine;	// External class reference
	
	class SkinBase : CA_Magazine {
		scope = private;
		count = 1;
		type = 256;
		displayName = "Clothes";
		model = "\dayz_equip\models\cloth_parcel.p3d";
		picture = "\dayz_equip\textures\equip_cloth_parcel_ca.paa";
		descriptionShort = "Clothes Parcel";
		
		class ItemActions {
			class Use {
				text = "Wear %1";
				script = "spawn player_wearClothes;";
			};
			
			class Crafting {
				text = "Craft Canvas";
				script = "spawn player_craftItem;";
				neednearby[] = {};
				requiretools[] = {"ItemToolbox", "ItemKnife"};
				output[] = {{"ItemCanvas", 1}};
				input[] = {{"SkinBase", 4}};
			};
		};
	};
	
	class Skin_Sniper1_DZ : SkinBase {
		scope = public;
		displayName = $STR_EQUIP_NAME_43;
		descriptionShort = $STR_EQUIP_DESC_43;
	};
	
	class Skin_Rocket_DZ : SkinBase {
		scope = public;
		displayName = "Officer Suit";
		descriptionShort = "Officer Suit";
	};
	
	class Skin_RU_Policeman_DZ : SkinBase {
		scope = public;
		displayName = "Police Officer Uniform";
		descriptionShort = "Police Officer Uniform";
	};
	
	class Skin_Pilot_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Pilot Uniform";
		descriptionShort = "Pilot Uniform";
	};
	
	class Skin_Haris_Press_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Press Uniform";
		descriptionShort = "Press Uniform";
	};
	
	class Skin_Ins_Soldier_GL_DZ : SkinBase {
		scope = public;
		displayName = "Terrorist Uniform";
		descriptionShort = "Terrorist Uniform";
	};
	
	class Skin_GUE_Commander_DZ : SkinBase {
		scope = public;
		displayName = "Rebel Uniform";
		descriptionShort = "Rebel Uniform";
	};
	
	class Skin_Functionary1_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Business Suit";
		descriptionShort = "Business Suit";
	};
	
	class Skin_Priest_DZ : SkinBase {
		scope = public;
		displayName = "Priest Outfit";
		descriptionShort = "Priest Outfit";
	};
	
	class Skin_Rocker1_DZ : SkinBase {
		scope = public;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (black)";
	};
	
	class Skin_Rocker2_DZ : SkinBase {
		scope = public;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (brown)";
	};
	
	class Skin_Rocker3_DZ : SkinBase {
		scope = public;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (blue)";
	};
	
	class Skin_Rocker4_DZ : SkinBase {
		scope = public;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (green)";
	};
	
	class Skin_Bandit1_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Outfit";
		descriptionShort = "Bandit Outfit";
	};
	
	class Skin_Bandit2_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Camo";
		descriptionShort = "Bandit Camo Outfit";
	};
	
	class Skin_GUE_Soldier_MG_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Gunner";
		descriptionShort = "Bandit Gunner Outfit";
	};
	
	class Skin_GUE_Soldier_Sniper_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Sniper";
		descriptionShort = "Bandit Sniper Outfit";
	};
	
	class Skin_GUE_Soldier_Crew_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Baklava";
		descriptionShort = "Bandit Baklava Outfit";
	};
	
	class Skin_GUE_Soldier_CO_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Mask";
		descriptionShort = "Bandit Mask Outfit";
	};
	
	class Skin_GUE_Soldier_2_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Hat";
		descriptionShort = "Bandit Hat with Baklava";
	};
	
	class Skin_BanditW1_DZ : SkinBase {
		scope = public;
		displayName = "Bandit (female)";
		descriptionShort = "Bandit (female)";
	};
	
	class Skin_BanditW2_DZ : SkinBase {
		scope = public;
		displayName = "Bandit Camo (female)";
		descriptionShort = "Bandit Camo (female)";
	};
	
	class Skin_SurvivorW3_DZ : SkinBase {
		scope = public;
		displayName = "Camo Pants (female)";
		descriptionShort = "Camo Pants (female)";
	};
	
	class Skin_SurvivorW2_DZ : SkinBase {
		scope = public;
		displayName = "Civilian (female)";
		descriptionShort = "Civilian (female)";
	};
	
	class Skin_SurvivorWpink_DZ : SkinBase {
		scope = public;
		displayName = "Pink (female)";
		descriptionShort = "Pink Clothes (female)";
	};
	
	class Skin_SurvivorWcombat_DZ : SkinBase {
		scope = public;
		displayName = "Camo (female)";
		descriptionShort = "Camo Clothes (female)";
	};
	
	class Skin_SurvivorWdesert_DZ : SkinBase {
		scope = public;
		displayName = "Desert (female)";
		descriptionShort = "Desert Clothes (female)";
	};
	
	class Skin_SurvivorWurban_DZ : SkinBase {
		scope = public;
		displayName = "Urban (female)";
		descriptionShort = "Urban Clothes (female)";
	};
	
	class Skin_TK_INS_Warlord_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Takistani Warlord";
		descriptionShort = "Takistani Warlord";
	};
	
	class Skin_TK_INS_Soldier_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Takistani Soldier";
		descriptionShort = "Takistani Soldier";
	};
	
	class Skin_CZ_Special_Forces_GL_DES_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Special Forces";
		descriptionShort = "Special Forces";
	};
	
	class Skin_Drake_Light_DZ : SkinBase {
		scope = public;
		displayName = "Desert Camo";
		descriptionShort = "Desert Camo";
	};
	
	class Skin_Soldier_Bodyguard_AA12_PMC_DZ : SkinBase {
		scope = public;
		displayName = "Bodyguard";
		descriptionShort = "Bodyguard";
	};
	
	class Skin_FR_OHara_DZ : SkinBase {
		scope = public;
		displayName = "Jungle Camo";
		descriptionShort = "Jungle Camo";
	};
	
	class Skin_FR_Rodriguez_DZ : SkinBase {
		scope = public;
		displayName = "Gunner Outfit";
		descriptionShort = "Gunner Outfit";
	};
	
	class Skin_CZ_Soldier_Sniper_EP1_DZ : SkinBase {
		scope = public;
		displayName = "Desert Guille";
		descriptionShort = "Desert Guille";
	};
	
	class Skin_Graves_Light_DZ : SkinBase {
		scope = public;
		displayName = "Urban Camo";
		descriptionShort = "Urban Camo";
	};
	
	class Skin_Soldier_Sniper_PMC_DZ : SkinBase {
		scope = public;
		displayName = "Marksman";
		descriptionShort = "Marksman";
	};
	
	class Skin_Soldier_TL_PMC_DZ : SkinBase {
		scope = public;
		displayName = "Team Leader";
		descriptionShort = "Team Leader";
	};
	
	class Skin_Camo1_DZ : SkinBase {
		scope = public;
		displayName = $STR_EQUIP_NAME_44;
		descriptionShort = $STR_EQUIP_DESC_44;
	};
	
	class Skin_Survivor2_DZ : SkinBase {
		scope = public;
		displayName = $STR_EQUIP_NAME_45;
		descriptionShort = $STR_EQUIP_DESC_45;
	};
	
	class Skin_Soldier1_DZ : SkinBase {
		scope = public;
		displayName = $STR_EQUIP_NAME_46;
		descriptionShort = $STR_EQUIP_DESC_46;
	};
};

class CfgVehicles {
	class Soldier_Crew_PMC;	// External class reference
	
	class Bandit1_DZ : Soldier_Crew_PMC {
		displayName = $STR_CHAR_2;
		side = TWest;
		weapons[] = {"Throw", "Put"};
		model = "\dayz\characters\man_bandit";
		portrait = "\Ca\characters_E\data\portraits\ger_soldier_CA";
		magazines[] = {};
		backpack = "";
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	
	class Bandit2_DZ : Soldier_Crew_PMC {
		scope = public;
		displayName = $STR_CHAR_2;
		weapons[] = {"Throw", "Put"};
		model = "\ca\characters_E\GER\GER_rifleman";
		portrait = "\Ca\characters_E\data\portraits\ger_soldier_CA";
		magazines[] = {};
		backpack = "";
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\dayz\textures\clothes\bandit_tex1_co.paa"};
		weaponSlots = 1 + 4 + 12* 256 + 2* 4096 + 2 + 8* 16 + 12*131072;
		canHideBodies = true;
	};
	class GUE_Soldier_MG;	// External class reference
	
	class GUE_Soldier_MG_DZ : GUE_Soldier_MG {
		displayName = "Bandit Gunner";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class GUE_Soldier_Sniper;	// External class reference
	
	class GUE_Soldier_Sniper_DZ : GUE_Soldier_Sniper {
		displayName = "Bandit Sniper";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class GUE_Soldier_Crew;	// External class reference
	
	class GUE_Soldier_Crew_DZ : GUE_Soldier_Crew {
		displayName = "Bandit ";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class GUE_Soldier_CO;	// External class reference
	
	class GUE_Soldier_CO_DZ : GUE_Soldier_CO {
		displayName = "Bandit Gunner";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class GUE_Soldier_2;	// External class reference
	
	class GUE_Soldier_2_DZ : GUE_Soldier_2 {
		displayName = "Bandit Gunner";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class BAF_Soldier_Officer_W;	// External class reference
	
	class Rocket_DZ : BAF_Soldier_Officer_W {
		displayName = "Officer";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class RU_Policeman;	// External class reference
	
	class RU_Policeman_DZ : RU_Policeman {
		displayName = "Policeman";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Pilot_EP1;	// External class reference
	
	class Pilot_EP1_DZ : Pilot_EP1 {
		displayName = "Pilot";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Haris_Press_EP1;	// External class reference
	
	class Haris_Press_EP1_DZ : Haris_Press_EP1 {
		displayName = "Press";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Ins_Soldier_GL;	// External class reference
	
	class Ins_Soldier_GL_DZ : Ins_Soldier_GL {
		displayName = "Terrorist";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class GUE_Commander;	// External class reference
	
	class GUE_Commander_DZ : GUE_Commander {
		displayName = "Rebel";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Functionary1_EP1;	// External class reference
	
	class Functionary1_EP1_DZ : Functionary1_EP1 {
		displayName = "Business Suit";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Priest;	// External class reference
	
	class Priest_DZ : Priest {
		displayName = "Priest";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Rocker1;	// External class reference
	
	class Rocker1_DZ : Rocker1 {
		displayName = "Rocker (black)";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Rocker2;	// External class reference
	
	class Rocker2_DZ : Rocker2 {
		displayName = "Rocker (brown)";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Rocker3;	// External class reference
	
	class Rocker3_DZ : Rocker3 {
		displayName = "Rocker (blue)";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Rocker4;	// External class reference
	
	class Rocker4_DZ : Rocker4 {
		displayName = "Rocker (green)";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class TK_INS_Warlord_EP1;	// External class reference
	
	class TK_INS_Warlord_EP1_DZ : TK_INS_Warlord_EP1 {
		displayName = "Takistani Warlord";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class TK_INS_Soldier_EP1;	// External class reference
	
	class TK_INS_Soldier_EP1_DZ : TK_INS_Soldier_EP1 {
		displayName = "Takistani Soldier";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class CZ_Special_Forces_GL_DES_EP1;	// External class reference
	
	class CZ_Special_Forces_GL_DES_EP1_DZ : CZ_Special_Forces_GL_DES_EP1 {
		displayName = "Special Forces";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class Drake_Light;	// External class reference
	
	class Drake_Light_DZ : Drake_Light {
		displayName = "Desert Camo";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class Soldier_Bodyguard_AA12_PMC;	// External class reference
	
	class Soldier_Bodyguard_AA12_PMC_DZ : Soldier_Bodyguard_AA12_PMC {
		displayName = "Bodyguard";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class Soldier_Sniper_PMC;	// External class reference
	
	class Soldier_Sniper_PMC_DZ : Soldier_Sniper_PMC {
		displayName = "Marksman";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class Soldier_TL_PMC;	// External class reference
	
	class Soldier_TL_PMC_DZ : Soldier_TL_PMC {
		displayName = "Team Leader";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class FR_OHara;	// External class reference
	
	class FR_OHara_DZ : FR_OHara {
		displayName = "Jungle Camo";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
		attendant = false;
	};
	class FR_Rodriguez;	// External class reference
	
	class FR_Rodriguez_DZ : FR_Rodriguez {
		displayName = "Gunner Outfit";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class CZ_Soldier_Sniper_EP1;	// External class reference
	
	class CZ_Soldier_Sniper_EP1_DZ : CZ_Soldier_Sniper_EP1 {
		displayName = "Desert Guille";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class Graves_Light;	// External class reference
	
	class Graves_Light_DZ : Graves_Light {
		displayName = "Urban Camo";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
		canCarryBackPack = 1;
	};
	class BAF_Soldier_W;	// External class reference
	
	class Soldier1_DZ : BAF_Soldier_W {
		displayName = "Soldier";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class BAF_Soldier_SniperH_W;	// External class reference
	
	class Sniper1_DZ : BAF_Soldier_SniperH_W {
		displayName = "Sniper";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
	class BAF_Soldier_L_W;	// External class reference
	
	class Camo1_DZ : BAF_Soldier_L_W {
		displayName = "Survivor";
		side = TWest;
		weapons[] = {"Throw", "Put"};
		backpack = "";
		magazines[] = {};
		respawnWeapons[] = {"Throw", "Put"};
		respawnMagazines[] = {};
		weaponSlots = 1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072;
		canHideBodies = true;
	};
};
