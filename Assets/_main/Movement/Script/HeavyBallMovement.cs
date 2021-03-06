﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mangos;

public class HeavyBallMovement : BallMovement
{
    public GameObject hammer;

    private bool hammerOn;

    public override void Special()
    {
        ManagerStatic.audioManager.PlaySoundAt(transform.position, Sounds.SFXSPECIAL);
        if (hammerOn)
            PullHammer();
        else
            PopHammer();
    }

    public void PopHammer()
    {
        hammer.SetActive(true);
        StartCoroutine(TriggerToCollider());
        hammerOn = true;
    }

    public void PullHammer()
    {
        hammer.SetActive(false);
        hammerOn = false;
    }

    IEnumerator TriggerToCollider()
    {
        hammer.GetComponent<Collider>().isTrigger = true;
        yield return new WaitForSeconds(0.5f);
        hammer.GetComponent<Collider>().isTrigger = false;
    }
}
