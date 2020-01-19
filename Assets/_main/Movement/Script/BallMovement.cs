using Mangos;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class BallMovement : MonoBehaviour
{
    [Header("Setup")]
    public Camera playerCamera;
    public BallScaler scaler;
    public bool increaseSize;

    [Header("Settings")]
    public BallMovementStats stats;

    [Header("Visuals")]
    public GameObject canvas;
    public ParticleSystem[] damaged_prt;
    public ParticleSystem dash_ptr;
    public ParticleSystem land_ptr;
    public ParticleSystem ripple_ptr;

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

    private float autoGrowCooldown = 10f;
    private float lastAutoGrowTime = 0f;

    protected virtual void Start()
    {
        if (!rigi)
            rigi = GetComponent<Rigidbody>();

        dashDir = Vector3.ProjectOnPlane(playerCamera.transform.forward, Vector3.up);

        floorNormal = Vector3.up;

        lastDashTime = -stats.dashCooldown;
    }

    protected virtual void Update()
    {
        if(increaseSize)
        {
            if (Time.time > lastAutoGrowTime + autoGrowCooldown)
            {
                lastAutoGrowTime = Time.time;
                GetPushed(new PushData(transform.position, Vector3.zero, 0));
            }
        }
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
        if (lastDashTime + stats.dashCooldown < Time.time || infiniteDash)
        {
            rigi.velocity *= stats.velConserveRatio;
            rigi.AddForce(Vector3.ProjectOnPlane(dashDir, isGrounded ? floorNormal : Vector3.up) * stats.dashForce, ForceMode.Impulse); //Vector de enfrente proyectado en un plano con normal (0,1,0))
            isDashing = true;
            lastDashTime = Time.time;
            GameObject prt = Instantiate(dash_ptr, transform.position, transform.rotation).gameObject;
            Destroy(prt, 2.0f);
            Invoke("EndDash", 0.7f);
        }
    }

    public virtual void Special(){
        Debug.Log("Special default");
    }

    void EndDash()
    {
        isDashing = false;
    }

    public void Despawn()
    {
        rigi.velocity = Vector3.zero;
        rigi.isKinematic = true;
        gameObject.SetActive(false);
    }

    public void Spawn(Vector3 pos)
    {
        Debug.Log("Spawning");
        rigi.isKinematic = false;
        transform.position = pos;
        transform.rotation = Quaternion.identity;
        gameObject.SetActive(true);
    }

    public void SetDamaged(bool _bool)
    {
        for (int i = 0; i < damaged_prt.Length; i++)
        {
            if (_bool) damaged_prt[i].Play();
            else damaged_prt[i].Stop();
        } 
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(isDashing)
        {
            Vector3 point = collision.contactCount > 0 ? collision.contacts[0].point : transform.position;
            collision.collider.gameObject.SendMessage("GetPushed", new PushData(point, rigi.velocity, stats.dashForce/12f) , SendMessageOptions.DontRequireReceiver);
            Instantiate(ripple_ptr, collision.contacts[0].point, Quaternion.LookRotation(collision.contacts[0].normal));
        }

        for (int i = 0; i < collision.contactCount; i++)
        {
            if (Vector3.Dot(Vector3.up, collision.contacts[i].normal) > 0.25f) //Si estoy tocando algo no muy inclinado
            { 
                isGrounded = canJump = true;
                GameObject prt = Instantiate(land_ptr, transform.position, Quaternion.identity).gameObject;
            }
        }
    }

    private void OnCollisionStay(Collision collision)
    {
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

    void GetPushed(Mangos.PushData pd)
    {
        rigi.AddForceAtPosition(pd.direction * pd.force, pd.point, ForceMode.Impulse);
        scaler.GetHit(Mathf.Floor(pd.force/10f));
    }

    private void OnCollisionExit(Collision collision)
    {
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
