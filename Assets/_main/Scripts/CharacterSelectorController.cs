using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterSelectorController : MonoBehaviour
{
    public GameObject[] characters;
    public int current;
    public int playerID;
    public bool ready;

    void Start()
    {
        Init();
    }
    
    void Update()
    {
        
    }

    public void Init()
    {
        current = 0;
        for(int i = 0; i < characters.Length; i++)
        {
            characters[i].SetActive(false);
        }
        characters[current].SetActive(true);
    }

    public void NextCharacter()
    {
        if(!ready)
        {
            characters[current].SetActive(true);
            characters[current - 1].SetActive(false);
            current++;
            if (current > characters.Length)
            {
                current = 0;
            }
        }
    }

    public void LastCharacter()
    {
        if(!ready)
        {
            characters[current - 1].SetActive(true);
            characters[current].SetActive(false);
            current--;
            if (current < 0)
            {
                current = characters.Length;
            }
        }
    }

    public void SelectCharacter()
    {
        if(!ready)
        {
            CharacterManager.instance.AddCharacter(current, playerID);
            ready = true;
        }
    }
}
