using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class BallScaler : MonoBehaviour
{
    Rigidbody rigi;

    float totalDamage;
    float maxDamage = 200;

    void Start()
    {
        rigi = GetComponent<Rigidbody>();
    }
     
    public void GetHit(float _dmg)
    {
        totalDamage += _dmg;
        transform.localScale = transform.localScale + Vector3.one * 0.6f;
        rigi.mass += 0.1f;
    }
}
