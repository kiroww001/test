local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = 0
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = L0_2 + 1
  L1_1 = L0_2
  L0_2 = "fivem"
  L1_2 = "_"
  L2_2 = L1_1
  L0_2 = L0_2 .. L1_2 .. L2_2
  return L0_2
end
function L3_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = nil
  end
  return L1_2
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.id
    if L7_2 == A0_2 then
      return L6_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = {}
  L3_2 = L2_1
  L3_2 = L3_2()
  L2_2.id = L3_2
  L2_2.playerId = A0_2
  L2_2.instanceId = A1_2
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = L2_2.opPeer
    if L1_3 then
      return
    end
    L1_3 = L4_1
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      return
    end
    L2_3 = L1_3.opPeer
    if L2_3 then
      return
    end
    L2_2.opPeer = L1_3
    L2_3 = L2_2
    L1_3.opPeer = L2_3
    L2_3 = L2_2.GotConnectedToOp
    L2_3()
    L2_3 = L2_2.opPeer
    L2_3 = L2_3.OpGotConnected
    L2_3()
  end
  L2_2.Connect = L3_2
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = L2_2.opPeer
    if not L1_3 then
      return
    end
    L1_3 = L2_2.opPeer
    L1_3 = L1_3.MessageReceived
    L2_3 = A0_3
    L1_3(L2_3)
  end
  L2_2.SendToOp = L3_2
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerClientEvent
    L1_3 = "AirHockey:PeerEvent"
    L2_3 = L2_2.playerId
    L3_3 = {}
    L3_3.action = "pClose"
    L4_3 = L2_2.instanceId
    L3_3.peerInstanceId = L4_3
    L4_3 = L2_2.id
    L3_3.id = L4_3
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L2_2.DisconnectFromOp
    L0_3()
  end
  L2_2.Close = L3_2
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = L2_2.opPeer
    if L1_3 then
      L1_3 = L2_2.opPeer
      L1_3 = L1_3.OpGotDisconnected
      L2_3 = A0_3
      L1_3(L2_3)
      L2_2.opPeer = nil
    end
  end
  L2_2.DisconnectFromOp = L3_2
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = TriggerClientEvent
    L2_3 = "AirHockey:PeerEvent"
    L3_3 = L2_2.playerId
    L4_3 = {}
    L4_3.action = "cData"
    L5_3 = L2_2.instanceId
    L4_3.peerInstanceId = L5_3
    L5_3 = L2_2.opPeer
    L5_3 = L5_3.id
    L4_3.connId = L5_3
    L5_3 = L2_2.id
    L4_3.id = L5_3
    L4_3.data = A0_3
    L1_3(L2_3, L3_3, L4_3)
  end
  L2_2.MessageReceived = L3_2
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerClientEvent
    L1_3 = "AirHockey:PeerEvent"
    L2_3 = L2_2.playerId
    L3_3 = {}
    L3_3.action = "cOpen"
    L4_3 = L2_2.instanceId
    L3_3.peerInstanceId = L4_3
    L4_3 = L2_2.opPeer
    L4_3 = L4_3.id
    L3_3.connId = L4_3
    L4_3 = L2_2.id
    L3_3.id = L4_3
    L0_3(L1_3, L2_3, L3_3)
  end
  L2_2.GotConnectedToOp = L3_2
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerClientEvent
    L1_3 = "AirHockey:PeerEvent"
    L2_3 = L2_2.playerId
    L3_3 = {}
    L3_3.action = "pConnection"
    L4_3 = L2_2.opPeer
    L4_3 = L4_3.id
    L3_3.connId = L4_3
    L4_3 = L2_2.instanceId
    L3_3.peerInstanceId = L4_3
    L0_3(L1_3, L2_3, L3_3)
  end
  L2_2.OpGotConnected = L3_2
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 then
      L1_3 = TriggerClientEvent
      L2_3 = "AirHockey:PeerEvent"
      L3_3 = L2_2.opPeer
      L3_3 = L3_3.playerId
      L4_3 = {}
      L4_3.action = "cError"
      L5_3 = L2_2.opPeer
      L5_3 = L5_3.instanceId
      L4_3.peerInstanceId = L5_3
      L5_3 = L2_2.id
      L4_3.connId = L5_3
      L5_3 = L2_2.id
      L4_3.id = L5_3
      L4_3.err = A0_3
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = TriggerClientEvent
      L2_3 = "AirHockey:PeerEvent"
      L3_3 = L2_2.playerId
      L4_3 = {}
      L4_3.action = "cError"
      L5_3 = L2_2.instanceId
      L4_3.peerInstanceId = L5_3
      L5_3 = L2_2.opPeer
      L5_3 = L5_3.id
      L4_3.connId = L5_3
      L5_3 = L2_2.id
      L4_3.id = L5_3
      L4_3.err = A0_3
      L1_3(L2_3, L3_3, L4_3)
    end
    L1_3 = TriggerClientEvent
    L2_3 = "AirHockey:PeerEvent"
    L3_3 = L2_2.opPeer
    L3_3 = L3_3.playerId
    L4_3 = {}
    L4_3.action = "cClose"
    L5_3 = L2_2.opPeer
    L5_3 = L5_3.instanceId
    L4_3.peerInstanceId = L5_3
    L5_3 = L2_2.id
    L4_3.connId = L5_3
    L5_3 = L2_2.id
    L4_3.id = L5_3
    L1_3(L2_3, L3_3, L4_3)
    L1_3 = TriggerClientEvent
    L2_3 = "AirHockey:PeerEvent"
    L3_3 = L2_2.playerId
    L4_3 = {}
    L4_3.action = "cClose"
    L5_3 = L2_2.instanceId
    L4_3.peerInstanceId = L5_3
    L5_3 = L2_2.opPeer
    L5_3 = L5_3.id
    L4_3.connId = L5_3
    L5_3 = L2_2.id
    L4_3.id = L5_3
    L1_3(L2_3, L3_3, L4_3)
    L2_2.opPeer = nil
  end
  L2_2.OpGotDisconnected = L3_2
  L3_2 = L0_1
  L3_2[A0_2] = L2_2
  return L2_2
