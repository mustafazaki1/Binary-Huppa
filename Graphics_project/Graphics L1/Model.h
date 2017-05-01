#ifndef Model_h__
#define Model_h__

#include "../../middleware/includes/glm/glm.hpp"
#include <vector>
#include <memory>
#include "texture.h"
#include "../../middleware/includes/gl/glew.h"
class Model
{
	//VAO
	GLuint mVertexArrayObjectID;
	
	//VBOs
	GLuint mVertexDataBufferID;
	GLuint mColorDataBufferID;
	GLuint mIndicesDataBufferID;
	GLuint mUVDataBufferID;
	GLuint mNormalsBufferID;
public:
	Model();
	~Model();

	std::vector<glm::vec3> VertexData;
	std::vector<glm::vec3> ColorData;
	std::vector<glm::vec2> UVData;
	std::vector<glm::vec3> NormalsData;
	std::vector<unsigned short> IndicesData;
	std::vector< Texture* > TextureData;

	void Initialize();
	virtual void Update();
	virtual void Draw();
	virtual void DrawStrip();
	virtual void DrawWireFrame();
	void Cleanup();
};
#endif // Model_h__