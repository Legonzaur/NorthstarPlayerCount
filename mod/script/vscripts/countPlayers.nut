global function countPlayers_init

struct {
    int playerCount
} file

void function countPlayers_init(){
    file.playerCount = 0
    AddCallback_OnClientConnected(PlayerJoin)
    AddCallback_OnClientDisconnected(PlayerLeave)
}

void function PlayerJoin(entity player){
    file.playerCount++
    SavePlayerCount()
}

void function PlayerLeave(entity player){
    file.playerCount--
    SavePlayerCount()
}

void function SavePlayerCount(){
    NSSaveFile("playerCount.txt", file.playerCount.tostring())
}