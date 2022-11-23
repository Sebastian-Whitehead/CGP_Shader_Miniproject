using UnityEngine;

[ExecuteInEditMode] // Set execution mode
public class PixelShaderHandeler : MonoBehaviour
{
    public Material effectMaterial;

    // Everytime a frame is rendered apply the effect material
    private void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        Graphics.Blit(src, dest, effectMaterial);
    }
}