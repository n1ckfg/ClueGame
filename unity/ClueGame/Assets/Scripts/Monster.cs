using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Monster : MonoBehaviour {

    public Explosion explosionPrefab;

    private Player player;
    private Animator animator;

    private void Start() {
        player = GameObject.FindGameObjectsWithTag("Player")[0].GetComponent<Player>();
        animator = GetComponent<Animator>();
    }

    private void Update() {
        animator.SetBool("Run", player.isRunning);
    }

    void OnTriggerEnter2D(Collider2D other) {
        player.setHit();
        Vector3 pos = new Vector3(transform.position.x + 0.3f, transform.position.y, transform.position.z);
        GameObject.Instantiate(explosionPrefab, pos, transform.rotation);
        Debug.Log("Monster attacked player!");
    }

}
