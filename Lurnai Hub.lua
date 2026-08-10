--!strict

type GameMap = {[number]: string}

type VersionData = {
	LoaderVersion: string,
	Games: {[number]: string}
}

local HttpGet = game.HttpGet
local PlaceId = game.PlaceId

local gamesUrl: string = "https://raw.githubusercontent.com/LurnaiHub/Lurnai-Hub/refs/heads/main/GameList.lua"
local versionsUrl: string = "https://raw.githubusercontent.com/LurnaiHub/Lurnai-Hub/refs/heads/main/Version.lua"

local Games: GameMap = loadstring(
	HttpGet(game, gamesUrl)
)() :: GameMap

local Versions: VersionData = loadstring(
	HttpGet(game, versionsUrl)
)() :: VersionData

local URL: string = assert(Games[PlaceId], "Unsupported game.")
assert(Versions.Games[PlaceId], "Unsupported game version.")

local Chunk: () -> () = assert(loadstring(HttpGet(game, URL)))
Chunk()
