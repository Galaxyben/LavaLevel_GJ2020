using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mangos;

public class StandardBallMovement : BallMovement
{
    public Collider trigger;
    public float bumperForce;

    private float upTime = 0.1f;
    private float cooldown = 1.0f;
    private float lastUse = -1.0f;

    [Header("Debug")]
    public Renderer rend;
    protected override void Start()
    {
        base.Start();
        trigger.enabled = false;
    }

    public override void Special()
    {
        if (Time.time > lastUse + cooldown)
        {
            lastUse = Time.time;
            trigger.enabled = true;
            rend.enabled = true;
        }
    }

    protected override void Update()
    {
        base.Update();

        if(Time.time > lastUse + upTime)
        {
            rend.enabled = false;
            trigger.enabled = false;
            rend.enabled = false;
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("Special bumper trigger enter");
        if (other.gameObject != gameObject)
        {
            Debug.Log("Special trigger enter");
            Vector3 point = other.ClosestPoint(transform.position);
            Vector3 dir = (transform.position - point).normalized;
            other.gameObject.SendMessage("GetPushed", new PushData(point, -dir, bumperForce), SendMessageOptions.DontRequireReceiver);
        }
    }
}
