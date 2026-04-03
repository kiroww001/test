local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L1_1 = {}
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 1
  L2_2 = L0_1
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_1
    L5_2 = L5_2[L4_2]
    L6_2 = L5_2.tableCoords
    L6_2 = L6_2 - A0_2
    L6_2 = #L6_2
    L7_2 = 0.1
    if L6_2 < L7_2 then
      return L5_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L3_1(A0_2)
  local L1_2
  L1_2 = {}
  A0_2.players = L1_2
  A0_2.isUsed = false
  A0_2.stakesPaid = false
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 1
  L2_2 = L0_1
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_1
    L5_2 = L5_2[L4_2]
    L6_2 = L5_2.toggleNearbyPlayer
    L7_2 = A0_2
    L8_2 = false
    L6_2(L7_2, L8_2)
    L6_2 = L5_2.toggleSubscription
    L7_2 = A0_2
    L8_2 = false
    L6_2(L7_2, L8_2)
  end
end
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = 1
  L3_2 = L0_1
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L0_1
    L6_2 = L6_2[L5_2]
    L7_2 = false
    L8_2 = 2
    L9_2 = 1
    L10_2 = -1
    for L11_2 = L8_2, L9_2, L10_2 do
      L12_2 = L6_2.players
      L12_2 = L12_2[L11_2]
      if L12_2 then
        L12_2 = L6_2.players
        L12_2 = L12_2[L11_2]
        L12_2 = L12_2.playerId
        if L12_2 == A0_2 then
          L7_2 = true
        end
      end
    end
    if L7_2 then
      L8_2 = L6_2.isUsed
      if L8_2 then
        L8_2 = L6_2.broadcastPlayers
        L9_2 = "AirHockey:MatchFinished"
        L10_2 = L6_2
        L11_2 = -1
        L8_2(L9_2, L10_2, L11_2)
        L8_2 = L3_1
        L9_2 = L6_2
        L8_2(L9_2)
      else
        L8_2 = 2
        L9_2 = 1
        L10_2 = -1
        for L11_2 = L8_2, L9_2, L10_2 do
          L12_2 = L6_2.players
          L12_2 = L12_2[L11_2]
          if L12_2 then
            L12_2 = L6_2.players
            L12_2 = L12_2[L11_2]
            L12_2 = L12_2.playerId
            if L12_2 == A0_2 then
              L12_2 = table
              L12_2 = L12_2.remove
              L13_2 = L6_2.players
              L14_2 = L11_2
              L12_2(L13_2, L14_2)
            end
          end
        end
      end
    end
  end
  if A1_2 then
    L2_2 = L4_1
    L3_2 = A0_2
    L2_2(L3_2)
  end
