state("Inscryption") {}

startup
{
	vars.Log = (Action<object>)(output => print("[Inscryption] " + output));
	vars.Stopwatch = new Stopwatch();
	vars.PrevOffset = timer.Run.Offset;

	vars.EventNames = new[]
	{
		"BasicTutorialCompleted",
		"TutorialRunCompleted",
		"SacrificedStoatInTutorial",
		"StoatIntroduction",
		"BonesTutorialCompleted",
		"TutorialRun2Completed",
		"SafeOpened",
		"WardrobePanelOpened",
		"WardrobeDrawer1Opened",
		"WardrobeDrawer2Opened",
		"WardrobeDrawer3Opened",
		"WardrobeDrawer4Opened",
		"SkinkCardDiscovered",
		"AntCardsDiscovered",
		"SquirrelHeadDiscovered",
		"SpecialDaggerDiscovered",
		"WolfStatuePlaced",
		"WolfCageBroken",
		"CageCardDiscovered",
		"StinkbugCardDiscovered",
		"ProspectorDefeated",
		"AnglerDefeated",
		"TrapperTraderDefeated",
		"WoodcarverDefeated",
		"StartScreenNewGameUnlocked",
		"StartScreenLibraryUnlocked",
		"LeshyDefeated",
		"FigurineFetched",
		"LeshyLostCamera",
		"StinkbugStoatReunited",
		"ClockCompartmentOpened",
		"TalkingWolfCardDiscovered",
		"FilmRollDiscovered",
		"GBCIntroCompleted",
		"GBCGrimoraDefeated",
		"GBCLeshyDefeated",
		"GBCPoeDefeated",
		"GBCMagnificusDefeated",
		"TutorialRun3Completed",
		"GBCUndeadAmbition",
		"GBCNatureAmbition",
		"GBCTechAmbition",
		"GBCWizardAmbition",
		"GBCProspectorPhoto",
		"GBCAnglerPhoto",
		"GBCTrapperPhoto",
		"GBCBaitPhoto",
		"StartScreenNewGameUsed",
		"Part2Completed",
		"ArchivistDefeated",
		"PhotographerDefeated",
		"TelegrapherDefeated",
		"CanvasDefeated",
		"FileAccessGiven",
		"GemsModuleFetched",
		"ImprovedSmokeCardDiscovered",
		"FactoryWardrobe1Opened",
		"FactoryWardrobe2Opened",
		"FailedWithFilmRoll",
		"StoatIntroduction2",
		"StinkbugIntroduction2",
		"StoatSaysFindWolf",
		"StoatWolfReunited",
		"StinkbugMentionedWolf",
		"WoodcarverMet",
		"GBCMonocleFound",
		"StoatIntroduction3",
		"CaptchaPuzzle1Complete",
		"CaptchaPuzzle2Complete",
		"CaptchaPuzzle3Complete",
		"CaptchaPuzzle4Complete",
		"CaptchaPuzzle5Complete",
		"CaptchaPuzzle6Complete",
		"HoloMapOutOfPower",
		"HoloMapBatteryFetched",
		"GemsModuleRequested",
		"GBCUndeadFinaleChosen",
		"GBCNatureFinaleChosen",
		"GBCTechFinaleChosen",
		"GBCWizardFinaleChosen",
		"GooBottleFound",
		"Part3Intro",
		"HandCuffReleased",
		"FMVClips1",
		"FMVClips2",
		"FMVClips3",
		"GBCCameraBatteryLow",
		"FactoryShopRoomUnlocked",
		"NatureHoloShortcut",
		"UndeadHoloShortcut",
		"WizardHoloShortcut",
		"DredgingRoomUnlocked",
		"Part3MetScrybes",
		"SpecialDaggerUsed",
		"FactoryChestOpened1",
		"FactoryChestOpened2",
		"FactoryGooSpotted",
		"GBCWorldMapVO",
		"GBCDogFoodFound",
		"GBCDogFoodPlaced",
		"BombRemoteDiscovered",
		"CloverFound",
		"CandleArmFound",
		"BeeFigurineFound",
		"HoloTechTempleSatelliteActivated",
		"Part3Completed",
		"FullGameCompleted",
		"GrimoraReachedTable",
		"WolfMentionFilmRoll",
		"PhotoDroneSeenInCabin",
		"TalkingAnglerCardDiscovered",
		"GBCCloverFound",
		"GBCObolFound",
		"GBCObolGiven",
		"GBCBoneFound",
		"BonelordHoloKeyFound",
		"Part3PostScrybeMeeting",
		"TalkingBlueMageCardDiscovered",
		"Part3BonelordRoomUnlocked",
		"LukeVOPart1Vision",
		"LukeVOPart2Grimora",
		"LukeVOPart2Bonelord",
		"FishHookUnlocked",
		"HoloTechAreaUnlocked",
		"StartScreenNewGameUsedAgain",
		"Part3MycologistHutUnlocked",
		"MycologistHutKeyFound",
		"CabinTarotCardFound",
		"MycologistsBossDefeated",
		"LukeVOPart3File",
		"RingFound",
		"ClockSmallCompartmentOpened",
		"InternetAccessGranted",
		"FactoryGemPedestalAppeared",
		"LukeVOPart3CloseWin",
		"LukeVOPart3Yes",
		"LukeVOPart3Shit",
		"LukeVOPart3Wtf",
		"PlayerDeletedArchivistFile",
		"FactoryConveyorBeltMoved",
		"FactoryCuckooClockAppeared",
		"Part3PurchasedHoloBrush",
		"FactoryCuckooClockOpenedLarge",
		"FactoryCuckooClockOpenedSmall",
		"OurobotCardDiscovered",
		"LukeVONewRunAfterVictory",
		"LukeVOLeshyRematch",
		"LukeVOSickOfBoss",
		"LukeVOMantisGod",
		"LukeVOOPCard",
		"MycologistsDefeated",
		"Part3MetBonelord",
		"Part3PhotoDroneActive",
		"GooPlaneGoobertRevealed",
		"GooPlaneGoobertComplete",
		"FactoryPrinterScreenMatched",
		"FinaleCryptCompleted",
		"FinaleCabinCompleted",
		"FinaleMagnificusCompleted",
		"FactoryWoodcarver1",
		"FactoryWoodcarver2",
		"FactoryWoodcarver3",
		"ChapterSelectUnlocked",
		"MycologistHutKeyShown",
		"GBCBonelordRewardsGiven",
		"LukeVOBeatLeshyAgain",
		"LukeVODieAlready",
		"UhOhSpaghettiOh"
	};

	string[,] sett =
	{
		{ "Act 1", "ProspectorDefeated" },
		{ "Act 1", "AnglerDefeated" },
		{ "Act 1", "TrapperTraderDefeated" },
		{ "Act 1", "LeshyDefeated" },
		{ "Act 1", "StartScreenNewGameUnlocked" },

		{ "Act 2", "GBCGrimoraDefeated" },
		{ "Act 2", "GBCLeshyDefeated" },
		{ "Act 2", "GBCPoeDefeated" },
		{ "Act 2", "GBCMagnificusDefeated" },
		{ "Act 2", "Part2Completed" },

		{ "Act 3", "ArchivistDefeated" },
		{ "Act 3", "PhotographerDefeated" },
		{ "Act 3", "TelegrapherDefeated" },
		{ "Act 3", "CanvasDefeated" },
		{ "Act 3", "Part3Completed" },

		{ "Finale", "FullGameCompleted" }
	};

	settings.Add("Act 1");
	settings.Add("Act 2");
	settings.Add("Act 3");
	settings.Add("Finale");

	for (int i = 0; i < sett.GetLength(0); ++i)
		settings.Add(sett[i, 1], true, sett[i, 1], sett[i, 0]);

	using (var prov = new Microsoft.CSharp.CSharpCodeProvider())
	{
		var param = new System.CodeDom.Compiler.CompilerParameters
		{
			GenerateInMemory = true,
			ReferencedAssemblies = { "LiveSplit.Core.dll", "System.dll", "System.Core.dll", "System.Xml.dll", "System.Xml.Linq.dll" }
		};

		string mono = File.ReadAllText(@"Components\mono.cs"), helpers = File.ReadAllText(@"Components\mono_helpers.cs");
		var asm = prov.CompileAssemblyFromSource(param, mono, helpers);
		vars.Unity = Activator.CreateInstance(asm.CompiledAssembly.GetType("Unity.Game"));
	}
}