end
L6_1 = RegisterNetEvent
L7_1 = "AirHockey:CreateLocalPeer"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "AirHockey:CreateLocalPeer"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = L5_1
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = TriggerClientEvent
  L4_2 = "AirHockey:PeerEvent"
  L5_2 = L1_2
  L6_2 = {}
  L6_2.action = "pOpen"
  L7_2 = L2_2.instanceId
  L6_2.peerInstanceId = L7_2
  L7_2 = L2_2.id
  L6_2.id = L7_2
  L3_2(L4_2, L5_2, L6_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "AirHockey:CloseLocalPeer"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "AirHockey:CloseLocalPeer"
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = L3_1
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = L1_2.Close
  L2_2()
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "AirHockey:ConnectToPeer"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "AirHockey:ConnectToPeer"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = source
  L3_2 = L3_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = L3_2.id
  if L4_2 == A1_2 then
    return
  end
  L4_2 = L3_2.opPeer
  if L4_2 then
    return
  end
  L3_2.instanceId = A0_2
  L4_2 = L3_2.Connect
  L5_2 = A1_2
  L4_2(L5_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "AirHockey:PeerDisconnectOp"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "AirHockey:PeerDisconnectOp"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = L3_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2.instanceId = A0_2
  L3_2 = L2_2.opPeer
  if not L3_2 then
    return
  end
  L3_2 = L2_2.DisconnectFromOp
  L3_2()
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "AirHockey:PeerSendToOp"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "AirHockey:PeerSendToOp"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = source
  L3_2 = L3_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2.instanceId = A0_2
  L4_2 = L3_2.opPeer
  if not L4_2 then
    return
  end
  L4_2 = L3_2.SendToOp
  L5_2 = A1_2
  L4_2(L5_2)
end
L6_1(L7_1, L8_1)