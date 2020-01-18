using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IndicatorLinker : MonoBehaviour
{
    public GameObject targetLink;

    public bool linkPosition;
    public bool linkRotation;

    void Update()
    {
        transform.position = linkPosition ? targetLink.transform.position : transform.position;
        transform.rotation = linkRotation ? targetLink.transform.rotation : transform.rotation;
    }
}
