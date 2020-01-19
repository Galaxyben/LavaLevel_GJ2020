using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class BallScaler : MonoBehaviour
{
    Rigidbody rigi;

    float totalDamage;
    float maxDamage = 200;
    float maxScale = 5;
    float maxMass = 3;

    void Start()
    {
        rigi = GetComponent<Rigidbody>();
    }
     
    public void GetHit(float _dmg)
    {
        totalDamage += _dmg;
        totalDamage = Mathf.Min(maxDamage, totalDamage);
        transform.localScale = Vector3.ClampMagnitude(transform.localScale + Vector3.one * 0.6f, 8);
        rigi.mass = Mathf.Min(maxMass, rigi.mass + 0.1f); ///Calar el crecimiento por tiempo
    }
}
