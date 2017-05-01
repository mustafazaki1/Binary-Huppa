#ifndef Renderer_h__
#define Renderer_h__

#include "../middleware/includes/gl/glew.h"
#include "../middleware/includes/gl/glfw3.h"

#include "Shaders/shader.hpp"
#include "Model.h"
#include "Model3D.h"
#include"ShaderProgram.h"
#include <memory>
#include "FirstPersonCamera.h"

using namespace glm;
class Renderer
{
	GLuint programID;

	GLuint VPID;
	GLuint ModelMatrixID;
	
	std::unique_ptr<Model> SkyBox;
	std::unique_ptr<FirstPersonCamera> myCamera;
	Model3D *House;
	Model3D *Jeep;
	ShaderProgram shader;
	glm::mat4 floorM;

public:
	Renderer();
	~Renderer();

	void Initialize();
	void Draw();
	void HandleKeyboardInput(int key, int action);
	void HandleMouse(double deltaX, double deltaY);
	void Update(double deltaTime);
	void Cleanup();
};

#endif 
