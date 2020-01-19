using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Boundary : MonoBehaviour
{
    public Transform[] spawnPoints;
    public float respawnTime = 1.0f;
    public int lastSpawn = 0;
    public int[] lives = new int[] { 0 };
    public int totalLives = 3;

    private void OnTriggerExit(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            BallControler controler = other.gameObject.GetComponent<BallControler>();

            if(controler)
            {
                lives[controler.playerID]++;
                controler.movement.Despawn();

                if (lives[controler.playerID] < totalLives)
                {
                    StartCoroutine("Respawn", controler.movement);
                }
                else
                {
                    //That dude is dead
                }
            }
        }
    }

    IEnumerator Respawn(BallMovement mov)
    {
        yield return new WaitForSeconds(respawnTime);
        mov.Spawn(spawnPoints[(++lastSpawn)%4].position);
    }
}
