using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class BallMovement : MonoBehaviour
{
    [Header("Setup")]
    public Camera playerCamera;
    [Header("Settings")]
    public BallMovementStats stats;

    protected Rigidbody rigi;
    protected Vector3 dashDir;

    void Start()
    {
        if (!rigi)
            rigi = GetComponent<Rigidbody>();

        dashDir = Vector3.ProjectOnPlane(playerCamera.transform.forward, Vector3.up);
    }

    void Update()
    {
        //Debug inputs
        /*Move(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));

        if(Input.GetKeyDown(KeyCode.Space))
        {
            Jump();
        }

        if(Input.GetMouseButtonDown(0))
        {
            Dash();
        }*/
    }

    public void Move(float _x, float _y)
    {
        if (Mathf.Abs(_x) > float.Epsilon || Mathf.Abs(_y) > float.Epsilon)
        {
            Vector3 cameraForward = Vector3.ProjectOnPlane(playerCamera.transform.forward, Vector3.up); //Vector de enfrente proyectado en un plano con normal (0,1,0)
            Vector3 cameraRight = Vector3.ProjectOnPlane(playerCamera.transform.right, Vector3.up); //Vector de derecha proyectado

            Vector3 direction = (cameraRight * _x + cameraForward * _y).normalized;

            float mod = 1;
            float dot = Vector3.Dot(direction, rigi.velocity.normalized);
            if (dot < 0)
            {
                mod = stats.breakForce * Mathf.Abs(dot);
            }
            rigi.AddForce(direction * (stats.moveForce + mod), ForceMode.Force);

            dashDir = direction;
        }
    }

    public void Jump()
    {
        rigi.AddForce(Vector3.up * stats.jumpForce, ForceMode.Impulse);
    }

    public void Dash()
    {
        rigi.velocity *= stats.dashVelMod;
        rigi.AddForce(Vector3.ProjectOnPlane(dashDir, Vector3.up)*stats.dashForce, ForceMode.Impulse); //Vector de enfrente proyectado en un plano con normal (0,1,0))
    }

    public virtual void Special()
    {

    }
}

[Serializable]
public class BallMovementStats
{
    public float moveForce;
    public float breakForce;
    public float jumpForce;
    public float dashForce;
    public float dashVelMod;
    public float weightMod;
}
