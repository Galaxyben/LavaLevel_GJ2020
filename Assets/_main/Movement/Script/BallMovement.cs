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
    protected bool isDashing;

    void Start()
    {
        if (!rigi)
            rigi = GetComponent<Rigidbody>();

        dashDir = Vector3.ProjectOnPlane(playerCamera.transform.forward, Vector3.up);
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
        rigi.velocity *= stats.velConserveRatio;
        rigi.AddForce(Vector3.up * stats.jumpForce, ForceMode.Impulse);
    }

    public void Dash()
    {
        rigi.velocity *= stats.velConserveRatio;
        rigi.AddForce(Vector3.ProjectOnPlane(dashDir, Vector3.up)*stats.dashForce, ForceMode.Impulse); //Vector de enfrente proyectado en un plano con normal (0,1,0))
        isDashing = true;
        Invoke("EndDash", 0.7f);
    }

    public virtual void Special()
    {

    }

    void EndDash()
    {
        isDashing = false;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(isDashing)
        {
            collision.collider.gameObject.SendMessage("GetHit", SendMessageOptions.DontRequireReceiver);    
        }
    }
}

[Serializable]
public class BallMovementStats
{
    [Tooltip("Fuerza con la que se mueve")]
    public float moveForce;
    [Tooltip("Fuerza con la que se frena al moverse al lado contrario")]
    public float breakForce;
    [Tooltip("Fuerza con la que brinca")]
    public float jumpForce;
    [Tooltip("Fuerza con la que dashea")]
    public float dashForce;
    [Range(0, 1)]
    [Tooltip("Ratio de velocidad que se conserva antes de hacer un brinco o dash")]
    public float velConserveRatio;
    [Tooltip("Modificador de peso según el daño, puede que dos bolas tengan el mismo tamaño pero una pese mas que otra por esta variable (ahorita no hace nada)")]
    public float weightMod;
}