onStart
{
	timer.Run.Offset = vars.PrevOffset;

	vars.CanStart = false;
	current.Events.Clear();
}

init
{
	vars.IsDemo = false;
	vars.CanStart = false;
	current.Events = new List<string>();

	var is64Bit = game.Is64Bit();
	var pointerSize = is64Bit ? 0x8 : 0x4;
	Func<IntPtr, IntPtr> rp = addr => game.ReadPointer(addr);

	Func<IntPtr> getSceneManager = () =>
	{
		var up = game.ModulesWow64Safe().FirstOrDefault(m => m.ModuleName == "UnityPlayer.dll");
		if (up == null) return IntPtr.Zero;

		var scanner = new SignatureScanner(game, up.BaseAddress, up.ModuleMemorySize);
		var target = is64Bit
		             ? new SigScanTarget(11, "41 83 3E 01 4C 8D 45")
		             : new SigScanTarget(8, "89 45 ?? 8B 41 ?? 8B 0D ???????? 89 45 ?? 8A 45");

		target.OnFound = (p, _, addr) => p.Is64Bit() ? addr + 0x4 + p.ReadValue<int>(addr) : p.ReadPointer(addr);
		return scanner.Scan(target);
	};

	vars.Unity.Exceptions = new[] { "NullReferenceException", "InvalidOperationException" };
	vars.Unity.TryOnLoad = (Func<dynamic, bool>)(helper =>
	{
		var sceneManager = getSceneManager();
		if (sceneManager == IntPtr.Zero)
		{
			vars.Log("SceneManager not found!");
			return false;
		}

		vars.Unity.MakeString(256, sceneManager, 0x0, is64Bit ? 0x48 : 0x28, is64Bit ? 0x40 : 0x2C).Name = "activeScene";

		var lst = helper.GetClass("mscorlib", "List`1");

		var sm = helper.GetClass("Assembly-CSharp", "SaveManager");
		var sf = helper.GetClass("Assembly-CSharp", "SaveFile");
		var sed = helper.GetClass("Assembly-CSharp", "StoryEventsData");

		vars.Unity.Make<float>(sm.Static, sm["lastSaveTime"]).Name = "lastSaveTime";
		vars.Unity.Make<int>(sm.Static, sm["saveFile"], sf["storyEvents"], sed["completedEvents"], lst["_size"]).Name = "completedEventsCount";

		vars.GetEvent = (Func<int, string>)(index =>
		{
			var storyEvent = new DeepPointer(
				sm.Static + sm["saveFile"], sf["storyEvents"], sed["completedEvents"],
				lst["_items"], pointerSize * 4 + 0x4 * index).Deref<int>(game);

			return vars.EventNames[storyEvent];
		});

		var sd = helper.GetClass("Assembly-CSharp", "ScriptDefines");
		IntPtr steam = sd.Static + sd["STEAM_DEMO"], bitSummit = sd.Static + sd["BITSUMMIT_DEMO"];
		vars.IsDemo = game.ReadValue<bool>(steam) || game.ReadValue<bool>(bitSummit);

		if (!vars.IsDemo) return true;

		var st = helper.GetClass("Assembly-CSharp", "Singleton`1");
		var mCon = helper.GetClass("Assembly-CSharp", "MenuController", 1);
		var mc = helper.GetClass("Assembly-CSharp", "MenuCard");

		vars.Unity.Make<bool>(mCon.Static, st["m_Instance"], mCon["TransitioningToScene"]).Name = "transitioning";
		vars.Unity.Make<int>(mCon.Static, st["m_Instance"], mCon["SelectedCard"], mc["menuAction"]).Name = "menuAction";

		return true;
	});

	vars.Unity.Load(game);
}

