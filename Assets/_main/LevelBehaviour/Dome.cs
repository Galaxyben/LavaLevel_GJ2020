using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dome : MonoBehaviour
{
    Rigidbody rigi;

    private void Start()
    {
        rigi = GetComponent<Rigidbody>();
    }

    public void GetPushed(Mangos.PushData pd)
    {
        rigi.AddForceAtPosition(pd.direction * pd.force, pd.point);
    }
}
