local L0_1, L1_1, L2_1, L3_1
L0_1 = false
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L0_1
  if not L0_2 then
    L0_2 = true
    L0_1 = L0_2
    L0_2 = TriggerEvent
    L1_2 = "rcore_stats:api:ensureCategory"
    L2_2 = "minigames"
    L3_2 = "Minigames"
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
      L0_3 = TriggerEvent
      L1_3 = "rcore_stats:api:ensureStatType"
      L2_3 = "rcore_airhockey_games_played"
      L3_3 = "Air Hockey - Games Played"
      L4_3 = "player"
      L5_3 = nil
      L6_3 = "minigames"
      L7_3 = true
      L8_3 = nil
      function L9_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_games_played_ach1"
        L3_4 = "Air Hockey Enthusiast"
        L4_4 = "Play 10 games of air hockey. Starting to feel the rush!"
        L5_4 = "mouse-pointer-2"
        L6_4 = "rcore_airhockey_games_played"
        L7_4 = 10
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_games_played_ach2"
        L3_4 = "Air Hockey Aficionado"
        L4_4 = "Play 50 games of air hockey. Can\226\128\153t get enough of the action!"
        L5_4 = "mouse-pointer-2"
        L6_4 = "rcore_airhockey_games_played"
        L7_4 = 50
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_games_played_ach3"
        L3_4 = "Air Hockey Addict"
        L4_4 = "Play 100 games of air hockey. Born for this!"
        L5_4 = "mouse-pointer-2"
        L6_4 = "rcore_airhockey_games_played"
        L7_4 = 100
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureStatType"
        L2_4 = "rcore_airhockey_total_games"
        L3_4 = "Air Hockey - Total Games"
        L4_4 = "server"
        L5_4 = nil
        L6_4 = "minigames"
        L7_4 = true
        L8_4 = "rcore_airhockey_games_played"
        function L9_4()
          local L0_5, L1_5
        end
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4)
      end
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      L0_3 = TriggerEvent
      L1_3 = "rcore_stats:api:ensureStatType"
      L2_3 = "rcore_airhockey_games_won"
      L3_3 = "Air Hockey - Games Won"
      L4_3 = "player"
      L5_3 = nil
      L6_3 = "minigames"
      L7_3 = true
      L8_3 = nil
      function L9_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_games_won_ach1"
        L3_4 = "Puck Novice"
        L4_4 = "Win 10 games of air hockey. Getting the hang of it"
        L5_4 = "trophy"
        L6_4 = "rcore_airhockey_games_won"
        L7_4 = 10
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_games_won_ach2"
        L3_4 = "Puck Champ"
        L4_4 = "Win 50 games of air hockey. Master of the table!"
        L5_4 = "trophy"
        L6_4 = "rcore_airhockey_games_won"
        L7_4 = 50
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_games_won_ach3"
        L3_4 = "Puck Legend"
        L4_4 = "Win 100 games of air hockey. Untouchable on the ice!"
        L5_4 = "trophy"
        L6_4 = "rcore_airhockey_games_won"
        L7_4 = 100
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
      end
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      L0_3 = TriggerEvent
      L1_3 = "rcore_stats:api:ensureStatType"
      L2_3 = "rcore_airhockey_games_lost"
      L3_3 = "Air Hockey - Games Lost"
      L4_3 = "player"
      L5_3 = nil
      L6_3 = "minigames"
      L7_3 = true
      L8_3 = nil
      function L9_3()
        local L0_4, L1_4
      end
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      L0_3 = TriggerEvent
      L1_3 = "rcore_stats:api:ensureStatType"
      L2_3 = "rcore_airhockey_shoots_on_net"
      L3_3 = "Air Hockey - Shoots on Net"
      L4_3 = "player"
      L5_3 = nil
      L6_3 = "minigames"
      L7_3 = true
      L8_3 = nil
      function L9_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_shoots_on_net_ach1"
        L3_4 = "Net Seeker"
        L4_4 = "Take 10 shots on net. Aiming for glory!"
        L5_4 = "square-dashed-mouse-pointer"
        L6_4 = "rcore_airhockey_shoots_on_net"
        L7_4 = 10
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_shoots_on_net_ach2"
        L3_4 = "Target Practice"
        L4_4 = "Take 50 shots on net. Hitting your stride!"
        L5_4 = "square-dashed-mouse-pointer"
        L6_4 = "rcore_airhockey_shoots_on_net"
        L7_4 = 50
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_shoots_on_net_ach3"
        L3_4 = "Goal Machine"
        L4_4 = "Take 100 shots on net. Unstoppable force!"
        L5_4 = "square-dashed-mouse-pointer"
        L6_4 = "rcore_airhockey_shoots_on_net"
        L7_4 = 100
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
      end
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      L0_3 = TriggerEvent
      L1_3 = "rcore_stats:api:ensureStatType"
      L2_3 = "rcore_airhockey_shoots_saves"
      L3_3 = "Air Hockey - Saves"
      L4_3 = "player"
      L5_3 = nil
      L6_3 = "minigames"
      L7_3 = true
      L8_3 = nil
      function L9_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_shoots_saves_ach1"
        L3_4 = "Defensive Wall"
        L4_4 = "Make 10 saves. Not on my watch!"
        L5_4 = "mouse-pointer-ban"
        L6_4 = "rcore_airhockey_shoots_saves"
        L7_4 = 10
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_shoots_saves_ach2"
        L3_4 = "Save Master"
        L4_4 = "Make 50 saves. Blocking everything!"
        L5_4 = "mouse-pointer-ban"
        L6_4 = "rcore_airhockey_shoots_saves"
        L7_4 = 50
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = TriggerEvent
        L1_4 = "rcore_stats:api:ensureAchievement"
        L2_4 = "rcore_airhockey_shoots_saves_ach3"
        L3_4 = "Goalie God"
        L4_4 = "Make 100 saves. Nothing gets past you!"
        L5_4 = "mouse-pointer-ban"
        L6_4 = "rcore_airhockey_shoots_saves"
        L7_4 = 100
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
      end
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    end
    L0_2(L1_2, L2_2, L3_2, L4_2)
  end
end
L2_1 = Config
L2_1 = L2_1.Rcore_Stats
if L2_1 then
  L2_1 = CreateThread
  function L3_1()
    local L0_2, L1_2, L2_2
    L0_2 = GetResourceState
    L1_2 = "rcore_stats"
    L0_2 = L0_2(L1_2)
    if "started" ~= L0_2 then
      L0_2 = GetResourceState
      L1_2 = "rcore_stats"
      L0_2 = L0_2(L1_2)
      if "starting" ~= L0_2 then
        goto lbl_22
      end
    end
    while true do
      L0_2 = L0_1
      if L0_2 then
        break
      end
      L0_2 = TriggerEvent
      L1_2 = "rcore_stats:api:isReady"
      function L2_2(A0_3)
        local L1_3
        if A0_3 then
          L1_3 = L1_1
          L1_3()
        end
      end
      L0_2(L1_2, L2_2)
      L0_2 = Wait
      L1_2 = 1000
      L0_2(L1_2)
    end
    ::lbl_22::
  end
  L2_1(L3_1)
end