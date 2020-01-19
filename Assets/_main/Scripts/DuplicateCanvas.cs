using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DuplicateCanvas : MonoBehaviour
{
    void Start()
    {
        GameObject list = GameObject.Find("MasterCanvas");

        if (list != null)
            Destroy(this.gameObject);
    }

    void Update()
    {
        
    }
}
