using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;
using Cinemachine;

public class BallControler : MonoBehaviour
{
    public int playerID;
    public BallMovement movement;
    public CinemachineFreeLook freeLook;
    public AxisState axis1;
    private Player player;

    Vector2 moveAxes, cameraAxes;
    bool jump, dash, special;

    void Awake()
    {
        player = ReInput.players.GetPlayer(playerID);
        //aStateX = new AxisState()
    }

    void Start()
    {
        axis1 = freeLook.m_YAxis;
    }

    void Update()
    {
        GetInput();
        ProcessInput();

        //////////////
        freeLook.m_YAxis = axis1;
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
        //Debug.Log(player.GetCurrentInputSources("Move_Camera_H")[0].elementIdentifierName);
    }

    private void ProcessInput()
    {
        movement.Move(moveAxes.x, moveAxes.y);
        axis1.m_InputAxisValue = cameraAxes.y;
        axis1.Update(Time.deltaTime);

        if (jump)
            movement.Jump();
        if (dash)
            movement.Dash();
        if (special)
            movement.Special();
    }
}
