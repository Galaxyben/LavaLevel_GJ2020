using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "AudioClipListVariable", menuName = "Audio Clip List")]
public class AudioClipListVariable : ScriptableObject
{
    public List<ClipGroup> clipGroup = new List<ClipGroup>();

    public AudioClip this[int _i]
    {
        get
        {
            int rng = Random.Range(0, clipGroup[_i].clips.Length);

            return clipGroup[_i].clips[rng];
        }
        private set { }
    }
}

[System.Serializable]
public struct ClipGroup
{
    public AudioClip[] clips;
}
