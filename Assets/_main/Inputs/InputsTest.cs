using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;

public class InputsTest : MonoBehaviour
{
    public int playerID;
    public float moveSpeed;

    private Player player;
    private Vector3 moveVector;

    void Awake()
    {
        player = ReInput.players.GetPlayer(playerID);
    }

    void Update()
    {
        GetInput();
        ProcessInput();
    }

    private void GetInput()
    {
        moveVector.x = player.GetAxis("Move_Horizontal");
        moveVector.z = player.GetAxis("Move_Vertical");
    }

    private void ProcessInput()
    {
        if(moveVector != Vector3.zero)
        {
            transform.Translate(moveVector * moveSpeed);
        }
    }
}
