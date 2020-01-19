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
            current++;
            if (current >= characters.Length)
            {
                current = 0;
            }
            characters[current].SetActive(true);
            characters[current == 0 ?  characters.Length - 1 : current - 1].SetActive(false);
        }
    }

    public void LastCharacter()
    {
        if(!ready)
        {
            current--;
            if (current < 0)
            {
                current = characters.Length - 1;
            }
            characters[current].SetActive(true);
            characters[current == 3 ? 0 : current + 1].SetActive(false);
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
