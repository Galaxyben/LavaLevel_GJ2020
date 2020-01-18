using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioDad : MonoBehaviour
{
    public AudioSource audioSource;

    //When pool spawns this
    void OnSpawn()
    {
        Invoke("SelfDespawn", audioSource.clip.length);
    }

    void SelfDespawn()
    {
        PoolManager.Despawn(gameObject);
    }

    //When pool despawns this
    void OnDespawn()
    { 
        audioSource.Stop();
    }
}
