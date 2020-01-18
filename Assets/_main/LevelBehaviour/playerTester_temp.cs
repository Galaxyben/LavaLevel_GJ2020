using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerTester_temp : MonoBehaviour
{
    public float force;
    private Rigidbody rig;

    private void Start()
    {
        rig = GetComponent<Rigidbody>();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            rig.AddForce(transform.forward * force);
        }
    }
}
