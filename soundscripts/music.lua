playedBin = {}

--Call this variable into your game type choices. 

musicChoices = {
			"Off", "mute",
			"Shuffle: All", "shuffle",
			"Shuffle: Ambient", "ambient",
			"Shuffle: Staging", "staging",
			"Shuffle: Battle", "battle",
			"Ambient: No.1", "ambient\\amb_01",
			"Ambient: No.2", "ambient\\amb_02",
			"Ambient: No.3", "ambient\\amb_03",
			"Ambient: No.4", "ambient\\amb_04",
			"Ambient: No.5", "ambient\\amb_05",
			"Ambient: No.6", "ambient\\amb_06",
			"Ambient: No.7", "ambient\\amb_07",
			"Ambient: No.8", "ambient\\amb_08",
			"Ambient: No.9", "ambient\\amb_12",
			"Ambient: No.10", "ambient\\amb_13",
			"Ambient: No.11", "ambient\\amb_14",
			"Battle: No.2", "battle\\battle_04",
			"Battle: No.3, Alternate", "battle\\battle_04_alt",
			"Battle: No.4", "battle\\battle_06",
			"Battle: Arrival", "battle\\battle_arrival",
			"Battle: Keeper", "battle\\battle_keeper",
			"Battle: Movers", "battle\\battle_movers",
			"Battle: Planet Killers", "battle\\battle_planetkillers",
			"Battle: Sajuuk", "battle\\battle_sajuuk",
			"Staging: No.1", "staging\\staging_01",
			"Staging: No.2", "staging\\staging_04",
			"Staging: No.3", "staging\\staging_05",
			"Staging: No.4", "staging\\staging_08",
			"Staging: No.5", "staging\\staging_11",
}

function Play(Music)

	if Music == nil then
		ShuffleAll()
				
	elseif Music == "shuffle" then
		ShuffleAll()
		
	elseif Music == "ambient" then
		ShuffleAmbient()
		
	elseif Music == "battle" then
		ShuffleBattle()
		
	elseif Music == "staging" then
		ShuffleStaging()
			
	elseif Music == "mute" then
		Sound_MusicPlay("data:sound\\music\\Mute" )
		
	else
		Sound_MusicPlay("data:sound\\music\\" .. Music)
	end
	
end

function ShuffleAll()

	UI_BindKeyEvent(F1KEY, "RandomMusicRule")
	dofilepath("data:soundscripts/playlists/allmusic.lua")
	Rule_Add("RandomMusicRule")
end

function ShuffleAmbient()
	
	UI_BindKeyEvent(F1KEY, "RandomMusicRule")
	dofilepath("data:soundscripts/playlists/ambientonly.lua")
	Rule_Add("RandomMusicRule")
	
end

function ShuffleBattle()
	
	UI_BindKeyEvent(F1KEY, "RandomMusicRule")
	dofilepath("data:soundscripts/playlists/battleonly.lua")
	Rule_Add("RandomMusicRule")
	
end

function ShuffleStaging()
	
	UI_BindKeyEvent(F1KEY, "RandomMusicRule")
	dofilepath("data:soundscripts/playlists/stagingonly.lua")
	Rule_Add("RandomMusicRule")
	
end
    
--Keybinded functions.
function RandomMusicRule()
	RandomMusic(PlayList)
end
	

function RandomMusic(tPlaylist)
	-- function created by Mikail, EvilleJedi
	-- Input:	<tPlaylist>: the playlist (a table) of songs.
	local passBool = 1
	local musicPath = "data:sound\\music\\"
	local listLen = getn(tPlaylist)
	local binLen = getn(playedBin)
	local randNum = random(listLen)
	local track_file = musicPath .. tPlaylist[randNum][1]
	local track_title = tPlaylist[randNum][2]
	local track_length = tPlaylist[randNum][3]
	local track_m = floor(track_length / 60)
	local track_s = track_length - track_m * 60
	local track_string = "Now playing (" .. randNum .. "/" .. listLen .. "): " .. track_title .. " (" .. track_m .. "m " .. track_s .. "s)"
	for k = 1, binLen do
		-- don't play the same track twice
		if (playedBin[k] == randNum) then
			passBool = 0
			-- if the end of the list has been reached, start over
			if (k == listLen) then
				playedBin = {}
			end
			break
		end
	end
	if (passBool == 0) then
		RandomMusic(tPlaylist)
	else
		Sound_MusicPlay(track_file)
		Subtitle_Message(track_string, 10)
		print(track_string)
		tinsert(playedBin, randNum)
		Rule_AddInterval("RandomMusicRule", track_length)
		Rule_Remove("RandomMusicRule")
	end
end
