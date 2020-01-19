using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mangos;

public class Boundary : MonoBehaviour
{
    public Transform[] spawnPoints;
    public float respawnTime = 1.0f;
    public int lastSpawn = 0;
    public int[] lives = new int[] { 0 };
    public int totalLives = 3;

    [Header("UI")]
    public GameObject winCanvas;
    public GameObject loseCanvas;
    private int deaths = 0;
    private bool[] deadState = new bool[4];

    private void Start()
    {
        for (int i = 0; i < deadState.Length; i++)
        {
            deadState[i] = false;
        }
    }

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
                    if (lives[controler.playerID] < 2)
                    {
                        controler.movement.SetDamaged(true);
                    } else
                    {
                        controler.movement.SetDamaged(false);
                    }
                }
                else
                {
                    Instantiate(loseCanvas, controler.movement.canvas.transform);
                    deadState[controler.playerID] = true;
                    deaths++;
                    if (deaths >= 3)
                    {
                        Debug.Log("End Game");
                        for (int i = 0; i < 4; i++)
                        {
                            if (!deadState[i])
                                Instantiate(winCanvas, controler.movement.canvas.transform);
                        }
                        StartCoroutine(ReturnToMenu());
                    }
                }
            }
        }
    }

    IEnumerator Respawn(BallMovement mov)
    {
        yield return new WaitForSeconds(respawnTime);
        mov.Spawn(spawnPoints[(++lastSpawn)%4].position);
    }

    IEnumerator ReturnToMenu()
    {
        GameObject canvas = GameObject.Find("MasterCanvas");
        if (canvas != null)
        {
            Debug.Log("Se destruye el canvas");
            Destroy(canvas);
        }
        Debug.Log("Returning To Menu");
        yield return new WaitForSeconds(3.0f);
        ManagerStatic.sceneManager.LoadScene("MainMenu", false);
    }
}
