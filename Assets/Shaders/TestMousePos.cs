using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class TestMousePos : MonoBehaviour
{
    [SerializeField] private Material myMaterial=null;

    void Update()
    {
        Vector2 mpNormalized = new Vector2(Input.mousePosition.x/Screen.width, Input.mousePosition.y/Screen.height);
        print(mpNormalized);//QQQ
        myMaterial.SetVector("_MousePos", new Vector4(mpNormalized.x,mpNormalized.y,0,0));
    }
}
