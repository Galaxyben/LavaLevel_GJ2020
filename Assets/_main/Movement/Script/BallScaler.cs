using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class BallScaler : MonoBehaviour
{
    Rigidbody rigi;
    void Start()
    {
        rigi = GetComponent<Rigidbody>();
    }

    void GetHit()
    {
        transform.localScale = transform.localScale + Vector3.one * 0.1f;
        rigi.mass += 0.5f;
    }
}
