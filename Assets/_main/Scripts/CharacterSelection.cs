using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Doozy.Engine;
using UnityEngine.UI;
using Rewired;

public class CharacterSelection : MonoBehaviour
{
    Player player1;
    public int playerID;
    public bool up;
    public bool down;
    public bool right;
    public bool left;
    public bool pressedA;

    private void Awake()
    {
        player1 = ReInput.players.GetPlayer(playerID);
    }

    void Start()
    {
        
    }

    void Update()
    {
        GetInput();
        ProcessInput();
    }

    private void GetInput()
    {
        up = player1.GetButtonDown("Move_Vertical");
        right = player1.GetButtonDown("Move_Horizontal");
        down = player1.GetNegativeButtonDown("Move_Vertical");
        left = player1.GetNegativeButtonDown("Move_Horizontal");
        pressedA = player1.GetButtonDown("Select");
    }

    private void ProcessInput()
    {
        if (up)
            Debug.Log("Se arriba");
        if (right)
            Debug.Log("Se redercha");
        if (left)
            Debug.Log("Se isierda");
        if (down)
            Debug.Log("Se bajo");
        if (pressedA)
            Debug.Log("Se selecciona");
    }
}
