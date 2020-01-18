using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]

public class LevelBehaviour : MonoBehaviour
{
    public GameObject levelLimits;
    private float levelRadius;
    private Rigidbody rig;

    void Start()
    {
        rig = GetComponent<Rigidbody>();
        levelRadius = levelLimits.transform.lossyScale.x / 2;
    }

    public void ApplyTorque(float _force, Vector3 _position, Vector3 _direction)
    {
        float distance = Vector3.Distance(transform.position, _position);
        Debug.Log("Distance: " + distance);
        Debug.Log("Applying Torque with distance multiplier: " + (distance / levelRadius));
        if (distance <= levelRadius)
        {
            rig.AddTorque(_direction * _force * (distance/levelRadius));
            Debug.DrawRay(_position, _direction, Color.red, 10.0f);
            Debug.Log("Applied Torque at: " + _position + " with a force of: " + _force);
            Debug.LogError("Stop");
        }
    }
}
