using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mangos;
using Cinemachine;
using Aura2API;

public class ManagerSpawn : MonoBehaviour
{
    public Boundary boundary;
    public AuraBaseSettings auraSettings;
    

    [Header("Debug")]
    public GameObject mockupPrefab;
    public bool mockupSpawns = false;
    public LayerMask[] mockupMasks;
    private LayerMask[] theMasks;
    

    private int[] playerLayerSlayer = new int[]{ 8, 11, 12, 13 };
    private Vector2[] camWidths = new Vector2[] { new Vector2(0f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0f, 0f), new Vector2(0.5f, 0f) };

    private void Awake()
    {
        ManagerStatic.spawnManager = this;
    }

    void Start()
    {
        Debug.Log("Spawner Start");

        if (CharacterManager.instance)
        {
            theMasks = CharacterManager.instance.cameraMasks;
            SpawnCharacters(CharacterManager.instance.selectedCharacters, CharacterManager.instance.characterPrefab);
        }
        else if (mockupSpawns)
        {
            var temp = GetComponent<PessStartToJoin>();
            if (temp) temp.enabled = true;

            List<CharacterSelectionData> d = new List<CharacterSelectionData>();
            d.Add(new CharacterSelectionData(0, 0));
            d.Add(new CharacterSelectionData(1, 1));
            d.Add(new CharacterSelectionData(2, 2));
            d.Add(new CharacterSelectionData(3, 3));
            List<GameObject> prefab = new List<GameObject>();
            prefab.Add(mockupPrefab);
            prefab.Add(mockupPrefab);
            prefab.Add(mockupPrefab);
            prefab.Add(mockupPrefab);
            theMasks = mockupMasks;
            SpawnCharacters(d, prefab);
        }
    }

    public void SpawnCharacters(List<CharacterSelectionData> selectionData, List<GameObject> prefabs)
    {
        for(int i = 0; i < selectionData.Count; i++)
        {
            Debug.Log("Spawning player");
            GameObject go = Instantiate(prefabs[selectionData[i].prefabID], boundary.spawnPoints[i].position, Quaternion.identity);

            Camera cam = go.GetComponentInChildren<Camera>();
            if (!cam) return; //Seguridad minima
            CinemachineFreeLook cmFree = go.GetComponentInChildren<CinemachineFreeLook>();
            BallControler controller = go.GetComponentInChildren<BallControler>();
            AuraCamera auraCam = cam.GetComponent<AuraCamera>();
            //Layer setup
            cam.gameObject.layer = playerLayerSlayer[selectionData[i].playerID];
            cmFree.gameObject.layer = playerLayerSlayer[selectionData[i].playerID];
            //Layer mask
            cam.cullingMask = theMasks[selectionData[i].playerID];             //cam.cullingMask = CharacterManager.instance.cameraMasks[selectionData[i].playerID];
            //AuraCam
            auraCam.frustumSettings.baseSettings = auraSettings;
            //Player id
            controller.playerID = selectionData[i].playerID;
            //Camera position
            cam.rect = new Rect(camWidths[selectionData[i].playerID], Vector2.one * 0.5f);
        }
    }
}
