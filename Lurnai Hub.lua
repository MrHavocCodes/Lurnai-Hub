--!strict

type GameMap = {[number]: string}
type VersionData = {
LoaderVersion: string,
Games: {[number]: string}
}

local HttpGet = game.HttpGet
local GameId = game.GameId

local games = "https://raw.githubusercontent.com/LurnaiHub/Lurnai-Hub/refs/heads/main/GameList.lua"
local versions = "https://raw.githubusercontent.com/LurnaiHub/Lurnai-Hub/refs/heads/main/Version.lua"

local Games = loadstring(
HttpGet(game, games)
)() :: GameMap

local Versions = loadstring(
HttpGet(game, versions)
)() :: VersionData

local URL = assert(Games[GameId], "Unsupported game.")

local _ = Versions.Games[GameId]

local Chunk = assert(loadstring(HttpGet(game, URL)))
Chunk()
