﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Mangos
{
    public enum Sounds : int
    {
        GAMEPLAY,
        SFXATTACK,
        SFXHIT,
        SFXSPECIAL
    }

    public class ManagerAudio : MonoBehaviour
    {
        public GameObject audioDad;
        public Camera cam;

        public AudioClipListVariable clips;

        private AudioSource jukebox;

        void Awake()
        {
            ManagerStatic.audioManager = this;
        }

        private void Start()
        {
            StopMusic();
            PoolManager.PreSpawn(audioDad, clips.clipGroup.Count * 15, true);
            PlayMusic(Sounds.GAMEPLAY);
        }

        public void PlaySoundAt(Vector3 pos, AudioClip clip)
        {
            Transform sound = PoolManager.SpawnWithClip(audioDad, pos, Quaternion.identity, clip);
            AudioSource temp = sound.GetComponent<AudioSource>();
            temp.Play();
        }

        public void PlaySoundAt(Vector3 pos, Sounds clip)
        {
            Transform sound = PoolManager.SpawnWithClip(audioDad, pos, Quaternion.identity, clips[(int)clip]);
            AudioSource temp = sound.GetComponent<AudioSource>();
            temp.Play();
        }

        public void PlaySoundGlobal(AudioClip clip, float volume = 1f)
        {
            Transform sound = PoolManager.SpawnWithClip(audioDad, cam.transform.position, Quaternion.identity, clip, cam.transform);
            AudioSource temp = sound.GetComponent<AudioSource>();
            temp.volume = volume;
            temp.Play();
        }

        public void PlaySoundGlobal(Sounds clip)
        {
            Transform sound = PoolManager.SpawnWithClip(audioDad, cam.transform.position, Quaternion.identity, clips[(int)clip], cam.transform);
            AudioSource temp = sound.GetComponent<AudioSource>();
            temp.Play();
        }

        public void PlayMusic(AudioClip clip)
        {
            if (jukebox == null)
            {
                jukebox = PoolManager.SpawnWithClip(audioDad, cam.transform.position, Quaternion.identity, clip, cam.transform).GetComponent<AudioSource>();
                jukebox.gameObject.name = "jukebox";
                jukebox.loop = true;
                jukebox.Play();
            }
            else
            {
                jukebox.clip = clip;
                jukebox.Play();
            }
        }

        public void PlayMusic(Sounds clip)
        {
            if (jukebox == null)
            {
                jukebox = PoolManager.SpawnWithClip(audioDad, cam.transform.position, Quaternion.identity, clips[(int)clip], cam.transform).GetComponent<AudioSource>();
                jukebox.gameObject.name = "jukebox";
                jukebox.loop = true;
                jukebox.Play();
            }
            else
            {
                jukebox.clip = clips[(int)clip];
                jukebox.Play();
            }
        }

        public void StopMusic()
        {
            if (jukebox != null)
            {
                jukebox.Stop();
                Destroy(jukebox.gameObject);
            }
        }
    }
}