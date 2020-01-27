using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

[RequireComponent(typeof(Rigidbody))]
public class BallScaler : MonoBehaviour
{
    Rigidbody rigi;
    CinemachineFreeLook CMFree;

    float totalDamage;
    float maxDamage = 200;
    float maxScale = 5;
    float maxMass = 3;

    Vector3 initialScale;
    float initialMass;
    CinemachineFreeLook.Orbit[] initialOrbit;

    void Start()
    {
        CMFree = GetComponentInChildren<CinemachineFreeLook>();
        rigi = GetComponent<Rigidbody>();
        initialScale = transform.localScale;
        initialMass = rigi.mass;
        initialOrbit = new CinemachineFreeLook.Orbit[CMFree.m_Orbits.Length];
        for(int i = 0; i < CMFree.m_Orbits.Length; i++)
        {
            initialOrbit[i] = CMFree.m_Orbits[i];
        }
    }
     
    public void GetHit(float _dmg)
    {
        totalDamage += _dmg;
        totalDamage = Mathf.Min(maxDamage, totalDamage);
        IncrementScale(0.6f);
        rigi.mass = Mathf.Min(maxMass, rigi.mass + 0.1f); ///Calar el crecimiento por tiempo
    }

    public void IncrementScale(float _amount)
    {
        transform.localScale = Vector3.ClampMagnitude(transform.localScale + Vector3.one * _amount, 8);
        for(int i = 0; i < CMFree.m_Orbits.Length; i++)
        {
            CMFree.m_Orbits[i] = new CinemachineFreeLook.Orbit(CMFree.m_Orbits[i].m_Height * 1.3f, CMFree.m_Orbits[i].m_Radius * 1.3f);
        }
    }

    public void ResetScale()
    {
        transform.localScale = initialScale;
        rigi.mass = initialMass;
        CMFree.m_Orbits = initialOrbit;
    }
}
