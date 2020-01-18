using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StandardBallMovement : BallMovement
{
    public Collider trigger;
    public float bumperForce;

    private List<Vector3> points = new List<Vector3>();

    [Header("Debug")]
    public Renderer rend;
    protected override void Start()
    {
        base.Start();

        trigger.enabled = false;
    }

    public override void Special()
    {
        trigger.enabled = true;
        rend.material.color = Color.red;
    }

    private void Update()
    {
        if(trigger.enabled && points.Count > 0)
        {
            //rigi.AddForce
        }

        trigger.enabled = false;
        rend.material.color = Color.white;
    }

    private void OnTriggerEnter(Collider other)
    {
        points.Add(other.ClosestPoint(transform.position));
    }
}
