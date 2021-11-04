# LiveSplitters

Here's a rough overview of what I've picked up while trying to make an autosplitter.

1. dotpeek is your friend for unity games
2. cutter is extremely handy for debugging

The first step is ideally to work out what if any underlying libraries are being used that are open source. This can save you quite a lot of time especially when staring at at lot of hex in memory. From here it's work to figure out what if any data is immediately accessible via something that was made static. Provided we can find offsets these are easily accessible by reading the process memory at the particular pointer.

Trying to hammer out offsets by navigating data to see if anything correlates manually is an absolute pita. You don't want to be doing that if at all. This is likely where Cheat Engine and likely derivatives floating around make things easier. Cheat Engine effectively allows you to quickly narrow down key areas in memory of interest by filtering a list of memory addresses. This can make it extremely easy to for example find interesting bits of memory fairly quickly. Especially if you know the particular value, or know how it might be changing (for Inscryption my initial find was a value that kept incrementing each time I talked to the npc). Beware though if you're using Cheat Engine...it's a cheat engine...don't be using it and / or keep it around if you have competitive games installed. I learned that the hard way. I'm only making reference to it here because it was part of this process. I'm still kind of miffed this was recommended, but I'm sure other reverse engineering tools also might net you a ban, so be wary, don't just have it open or installed for nothing.

To get a hint at what libraries may be involved, in most of any debugging tool is a means of listing loaded dlls and/or listing memory regions currently associated with loaded dlls. We can look these up by name online etc..., some of the data we're after may be static information in the dll, meaning we'll need to use the dll's offset in memory to reach anything we extract from it.

But knowing where in memory is not the goal, it's to get to that interesting bit of memory each time, this means working backwards. In cheat engine we can manually search through memory for things which may point to the target address simpoly by searching for that address as a value. If we can do this all the way back to a fixed point in memory (an offset from a loaded dll or just an offset from the executable) then we can derive the "pointer path" which is a list of offsets from a pointer to repeatedly dereference. This is effectively what navigating any dynamic struct in memory does, and so...provided the underlying code and structs don't change in an update, we'll always get to that interesting bit of memory.

In the case of Inscryption, it's a Unity game built with mono. Which is apparently C# based, open source and easily reversible to such a degree I entirely missed connecting the dots between the "mono" library I was helpfully pointed out to...and and option to effectively automatically get all of the interesting offsets.

But suppose we don't have real documentation, or it's very little. Well we can practice real practical reverse engineering by using a tool like cutter, cutter is a gui for exactly this purpose. While it does have some overlap with cheat engine, in that it can show you a disassembly and hexdump of, how it really helps is by allowing you to markup any disassemled code and have it reflected effectively everywhere. You can mark points in memory as functionss, specify the types of functions, rename functions their signaures. For example, while browing some found but completely unlabelled functions I quickly worked out it effectivly was snprintf, or something acting as sprintf should...and then several other functions which were all doing similar sprintf like things. This turned an ugly mess of static strings into readable function calls, and clarified a few other functions just by process of eliminiation. EG: when the function is clearly not about dealing with strings, it's easy to remove the sprintf like function out of the equation for what's important.

Things that'd have made things faster for me initially: realizing that the hexdump usually has options to change how the data is displayed, toggling this around from hexideciaml to decimal and/or changing the "width" of the data can effectively help poking around memory by making structures more readily apparent. For example when trying to make sense of some garbage data I was getting from navigating what I thought were good offsets, taking a look at the hexdump when I knew the data was supposed to be stored as integers made it extremely clear I was off by some additional unknown offset. I still don't know what that was, but clearly the data I was after was shifted over in a way I didn't expect. Debugging by attaching to a process is far more useful than just poking around source code, if you're looking at an executable, have attach the debugger to the process, you'll be able to see the entire process's memory at work, and you'll get the benefits of setting breakpoints in code to stop the program where you feel something interesting may be happening.

# MISC Keyboard Wizardry
`CTRL + G` seems to be a standard keyboard shortcut for most of any editor. Something new I've learned by complete accident, as I've never used it, depending on the context in a text editor it can be goto line, in a hexdump or disasembly it can be goto address. I've never really particularly felt the need to use any goto functionality, but now I know it's probably `CTRL + G` and that's pretty handy when you're copy pasting addresses around.

If you're curious, some handy tricks I know are that VS Code uses `CTRL + D` to select similar text for multiline editing, MSVC's equivalent (though never seemingly mentioned) is `CTRL + SHIFT + .` `CTRL + LEFT ALT + ARROW UP/DOWN` in MSVC allows to add a cursor up or down a line. I could've used this when writing the script but I was just playring around in notepad++. I've no idea, but I'm fairly certain notepad++ may have multiline editing as well.



