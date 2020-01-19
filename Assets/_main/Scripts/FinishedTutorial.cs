using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Rewired;

public class FinishedTutorial : MonoBehaviour
{

    private void Awake()
    {

    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        GameObject canvas = GameObject.Find("MasterCanvas");
        Destroy(canvas);
        SceneManager.LoadScene(0);
    }
}
