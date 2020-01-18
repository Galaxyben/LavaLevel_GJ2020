using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DomeParts : MonoBehaviour
{
    public Dome dome;

    public void GetPushed(Mangos.PushData pd)
    {
        dome.GetPushed(pd);
    }
}