end
function L6_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = {}
  L2_2.stakesPaid = false
  L2_2.tableCoords = A0_2
  L2_2.tableHeading = A1_2
  L3_2 = {}
  L2_2.subscribers = L3_2
  L3_2 = {}
  L2_2.nearbyPlayers = L3_2
  L3_2 = {}
  L2_2.players = L3_2
  L2_2.subscribersInTotal = 0
  L2_2.isUsed = false
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    if not A1_3 then
      A1_3 = nil
    end
    L2_3 = L2_2.subscribers
    L2_3 = L2_3[A0_3]
    if L2_3 ~= A1_3 then
      L2_3 = L2_2.subscribers
      L2_3[A0_3] = A1_3
      if A1_3 then
        L2_3 = TriggerClientEvent
        L3_3 = "AirHockey:TableInfo"
        L4_3 = A0_3
        L5_3 = L2_2
        L2_3(L3_3, L4_3, L5_3)
      end
      if not A1_3 then
        L2_3 = 2
        L3_3 = 1
        L4_3 = -1
        for L5_3 = L2_3, L3_3, L4_3 do
          L6_3 = L2_2.players
          L6_3 = L6_3[L5_3]
          if L6_3 then
            L6_3 = L2_2.players
            L6_3 = L6_3[L5_3]
            L6_3 = L6_3.playerId
            if L6_3 == A0_3 then
              L6_3 = L5_1
              L7_3 = L2_2.players
              L7_3 = L7_3[L5_3]
              L7_3 = L7_3.playerId
              L6_3(L7_3)
            end
          end
        end
      end
    end
    L2_3 = L2_2.subscribersInTotal
    if A1_3 then
      L3_3 = 1
      if L3_3 then
        goto lbl_45
      end
    end
    L3_3 = -1
    ::lbl_45::
    L2_3 = L2_3 + L3_3
    L2_2.subscribersInTotal = L2_3
  end
  L2_2.toggleSubscription = L3_2
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = L2_2.nearbyPlayers
    L2_3 = L2_3[A0_3]
    if L2_3 and not A1_3 then
      L2_3 = L2_2.nearbyPlayers
      L2_3[A0_3] = nil
      L2_3 = 2
      L3_3 = 1
      L4_3 = -1
      for L5_3 = L2_3, L3_3, L4_3 do
        L6_3 = L2_2.players
        L6_3 = L6_3[L5_3]
        if L6_3 then
          L6_3 = L2_2.players
          L6_3 = L6_3[L5_3]
          L6_3 = L6_3.playerId
          if L6_3 == A0_3 then
            L6_3 = L5_1
            L7_3 = L2_2.players
            L7_3 = L7_3[L5_3]
            L7_3 = L7_3.playerId
            L6_3(L7_3)
          end
        end
      end
      L2_3 = L2_2.broadcastNearbies
      L3_3 = "AirHockey:CheckTableState"
      L4_3 = L2_2
      L2_3(L3_3, L4_3)
    elseif A1_3 then
      L2_3 = L2_2.nearbyPlayers
      L3_3 = {}
      L3_3.playerId = A0_3
      L4_3 = "Unnamed #"
      L5_3 = A0_3
      L4_3 = L4_3 .. L5_3
      L3_3.name = L4_3
      L3_3.score = 0
      L2_3[A0_3] = L3_3
      L2_3 = L2_2.broadcastNearbies
      L3_3 = "AirHockey:CheckTableState"
      L4_3 = L2_2
      L2_3(L3_3, L4_3)
    end
  end
  L2_2.toggleNearbyPlayer = L3_2
  function L3_2(A0_3, ...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = pairs
    L2_3 = L2_2.nearbyPlayers
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = TriggerClientEvent
      L8_3 = A0_3
      L9_3 = L5_3
      L10_3 = ...
      L7_3(L8_3, L9_3, L10_3)
    end
  end
  L2_2.broadcastNearbies = L3_2
  function L3_2(A0_3, ...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = 0
    L2_3 = pairs
    L3_3 = L2_2.subscribers
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L8_3 = TriggerClientEvent
      L9_3 = A0_3
      L10_3 = L6_3
      L11_3 = ...
      L8_3(L9_3, L10_3, L11_3)
      L1_3 = L1_3 + 1
    end
  end
  L2_2.broadcastSubscribers = L3_2
  function L3_2(A0_3, ...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = pairs
    L2_3 = L2_2.players
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = TriggerClientEvent
      L8_3 = A0_3
      L9_3 = L6_3.playerId
      L10_3 = ...
      L7_3(L8_3, L9_3, L10_3)
    end
  end
  L2_2.broadcastPlayers = L3_2
  return L2_2
end
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L2_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = L6_1
    L4_2 = A0_2
    L5_2 = A1_2
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = L0_1
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  end
  return L2_2
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.players
  L1_2 = #L1_2
  if 2 == L1_2 then
    A0_2.isUsed = true
    L1_2 = {}
    L2_2 = 1
    L3_2 = 2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = A0_2.players
      L6_2 = L6_2[L5_2]
      L6_2 = L6_2.playerId
      L7_2 = L1_1
      L7_2 = L7_2[L6_2]
      if not L7_2 then
        L7_2 = ""
      end
      L1_2[L6_2] = L7_2
    end
    L2_2 = A0_2.broadcastSubscribers
    L3_2 = "AirHockey:StartWatch"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L2_2 = A0_2.broadcastPlayers
    L3_2 = "AirHockey:StartMatch"
    L4_2 = A0_2
    L5_2 = L1_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:Subscription"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:Subscription"
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = source
  L4_2 = L7_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2.toggleSubscription
  L6_2 = L3_2
  L7_2 = A2_2
  L5_2(L6_2, L7_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:ConfirmBet"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:ConfirmBet"
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = source
  L4_2 = L2_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  if A2_2 < 0 then
    return
  end
  L5_2 = ESX
  L5_2 = L5_2.GetPlayerFromId
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = L5_2.getAccount
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L7_2 = L6_2.money
    if not (A2_2 > L7_2) then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L7_2 = 1
  L8_2 = 2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L4_2.players
    L11_2 = L11_2[L10_2]
    L11_2 = L11_2.playerId
    if L11_2 == L3_2 then
      L11_2 = L4_2.players
      L11_2 = L11_2[L10_2]
      L11_2 = L11_2.stake
      if not L11_2 then
        L11_2 = L4_2.players
        L11_2 = L11_2[L10_2]
        L11_2.stake = A2_2
        L11_2 = L4_2.players
        L11_2 = L11_2[L10_2]
        L11_2.account = L6_2
      end
    end
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:PayStakes"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:PayStakes"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if 0 ~= L1_2 then
    L1_2 = Config
    L1_2 = L1_2.EnableBets
    if L1_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L1_2 = source
  L2_2 = L2_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L2_2.players
  L3_2 = L3_2[1]
  if L3_2 then
    L3_2 = L2_2.players
    L3_2 = L3_2[1]
    L3_2 = L3_2.playerId
    if L3_2 == L1_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = L2_2.stakesPaid
  if L3_2 then
    return
  end
  L3_2 = 2147483647
  L4_2 = 1
  L5_2 = 2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L2_2.players
    L8_2 = L8_2[L7_2]
    L8_2 = L8_2.stake
    if L8_2 then
      L8_2 = L2_2.players
      L8_2 = L8_2[L7_2]
      L8_2 = L8_2.stake
      if L3_2 > L8_2 then
        L8_2 = L2_2.players
        L8_2 = L8_2[L7_2]
        L3_2 = L8_2.stake
      end
    end
  end
  L4_2 = true
  L5_2 = pairs
  L6_2 = L2_2.players
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = Config
    L11_2 = L11_2.BetType
    if 1 == L11_2 then
      L10_2.stake = L3_2
    else
      L11_2 = L10_2.stake
      if not L11_2 then
        L10_2.stake = 0
      end
    end
    L11_2 = ESX
    L11_2 = L11_2.GetPlayerFromId
    L12_2 = L10_2.playerId
    L11_2 = L11_2(L12_2)
    if not L11_2 then
      L4_2 = false
      return
    end
    L12_2 = L11_2.getAccount
    L13_2 = L10_2.account
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L13_2 = L12_2.money
      L14_2 = L10_2.stake
      if not (L13_2 < L14_2) then
        goto lbl_83
      end
    end
    L4_2 = false
    ::lbl_83::
  end
  if L4_2 then
    L5_2 = pairs
    L6_2 = L2_2.players
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = L10_2.stake
      if L11_2 > 0 then
        L11_2 = ESX
        L11_2 = L11_2.GetPlayerFromId
        L12_2 = L10_2.playerId
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L12_2 = L11_2.getAccount
          L13_2 = L10_2.account
          L12_2 = L12_2(L13_2)
          L13_2 = L11_2.removeAccountMoney
          L14_2 = L10_2.account
          L15_2 = L10_2.stake
          L13_2(L14_2, L15_2)
          L13_2 = TriggerClientEvent
          L14_2 = "AirHockey:StakePaid"
          L15_2 = L10_2.playerId
          L16_2 = L10_2.stake
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
  else
    L5_2 = pairs
    L6_2 = L2_2.players
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L10_2.stake = 0
    end
  end
  L2_2.stakesPaid = true
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:ToggleNearby"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:ToggleNearby"
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = source
  L4_2 = L7_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2.toggleNearbyPlayer
  L6_2 = L3_2
  L7_2 = A2_2
  L5_2(L6_2, L7_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:CheckTableState"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:CheckTableState"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = L7_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = TriggerClientEvent
  L5_2 = "AirHockey:CheckTableState"
  L6_2 = L2_2
  L7_2 = L3_2
  L4_2(L5_2, L6_2, L7_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:SwitchToFiveM"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:SwitchToFiveM"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = L2_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L2_2.players
  L3_2 = L3_2[1]
  if L3_2 then
    L3_2 = L2_2.players
    L3_2 = L3_2[1]
    L3_2 = L3_2.playerId
    if L3_2 == L1_2 then
      goto lbl_18
    end
  end
  do return end
  ::lbl_18::
  L3_2 = L2_2.useFivem
  if L3_2 then
    return
  end
  L2_2.useFivem = true
  L3_2 = L8_1
  L4_2 = L2_2
  L3_2(L4_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:ServerReady"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:ServerReady"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = L2_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = L3_2.players
  L4_2 = L4_2[1]
  if L4_2 then
    L4_2 = L3_2.players
    L4_2 = L4_2[1]
    L4_2 = L4_2.playerId
    if L4_2 == L2_2 then
      goto lbl_18
    end
  end
  do return end
  ::lbl_18::
  L4_2 = L3_2.players
  L4_2 = L4_2[2]
  if not L4_2 then
    return
  end
  L4_2 = TriggerClientEvent
  L5_2 = "AirHockey:ServerReady"
  L6_2 = L3_2.players
  L6_2 = L6_2[2]
  L6_2 = L6_2.playerId
  L7_2 = A1_2
  L4_2(L5_2, L6_2, L7_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:MatchFinished"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:MatchFinished"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = source
  L3_2 = L2_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = L3_2.players
  L4_2 = L4_2[1]
  if L4_2 then
    L4_2 = L3_2.players
    L4_2 = L4_2[1]
    L4_2 = L4_2.playerId
    if L4_2 == L2_2 then
      goto lbl_18
    end
  end
  do return end
  ::lbl_18::
  L4_2 = L3_2.broadcastPlayers
  L5_2 = "AirHockey:MatchFinished"
  L6_2 = L3_2
  L7_2 = A1_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = pairs
  L5_2 = L3_2.players
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.side
    if L10_2 == A1_2 then
      L10_2 = L9_2.stake
      if L10_2 then
        L10_2 = L9_2.stake
        if L10_2 > 0 then
          L10_2 = ESX
          L10_2 = L10_2.GetPlayerFromId
          L11_2 = L9_2.playerId
          L10_2 = L10_2(L11_2)
          if L10_2 then
            L11_2 = L9_2.stake
            L12_2 = Config
            L12_2 = L12_2.WinMultiplier
            L11_2 = L11_2 * L12_2
            L12_2 = L10_2.addAccountMoney
            L13_2 = L9_2.account
            L14_2 = L11_2
            L12_2(L13_2, L14_2)
            L12_2 = TriggerClientEvent
            L13_2 = "AirHockey:WonStake"
            L14_2 = L9_2.playerId
            L15_2 = L11_2
            L12_2(L13_2, L14_2, L15_2)
          end
        end
      end
    end
  end
  L4_2 = L3_1
  L5_2 = L3_2
  L4_2(L5_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:JoinRequest"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:JoinRequest"
function L11_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = source
  L5_2 = L2_1
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = L5_2.isUsed
  if L6_2 then
    return
  end
  L6_2 = L5_2.nearbyPlayers
  L6_2 = L6_2[L4_2]
  if not L6_2 then
    return
  end
  L6_2 = L5_2.players
  L6_2 = #L6_2
  if L6_2 >= 2 then
    return
  end
  L6_2 = 1
  L7_2 = 2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2.players
    L10_2 = L10_2[L9_2]
    if L10_2 then
      L10_2 = L5_2.players
      L10_2 = L10_2[L9_2]
      L10_2 = L10_2.playerId
      if L10_2 == L4_2 then
        return
      end
    end
  end
  L5_2.useFivem = false
  L6_2 = L1_1
  L6_2[L4_2] = A1_2
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L5_2.players
  L8_2 = {}
  L8_2.playerId = L4_2
  L8_2.netId = A3_2
  L9_2 = GetPlayerName
  L10_2 = L4_2
  L9_2 = L9_2(L10_2)
  L8_2.name = L9_2
  L8_2.score = 0
  L8_2.saves = 0
  L6_2(L7_2, L8_2)
  L6_2 = L5_2.players
  L6_2 = #L6_2
  if 1 == L6_2 then
    L6_2 = L5_2.players
    L6_2 = L6_2[1]
    L6_2.side = A2_2
  else
    L6_2 = L5_2.players
    L6_2 = L6_2[2]
    L7_2 = L5_2.players
    L7_2 = L7_2[1]
    L7_2 = L7_2.side
    if 1 == L7_2 then
      L7_2 = 2
      if L7_2 then
        goto lbl_73
      end
    end
    L7_2 = 1
    ::lbl_73::
    L6_2.side = L7_2
  end
  L6_2 = TriggerClientEvent
  L7_2 = "AirHockey:Joined"
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = L8_1
  L7_2 = L5_2
  L6_2(L7_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:ReplayPack"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:ReplayPack"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = L2_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = L3_2.players
  L4_2 = L4_2[1]
  if L4_2 then
    L4_2 = L3_2.players
    L4_2 = L4_2[1]
    L4_2 = L4_2.playerId
    if L4_2 == L2_2 then
      goto lbl_18
    end
  end
  do return end
  ::lbl_18::
  L4_2 = L3_2.broadcastSubscribers
  L5_2 = "AirHockey:ReplayPack"
  L6_2 = A0_2
  L7_2 = A1_2
  L4_2(L5_2, L6_2, L7_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:AddGoal"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:AddGoal"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = source
  L2_2 = L2_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L2_2.players
  if L3_2 then
    L3_2 = 1
    L4_2 = 2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L2_2.players
      L7_2 = L7_2[L6_2]
      if L7_2 then
        L8_2 = L7_2.playerId
        if L8_2 == L1_2 then
          L8_2 = L7_2.score
          L8_2 = L8_2 + 1
          L7_2.score = L8_2
          L8_2 = L2_2.broadcastNearbies
          L9_2 = "AirHockey:CheckTableState"
          L10_2 = L2_2
          L8_2(L9_2, L10_2)
          L8_2 = L2_2.broadcastPlayers
          L9_2 = "AirHockey:ScoreChanged"
          L10_2 = L6_2
          L11_2 = L2_2
          L8_2(L9_2, L10_2, L11_2)
          L8_2 = L2_2.broadcastSubscribers
          L9_2 = "AirHockey:ScoreChangedForTable"
          L10_2 = L2_2.tableCoords
          L11_2 = L2_2.players
          L8_2(L9_2, L10_2, L11_2)
          break
        end
      end
    end
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:LeaveRequest"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:LeaveRequest"
function L11_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = L5_1
  L2_2 = L0_2
  L1_2(L2_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "AirHockey:GetInfo"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "AirHockey:GetInfo"
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = TriggerClientEvent
  L2_2 = "AirHockey:GetInfo"
  L3_2 = L0_2
  L4_2 = L0_2
  L1_2(L2_2, L3_2, L4_2)
end
L9_1(L10_1, L11_1)
L9_1 = AddEventHandler
L10_1 = "playerDropped"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = L5_1
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
end
L9_1(L10_1, L11_1)