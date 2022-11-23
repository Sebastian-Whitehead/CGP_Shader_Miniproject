using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.PlayerLoop;


[RequireComponent(typeof(Renderer))] // Require renderer component on this game object
public class PosToShader : MonoBehaviour

{
    public string focalPointPath = "Focal Point"; // Name of game object all light should center around
    public string materialPath = "Materials/Shading Surface";
    
    private Material _shaderMaterial;             // The Material with the shader
    private Renderer _rend;
    
    private GameObject _focalPoint;               // The game object
    private Vector4 _focalPointPos;               // The position of the aforementioned game object
    private static readonly int PlayerPos = Shader.PropertyToID("_PlayerPos"); // The destination vector within the sudo lighting shader
    
    void Start()
    {
        _focalPoint = GameObject.Find(focalPointPath);  // Find the game object with the specified name
        
        // Load and set material from resource folder:
        _rend = this.GetComponent<Renderer>();       
        _shaderMaterial = Resources.Load<Material>(materialPath);
        _rend.material = _shaderMaterial;           
    }
    
    void Update()
    {
        _focalPointPos = _focalPoint.transform.position;        // Retrieve position of focal point object
        _rend.material.SetVector(PlayerPos, _focalPointPos);    // Pass the position to the shader   
    }
}
