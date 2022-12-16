@echo off
color 0a
cd ..
@echo on
echo Installing Lime...
haxelib install lime
echo Installing OpenFL...
haxelib install openfl
echo Installing Flixel...
haxelib install flixel
echo Running Lime SetUp With Flixel...
haxelib run lime setup flixel
echo Running Lime SetUp...
haxelib run lime setup
echo Installing Flixel Tools..
haxelib install flixel-tools
echo Running Flixel Tools SetUp..
haxelib run flixel-tools setup
echo Installing hxCodec
haxelib install hxCodec
echo Installing Flixel Addons..
haxelib install flixel-addons
echo Installing Flixel UI..
haxelib install flixel-ui
echo Installing HScript...
haxelib install hscript
echo Installing Newgrounds (FNF Porn Not Included)...
haxelib install newgrounds
echo Installing Discord RPC
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
echo Installing Linc Lua Jit...
haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit
echo Installing Flixel Addons..
haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons
echo BUILDING GAME...
lime build windows