update
{
	if (!vars.Unity.Loaded) return false;

	vars.Unity.UpdateAll(game);
	current.Events.Clear();

	if (vars.IsDemo)
	{
		if (vars.Unity["menuAction"].Changed)
			vars.CanStart = vars.Unity["menuAction"].Current == 1;

		return;
	}

	if (!vars.Unity["completedEventsCount"].Changed) return;

	int o = vars.Unity["completedEventsCount"].Old, c = vars.Unity["completedEventsCount"].Current;
	if (c == 0) return;

	for (int i = o + 1; i <= c; ++i)
	{
		var evnt = vars.GetEvent(i - 1);
		if (evnt == "BasicTutorialCompleted")
			vars.CanStart = true;

		vars.Log("New event: " + evnt);
		current.Events.Add(evnt);
	}
}

start
{
	if (!vars.CanStart) return;

	if (vars.IsDemo)
	{
		if (vars.Unity["transitioning"].Changed)
		{
			timer.Run.Offset = TimeSpan.FromSeconds(0.285);
			return true;
		}
	}
	else
	{
		if (vars.Unity["lastSaveTime"].Changed)
		{
			timer.Run.Offset = TimeSpan.FromSeconds(-1.405);
			return true;
		}
	}
}

split
{
	if (current.Events.Count == 0) return;

	foreach (var evnt in current.Events)
	{
		if (settings[evnt])
			return true;
	}
}

reset
{
	if (!vars.Unity["activeScene"].Changed) return;

	return vars.Unity["activeScene"].Current == "Start";
}

isLoading
{
	return string.IsNullOrEmpty(vars.Unity["activeScene"].Current) || vars.Unity["activeScene"].Current == "Loading";
}

exit
{
	vars.Unity.Reset();
}

shutdown
{
	vars.Unity.Reset();
}
