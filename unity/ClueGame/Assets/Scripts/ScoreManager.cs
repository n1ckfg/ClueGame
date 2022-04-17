using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ScoreManager : MonoBehaviour {

    public TMP_Text scoreDisplay;
    public TMP_Text healthDisplay;
    public Player player;

    private void Start() {
        player = GameObject.FindGameObjectsWithTag("Player")[0].GetComponent<Player>();
    }

    private void Update() {
        scoreDisplay.text = "Score: " + player.score;
        healthDisplay.text = "Health: " + player.health;
    }

}
