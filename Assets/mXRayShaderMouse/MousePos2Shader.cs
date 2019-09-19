using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MousePos2Shader : MonoBehaviour {
    [SerializeField] private Material myMaterial=null;
    private float radius=2;
    
    
    void Update () 
    {
    
    	// get mouse pos
    	var ray = Camera.main.ScreenPointToRay (Input.mousePosition);
        if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity))
        {
            //		renderer.material.SetVector("_ObjPos", Vector4(obj.position.x,obj.position.y,obj.position.z,0));
            myMaterial.SetVector("_ObjPos", new Vector4(hit.point.x, hit.point.y, hit.point.z, 0));

            // convert hit.point to our plane local coordinates, not sure how to do in shader.. IN.pos.. ??
            //		var hitlocal = transform.InverseTransformPoint(hit.point);
            //		renderer.material.SetVector("_ObjPos",Vector4(hitlocal.x,hitlocal.y,hitlocal.z,0));
        }


        // box rotation for testing..
        if (Input.GetKey ("a"))
    	{
    		transform.Rotate(new Vector3(0,30,0) * Time.deltaTime);
    	}
    	if (Input.GetKey ("d"))
    	{
    		transform.Rotate(new Vector3(0,-30,0) * Time.deltaTime);
    	}
    	
    	// mousewheel for radius
    	if (Input.GetAxis("Mouse ScrollWheel") != 0)
    	{
    		radius += Input.GetAxis("Mouse ScrollWheel")*0.8f;
    		myMaterial.SetFloat("_Radius", radius);
    	}
    }
}