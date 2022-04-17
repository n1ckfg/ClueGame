using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Explosion : MonoBehaviour {

    public float lifeTime = 0.5f;
    public Particles particlesPrefab;

    void Start() {
        AudioSource audioSource = GetComponent<AudioSource>();
        audioSource.pitch = Random.Range(0.8f, 1.2f);
        audioSource.Play();
        Instantiate(particlesPrefab, transform.position, transform.rotation);
        StartCoroutine(checkAlive());
    }

    void Update() {
        //
    }

    IEnumerator checkAlive() {
        yield return new WaitForSeconds(lifeTime);
        Destroy(gameObject);
    }

}
