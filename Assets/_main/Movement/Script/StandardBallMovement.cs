using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mangos;

public class StandardBallMovement : BallMovement
{
    public Collider trigger;
    public float bumperForce;

    private List<Vector3> directions = new List<Vector3>();

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
        if(trigger.enabled && directions.Count > 0)
        {
            for(int i = 0; i < directions.Count; i++)
            {
                rigi.AddForce(directions[i] * (bumperForce/directions.Count), ForceMode.Impulse);
            }
        }

        directions.Clear();
        trigger.enabled = false;
        rend.material.color = Color.white;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject != gameObject)
        {
            Vector3 point = other.ClosestPoint(transform.position);
            Vector3 dir = (transform.position - point).normalized;
            directions.Add(dir);
            other.gameObject.SendMessage("GetPushed", new PushData(point, -dir, bumperForce), SendMessageOptions.DontRequireReceiver);
        }
    }
}
