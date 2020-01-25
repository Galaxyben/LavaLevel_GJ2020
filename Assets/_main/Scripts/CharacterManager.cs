using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public enum Characters
{
    STANDARD = 0,
    HEAVY = 1,
    JUMPY= 2,
    FAST = 3
}

public class CharacterSelectionData
{
    public int prefabID;
    public int playerID;

    public CharacterSelectionData(int prefabID, int playerID)
    {
        this.prefabID = prefabID;
        this.playerID = playerID;
    }
}

public class CharacterManager : MonoBehaviour
{
    public List<GameObject> characterPrefab = new List<GameObject>();
    public List<CharacterSelectionData> selectedCharacters = new List<CharacterSelectionData>();
    public int selectedLevel;
    public LayerMask[] cameraMasks = new LayerMask[4];

    public static CharacterManager instance;

    private void Awake()
    {
        if (instance)
        {
            if (instance != this)
            {
                Destroy(this.gameObject);
                return;
            }
        }
        instance = this;
        DontDestroyOnLoad(this.gameObject);
    }

    void Start()
    {

    }
    
    void Update()
    {

    }

    public void AddCharacter(int character, int playerid)
    {
        selectedCharacters.Add(new CharacterSelectionData(character, playerid));
        CheckIfAllSelected();
    }

    public void CheckIfAllSelected()
    {
        if (selectedCharacters.Count >= 4)
        {
            int level = Random.Range(2, 5);
            selectedLevel = level-2;
            SceneManager.LoadScene(level);
        }
    }
}
