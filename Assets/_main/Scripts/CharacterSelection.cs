using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Doozy.Engine;
using UnityEngine.UI;
using Rewired;

public class CharacterSelection : MonoBehaviour
{
    public enum State
    {
        MAIN_MENU,
        CHARACTER_SELECTION,
        SELECTED
    }

    Player player;
    public CharacterSelectorController csc;
    public State state;
    public int playerID;

    public bool up;
    public bool down;
    public bool right;
    public bool left;
    public bool pressedA;

    private void Awake()
    {
        player = ReInput.players.GetPlayer(playerID);
    }

    void Start()
    {
        state = State.MAIN_MENU;
    }

    private void FixedUpdate()
    {
        GetInput();
    }

    void Update()
    {
       // GetInput();
        ProcessInput();
    }

    private void GetInput()
    {
        up = player.GetButtonDown("Move_Vertical");
        right = player.GetButtonDown("Move_Horizontal");
        down = player.GetNegativeButtonDown("Move_Vertical");
        left = player.GetNegativeButtonDown("Move_Horizontal");
        pressedA = player.GetButtonDown("Select");
    }

    public void ForcedChangeState()
    {
        state = State.CHARACTER_SELECTION;
    }

    private void ProcessInput()
    {
        if (pressedA)
        {
            Debug.Log("Wasamamaya");
        }
        if (state == State.MAIN_MENU)
        {
            if (up)
            {

            }
            if (down)
            {

            }
            if (pressedA)
            {
                state = State.CHARACTER_SELECTION;
            }
        }
        else if( state == State.CHARACTER_SELECTION)
        {
            if (right)
            {
                csc.NextCharacter();
            }
            if (left)
            {
                csc.LastCharacter();
            }
            if (pressedA)
            {
                csc.playerID = playerID;
                csc.SelectCharacter();

                player.controllers.maps.SetMapsEnabled(false, "UI");
                player.controllers.maps.SetMapsEnabled(true, "Default");

                state = State.SELECTED;
            }
        }
    }
}
