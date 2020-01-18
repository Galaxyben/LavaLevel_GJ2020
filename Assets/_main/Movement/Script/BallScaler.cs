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
        Debug.Log("Got hit");
        transform.localScale = transform.localScale + Vector3.one * 0.4f;
        rigi.mass += 0.4f;
    }
}
