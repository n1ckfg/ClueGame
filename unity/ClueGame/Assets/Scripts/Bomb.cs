using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bomb : MonoBehaviour {

    public float speed = -0.01f;
    public float lifeTime = 2f;
    public Explosion explosionPrefab;

    private Player player;
    private Vector3 screenBounds;

    void Start() {
        player = GameObject.FindGameObjectsWithTag("Player")[0].GetComponent<Player>();

        speed = Random.Range(speed * 0.8f, speed * 1.2f);

        screenBounds = Camera.main.ScreenToWorldPoint(new Vector2(Screen.width, Screen.height));
    }

    void Update() {
        transform.Translate(speed, 0f, 0f);

        if (transform.position.x < -screenBounds.x) {
            player.score++;
            Debug.Log("Score: " + player.score);
            Destroy(gameObject);
        }
    }

    void OnTriggerEnter2D(Collider2D other) {
        player.setHit();
        GameObject.Instantiate(explosionPrefab, transform.position, transform.rotation);
        Destroy(gameObject);
        Debug.Log("Player hit!");
    }

}