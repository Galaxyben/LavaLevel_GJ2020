using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BadSpikes : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        other.SendMessage("GetHit", SendMessageOptions.DontRequireReceiver);
    }
}
