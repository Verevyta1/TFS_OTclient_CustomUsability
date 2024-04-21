--Q1

local function releaseStorage(playerId)
    local player = Player(playerId)
    if player then
        player:setStorageValue(1000, -1)
    end
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player:getId())
    end
    return true
end

--[[
The original code would probably crash the server as it doesnt handle safe data like integer, number string or tables. So player is of type userdata which is a pointer to  the player in memory. If the player is removed from memory, the event will try to use something that doesnt exist .  This function could be simplified to just having the player:setStorageValue(1000, -1) as there is only one option to choose from.

--]]

----------------------------------------------------------------------------------------------------


--Q2

function printSmallGuildNames(memberCount)

local selectGuildQuery = "SELECT name FROM guilds WHERE memberCount < %d;"

local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
if not resultId then
  print("No results or query failed.")
  return
end


while true do
    local guildName = result.getString(resultId, "name")
    
    if not guildName then
      break
    end
    
    print(guildName)
    result.next(resultId)
  end
  
result.free(resultId)
end

--[[

From my understanding this function is supposed to print the guilds that have less players than the maximum amount of players which is the argument of the function. (English is not my first language so, sorry if I got the wrong represenation). So instead of having  max_members < %d, I used memberCount < %d which should get all the guilds that have a number of players lower than memberCount. (So I could say, Oh i want all the guild with less than 10 players. Then this function should do just that) 

I also added a while loop that goes through the query and prints the names and is stopeed if there is nothing left and then it frees it. 
I also added a check in case there is no query



--]]


---------------------------------------------------------------------------------------------------------



--Q3

function removeMemberFromParty(playerId, memberName)
  local player = Player(playerId)
  local member = Player(memberName)
  if not player or not member then
    print("Error: One or more specified players do not exist.")
    return
  end

  local party = player:getParty()
  if not party then
    print("Error: Player is not in a party.")
    return
  end
  for k,v in pairs(party:getMembers()) do
      if v == member then
          party:removeMember(v)
          print("Member removed successfully.")
          break
      end
  end
end


--[[
For q3 I firstly changed the name of the function to better reflect what the function is doing which is
  removing a member from the party.
  I then made the player var local as I assumed it wont be needed outside of this function.
    I also assumed that Player(playerId) creates a new player object. Then I created a new variable called member, which creates a player object using the memberName argument.
  In the if check, instead of making a new object for every member in the party, I used the new variable I created.
  if the new member name is the same as the v, which I assumed is the name of a member in the party, it will then remove that member and exit the loop. 
    I also added a few checks to see if the player we are looking for is in the party and if the playerId or member
    exist.
	
	A better way to check if the player is in the party is to just check for the specific name or id of that player instead of looping through every member of the party.
--]]


----------------------------------------------------------------------------------------------------------------