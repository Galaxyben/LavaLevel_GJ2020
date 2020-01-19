using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;
using Rewired.Demos;
using System;

[AddComponentMenu("")]
public class PessStartToJoin : MonoBehaviour
{
    public bool enterUI;

    private static PessStartToJoin instance;
    
    public static Player GetRewiredPlayer(int gamePlayerId)
    {
        if (!ReInput.isReady) return null;
        if(instance == null)
        {
            Debug.LogError("No inicializado. Tienes el script en tu escena?");
            return null;
        }
        for(int i = 0; i < instance.playerMap.Count; i++)
        {
            if (instance.playerMap[i].gamePlayerId == gamePlayerId) return ReInput.players.GetPlayer(instance.playerMap[i].rewiredPlayerId);
        }
        return null;
    }

    public int maxPlayers = 4;

    private List<PlayerMap> playerMap;  //Maps Rewired Playes ids to game players ids
    private int gamePlayerIdCounter = 0;

    void Awake()
    {
        playerMap = new List<PlayerMap>();
        instance = this;
    }

    void Update()
    {
        for(int i = 0; i < ReInput.players.playerCount; i++)
        {
            if(ReInput.players.GetPlayer(i).GetButtonDown("JoinGame"))
            {
                AssignNextPlayer(i);
            }
        }
    }

    void AssignNextPlayer(int rewiredPlayerId)
    {
        if(playerMap.Count >= maxPlayers)
        {
            Debug.LogError("Max player limit already reached");
            return;
        }

        int gamePlayerId = GetNextGamePlayerId();

        playerMap.Add(new PlayerMap(rewiredPlayerId, gamePlayerId));

        Player rewiredPlayer = ReInput.players.GetPlayer(rewiredPlayerId);

        // Disable the Assignment map category in Player so no more JoinGame Actions return
        rewiredPlayer.controllers.maps.SetMapsEnabled(false, "Assignment");

        // Enable UI control for this Player now that he has joined
        if (enterUI)
            rewiredPlayer.controllers.maps.SetMapsEnabled(true, "UI");
        else
            rewiredPlayer.controllers.maps.SetMapsEnabled(true, "Default");

        Debug.Log("Added Rewired Player id " + rewiredPlayerId + " to game player " + gamePlayerId);

    }

    private int GetNextGamePlayerId()
    {
        return gamePlayerIdCounter++;
    }

    private class PlayerMap
    {
        public int rewiredPlayerId;
        public int gamePlayerId;

        public PlayerMap(int rewiredPlayerId, int gamePlayerId)
        {
            this.rewiredPlayerId = rewiredPlayerId;
            this.gamePlayerId = gamePlayerId;
        }
    }
}
