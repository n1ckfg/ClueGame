using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spawner : MonoBehaviour {

    public Bomb bombPrefab;
    public float spawnInterval = 1f;
    public float yRange = 3f;

    private Player player;

    void Start() {
        player = GameObject.FindGameObjectsWithTag("Player")[0].GetComponent<Player>();

        StartCoroutine(makeBomb());
    }

    void Update() {
        //
    }

    IEnumerator makeBomb() {
        while (player.alive) {
            Vector3 pos = new Vector3(transform.position.x, Random.Range(-yRange, yRange), transform.position.z);
            Bomb bomb = GameObject.Instantiate(bombPrefab, pos, transform.rotation);
            bomb.transform.parent = transform;

            yield return new WaitForSeconds(spawnInterval);
        }
    }

}
