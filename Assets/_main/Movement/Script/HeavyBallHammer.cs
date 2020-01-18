using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mangos;

public class HeavyBallHammer : MonoBehaviour
{
    public float force;

    private void OnCollisionEnter(Collision _col)
    {
        PushData pushData;
        pushData.direction = _col.contacts[0].normal;
        pushData.force = force;
        pushData.point = _col.contacts[0].point;
        _col.gameObject.SendMessage("GetPushed", pushData);
    }
}
