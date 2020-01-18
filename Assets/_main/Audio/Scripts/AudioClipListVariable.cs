using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "AudioClipListVariable", menuName = "Audio Clip List")]
public class AudioClipListVariable : ScriptableObject
{
    public List<AudioClip> clips = new List<AudioClip>();
    public List<int> groupSizes = new List<int>();

    public AudioClip this[int _i]
    {
        get
        {
            int reali = 0;

            for(int j = 0; j < _i; j++)
            {
                reali += groupSizes[j];
            }

            int rng = Random.Range(0, groupSizes[_i]);

            return clips[reali + rng];
        }
        private set { }
    }
}
