using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HardFollow : MonoBehaviour
{
    public Transform who;

    private void Update()
    {
        transform.position = who.position;
    }
}
