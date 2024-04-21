void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId){
  
  Player* player = g_game.getPlayerByName(recipient);
  if (!player){
    //if the player's name doesn't exist, create a new one
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) {
      //if loading the player's data failed, free the memory
      delete player;
      return;
    }
  }

  Item* item = Item::CreateItem(itemId);
  if (!item) {
    return;
  }

  g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

  if (player->isOffline()) {
    IOLoginData::savePlayer(player);
  }
}

/*

A memory leak was made when the function created a new player every time it checked if the player name was not valid

By adding a delete player after the first return, I cleareed the unnecessary player allocations




*/