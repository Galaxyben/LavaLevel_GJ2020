using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Mangos
{
    public class ManagerGameState : MonoBehaviour
    {
        public GameState currentState;

        private void Awake()
        {
            ManagerStatic.gameStateManager = this;
        }

        private void Start()
        {
            switch (currentState)
            {
                case GameState.GAMEPLAY:
                    SetPlay();
                    break;
            }
        }

        void Update()
        {
            
        }

        public void OnWin()
        {
            
        }

        public void OnLose()
        {
            
        }

        public void SetPause()
        {
            currentState = GameState.PAUSE;
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
            Time.timeScale = 0.0f;
        }

        public void SetPlay()
        {
            currentState = GameState.GAMEPLAY;
            Cursor.visible = false;
            Cursor.lockState = CursorLockMode.Locked;
            Time.timeScale = 1.0f;
        }

        public void SetWin()
        {
            currentState = GameState.GAME_END;
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
            Time.timeScale = 1.0f;
        }

        public void SetCredits()
        {
            currentState = GameState.CREDITS;
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
            Time.timeScale = 1.0f;
        }
    }
}