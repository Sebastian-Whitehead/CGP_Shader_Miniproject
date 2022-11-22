using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.PlayerLoop;

public class PosToShader : MonoBehaviour

{
    
    
    private GameObject _FocalPoint;
    private Vector4 _FocalPointPos;
    private Renderer _rend;
    private static readonly int PlayerPos = Shader.PropertyToID("_PlayerPos");

    // Start is called before the first frame update
    void Start()
    {
        _FocalPoint = GameObject.Find("Focal Point");
        _rend = GetComponent<Renderer>();
    }

    // Update is called once per frame
    void Update()
    {
        _FocalPointPos = _FocalPoint.transform.position;
        _rend.material.SetVector(PlayerPos, _FocalPointPos);
    }
}
