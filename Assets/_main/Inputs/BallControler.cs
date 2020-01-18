using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;

public class BallControler : MonoBehaviour
{
    public int playerID;
    public BallMovement movement;
    private Player player;

    Vector2 moveAxes, cameraAxes;
    bool jump, dash, special;

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
        moveAxes.x = player.GetAxis("Move_Horizontal");
        moveAxes.y = player.GetAxis("Move_Vertical");
        cameraAxes.x = player.GetAxis("Move_Camera_H");
        cameraAxes.y = player.GetAxis("Move_Camera_V");
        jump = player.GetButtonDown("Jump");
        dash = player.GetButtonDown("Dash");
        special = player.GetButtonDown("Special");
    }

    private void ProcessInput()
    {
        movement.Move(moveAxes.x, moveAxes.y);
        Debug.Log(cameraAxes);

        if (jump)
            movement.Jump();
        if (dash)
            movement.Dash();
        if (special)
            movement.Special();
    }
}
