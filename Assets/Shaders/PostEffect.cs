using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostEffect : MonoBehaviour {
    public Material m_effect;

    private void OnRenderImage(RenderTexture src, RenderTexture dest) {
        
        
        Graphics.Blit(src, dest, m_effect);
    }
}
