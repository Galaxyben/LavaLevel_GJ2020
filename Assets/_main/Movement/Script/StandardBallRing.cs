using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider))]
public class StandardBallRing : MonoBehaviour
{
    Collider area;

    private void Start()
    {
        area = GetComponent<Collider>();
    }

    private void OnTriggerEnter(Collider other)
    {
        
    }
}
