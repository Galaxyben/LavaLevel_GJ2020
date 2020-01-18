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

    [Header("Debug/Dev")]
    public bool infiniteJumps;
    public bool infiniteDash;
    public Vector3 floorNormal;

    protected Rigidbody rigi;
    protected Vector3 dashDir;
    protected bool isGrounded = false;
    protected bool canJump = true;
    protected bool isDashing = false;
    protected float lastDashTime;

    protected virtual void Start()
    {
        if (!rigi)
            rigi = GetComponent<Rigidbody>();

        dashDir = Vector3.ProjectOnPlane(playerCamera.transform.forward, Vector3.up);

        floorNormal = Vector3.up;

        lastDashTime = -stats.dashCooldown;
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
        if (canJump || infiniteJumps)
        {
            rigi.velocity = new Vector3(rigi.velocity.x, rigi.velocity.y * stats.velConserveRatio, rigi.velocity.z);
            rigi.AddForce((isGrounded ? floorNormal : Vector3.up) * stats.jumpForce, ForceMode.Impulse);
            canJump = false;
        }
    }

    public void Dash()
    {
        if (lastDashTime + stats.dashCooldown > Time.time || infiniteDash)
        {
            rigi.velocity *= stats.velConserveRatio;
            rigi.AddForce(Vector3.ProjectOnPlane(dashDir, isGrounded ? floorNormal : Vector3.up) * stats.dashForce, ForceMode.Impulse); //Vector de enfrente proyectado en un plano con normal (0,1,0))
            isDashing = true;
            lastDashTime = Time.time;
            Invoke("EndDash", 0.7f);
        }
    }

    public virtual void Special(){}

    void EndDash()
    {
        isDashing = false;
    }

    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("Col enter");
        if(isDashing)
        {
            collision.collider.gameObject.SendMessage("GetHit", SendMessageOptions.DontRequireReceiver);    
        }

        for (int i = 0; i < collision.contactCount; i++)
        {
            if (Vector3.Dot(Vector3.up, collision.contacts[i].normal) > 0.25f) //Si estoy tocando algo no muy inclinado
                isGrounded = canJump = true;
        }
    }

    private void OnCollisionStay(Collision collision)
    {
        Debug.Log("Col stay");
        if (collision.contactCount > 0)
        {
            //Calculando el piso menos inclinado para tomar esa normal y utilizarla para el dash
            isGrounded = false;
            float bestDot = -1;
            int bestContact = 0;
            for (int i = 0; i < collision.contactCount; i++)
            {
                float dotUp = Vector3.Dot(Vector3.up, collision.contacts[i].normal);

                if (dotUp > 0.25f)
                    isGrounded = true;

                if (dotUp > bestDot)
                {
                    bestDot = dotUp;
                    bestContact = i;
                }
            }

            if(Vector3.Dot(rigi.velocity, collision.contacts[bestContact].normal) < 0.1f)   //Si la velocidad no es opuesta a la normal, para evitar que canJump se haga true despues
            {                                                                               //de un brinco por lo que tarda en dejar el piso
                canJump = true;
            }

            floorNormal = collision.contacts[bestContact].normal;
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        Debug.Log("Col exit");
        isGrounded = false;
        for (int i = 0; i < collision.contactCount; i++)
        {
            if (Vector3.Dot(Vector3.up, collision.contacts[i].normal) > 0.25f)
                isGrounded = true;
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
    [Tooltip("Tiempo de espera para volver a usar el dash")]
    public float dashCooldown;
}
