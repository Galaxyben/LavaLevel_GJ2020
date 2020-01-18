using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeavyBallHammer : MonoBehaviour
{
    public float force;

    private void OnCollisionEnter(Collision _col)
    {
        _col.gameObject.SendMessage("GetPushed");
    }
}
