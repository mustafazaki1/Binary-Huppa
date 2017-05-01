#include"../middleware/includes/glm/glm.hpp"
#include"../middleware/includes/glm/gtx/transform.hpp"
#include "../middleware/includes/glm/gtc/matrix_transform.hpp"

#include "Renderer.h"
#include <string>
#include <iostream>
#include "Application Manager\ApplicationManager.h"
using namespace std;
Renderer::Renderer()
{

}

Renderer::~Renderer()
{
	Cleanup();
}

void Renderer::Initialize()
{
	//since the triangle is not connected to anything else, so the normal is constant on all the vertices.
	//drawing a square.
	SkyBox = std::unique_ptr<Model>(new Model());
	House = new Model3D();
	Jeep = new Model3D();
	//face1
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, 1.0f));

	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, 1.0f));
	//face2
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, -1.0f));

	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, -1.0f));
	//face3
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, -1.0f));

	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, -1.0f));
	//face4
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, -1.0f));

	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, 1.0f));
	//face5
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, -1.0f));

	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, 1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, 1.0f, -1.0f));
	//face6
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, -1.0f));

	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, 1.0f));
	SkyBox->VertexData.push_back(glm::vec3(1.0f, -1.0f, -1.0f));
	SkyBox->VertexData.push_back(glm::vec3(-1.0f, -1.0f, -1.0f));



	// Face_1 Normals
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 1.0));

	// Face_2 Normals
	SkyBox->NormalsData.push_back(vec3(1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(1.0, 0.0, 0.0));

	// Face_3 Normals
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, -1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, -1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, -1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, -1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, -1.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, -1.0));

	// Face_4 Normals
	SkyBox->NormalsData.push_back(vec3(-1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(-1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(-1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(-1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(-1.0, 0.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(-1.0, 0.0, 0.0));

	// Face_5 Normals
	SkyBox->NormalsData.push_back(vec3(0.0, 1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, 0.0, 0.0));

	// Face_6 Normals
	SkyBox->NormalsData.push_back(vec3(0.0, -1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, -1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, -1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, -1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, -1.0, 0.0));
	SkyBox->NormalsData.push_back(vec3(0.0, -1.0, 0.0));

	//face_1 UVD
	SkyBox->UVData.push_back(vec2(0.0,0.0));
	SkyBox->UVData.push_back(vec2(1.0,0.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(1.0,1.0));
	SkyBox->UVData.push_back(vec2(0.0,1.0));

	//face_2 UVD
	SkyBox->UVData.push_back(vec2(0.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 1.0));

	//face_3 UVD
	SkyBox->UVData.push_back(vec2(1.0, 1.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(0.0, 0.0));
	SkyBox->UVData.push_back(vec2(1.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 0.0));

	//face_4 UVD
	SkyBox->UVData.push_back(vec2(0.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(1.0, 1.0));
	SkyBox->UVData.push_back(vec2(0.0, 0.0));

	//face_5 UVD
	SkyBox->UVData.push_back(vec2(0.0f, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 0.0));

	//face_6 UVD
	SkyBox->UVData.push_back(vec2(1.0, 1.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 1.0));
	SkyBox->UVData.push_back(vec2(1.0, 0.0));
	SkyBox->UVData.push_back(vec2(0.0, 0.0));
	
	for (char i = '0'; i < '6'; i++)
	{
		std::string TextLoc = "data\\models\\SkyBoxz\\";
		TextLoc.push_back(i);
		
			TextLoc += ".jpg";
		
		cout << TextLoc << endl;
		SkyBox->TextureData.push_back((new Texture(TextLoc, (int)(i - '0'))));
	}

	SkyBox->Initialize();

	floorM = glm::rotate(0.0f, glm::vec3(1.0f, 0.0f, 0.0f))*glm::scale(glm::vec3(50.0f, 70.0f, 50.0f));
	//////////////////////////////////////////////////////////////////////////

	shader.LoadProgram();
	House->LoadFromFile("data/models/3DS/House/house.obj", true);
	House->Initialize();



	//////////////////////////////////////////////////////////////////////////
	// Create and compile our GLSL program from the shaders
	programID = LoadShaders("SimpleTransformWithColor.vertexshader", "TextureLighting.fragmentshader");

	VPID = glGetUniformLocation(programID, "VP");
	ModelMatrixID = glGetUniformLocation(programID, "ModelMatrix");
	// Use our shader
	glUseProgram(programID);
	//////////////////////////////////////////////////////////////////////////

	//////////////////////////////////////////////////////////////////////////
	// Camera
	myCamera = std::unique_ptr<FirstPersonCamera>(new FirstPersonCamera());

	// Projection matrix : 
	myCamera->SetPerspectiveProjection(45.0f, (float)ApplicationManager::WindowSizeWidth / (float)ApplicationManager::WindowSizeHeight, 0.1f, 100.0f);

	// View matrix : 
	myCamera->Reset(
		+0.0f, +0.0f, +9.0f,// Camera Position
		+0.0f, +0.0f, +0.0f,// Look at Point
		+0.0f, +1.0f, +0.0f // Up Vector
		);
	//////////////////////////////////////////////////////////////////////////
}
void Renderer::Draw()
{
	glUseProgram(programID);

	glm::mat4 VP = myCamera->GetProjectionMatrix() * myCamera->GetViewMatrix();

	glUniformMatrix4fv(VPID, 1, GL_FALSE, &VP[0][0]);
	glUniformMatrix4fv(ModelMatrixID, 1, GL_FALSE, &floorM[0][0]);
	SkyBox->Draw();

	shader.UseProgram();
	shader.BindVPMatrix(&VP[0][0]);
	House->Render(&shader, rotate(-90.0f, vec3(0, 1, 0))*scale(vec3(0.009f, 0.009f, 0.009f))*translate(vec3(10,-70,40)));
}

void Renderer::Cleanup()
{
	glDeleteProgram(programID);
}

void Renderer::Update(double deltaTime)
{
}

void Renderer::HandleKeyboardInput(int key, int action)
{
	switch (key)
	{
		//Moving forward
	case GLFW_KEY_UP:
	case GLFW_KEY_W:
		myCamera->Walk(0.1);
		break;

		//Moving backword
	case GLFW_KEY_DOWN:
	case GLFW_KEY_S:
		myCamera->Walk(-0.1);
		break;

		// Moving right
	case GLFW_KEY_RIGHT:
	case GLFW_KEY_D:
		myCamera->Strafe(0.1);
		break;

		// Moving left
	case GLFW_KEY_LEFT:
	case GLFW_KEY_A:
		myCamera->Strafe(-0.1);
		break;

		// Moving up
	case GLFW_KEY_SPACE:
	case GLFW_KEY_R:
		myCamera->Fly(0.1);
		break;

		// Moving down
	case GLFW_KEY_LEFT_CONTROL:
	case GLFW_KEY_F:
		myCamera->Fly(-0.1);
		break;

	case GLFW_KEY_I:
		myCamera->Pitch(0.1);
		break;

	case GLFW_KEY_K:
		myCamera->Pitch(-0.1);
		break;

	case GLFW_KEY_L:
		myCamera->Yaw(-0.1);
		break;

	case GLFW_KEY_J:
		myCamera->Yaw(0.1);
		break;

	case GLFW_KEY_O:
		myCamera->Roll(-0.1);
		break;

	case GLFW_KEY_U:
		myCamera->Roll(0.1);
		break;

	default:
		break;
	}

	myCamera->UpdateViewMatrix();
}

void Renderer::HandleMouse(double deltaX, double deltaY)
{
	myCamera->Yaw(deltaX);
	myCamera->Pitch(deltaY);
	myCamera->UpdateViewMatrix();
}