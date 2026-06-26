--!strict

type GameMap = {[number]: string}

local HttpGet = game.HttpGet
local GameId = game.GameId

local games = "https://raw.githubusercontent.com/LurnaiHub/Lurnai-Hub/refs/heads/main/GameList.lua"

local Games = loadstring(
    HttpGet(game, games)
)() :: GameMap

local URL = assert(Games[GameId], "Unsupported game.")

local Chunk = assert(loadstring(HttpGet(game, URL)))
Chunk()
