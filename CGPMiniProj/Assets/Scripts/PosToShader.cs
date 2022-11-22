using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.PlayerLoop;
[RequireComponent(typeof(Renderer))]
public class PosToShader : MonoBehaviour

{
    public string focalPointPath = "Focal Point";
    private Material _shaderMaterial;
    private GameObject _focalPoint;
    private Vector4 _focalPointPos;
    private Renderer _rend;
    private static readonly int PlayerPos = Shader.PropertyToID("_PlayerPos");

    // Start is called before the first frame update
    void Start()
    {
        _focalPoint = GameObject.Find(focalPointPath);
        
        _rend = this.GetComponent<Renderer>();
        _shaderMaterial = Resources.Load<Material>("Materials/Shading Surface");
        _rend.material = _shaderMaterial;
    }

    // Update is called once per frame
    void Update()
    {
        _focalPointPos = _focalPoint.transform.position;
        _rend.material.SetVector(PlayerPos, _focalPointPos);
    }
}
