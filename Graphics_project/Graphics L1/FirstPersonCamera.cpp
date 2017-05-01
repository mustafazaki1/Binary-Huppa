#include "FirstPersonCamera.h"


FirstPersonCamera::FirstPersonCamera()
{
	this->Reset(0, 0, 1,
		0, 0, 0,
		0, 1, 0);

	SetPerspectiveProjection(45.0f, 4.0f / 3.0f, 0.1f, 2000.0f);
}


FirstPersonCamera::~FirstPersonCamera()
{
}

vec3 FirstPersonCamera::GetLookDirection()
{
	return -mDirection;
}

void FirstPersonCamera::Reset(float eyeX, float eyeY, float eyeZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ)
{
	vec3 eyePt(eyeX, eyeY, eyeZ);
	vec3 centerPt(centerX, centerY, centerZ);
	vec3 upVec(upX, upY, upZ);

	this->Reset(eyePt, centerPt, upVec);
}

void FirstPersonCamera::Reset(const vec3 &eye, const vec3 &center, vec3 &up)
{
	mPosition = eye;

	mDirection = normalize(mPosition - center);
	mRight = normalize(cross(up, mDirection));
	mUp = normalize(cross(mDirection, mRight));

	this->UpdateViewMatrix();
}

mat4 FirstPersonCamera::GetViewMatrix()
{
	return mViewMatrix;
}

void FirstPersonCamera::UpdateViewMatrix()
{
	vec3 mCenter = mPosition + this->GetLookDirection();
	mViewMatrix = lookAt(mPosition, mCenter, mUp);
}

mat4 FirstPersonCamera::GetProjectionMatrix()
{
	return mProjectionMatrix;
}

void FirstPersonCamera::SetPerspectiveProjection(float FOV, float aspectRatio, float near, float far)
{
	mProjectionMatrix = perspective(FOV, aspectRatio, near, far);
}

void FirstPersonCamera::Slide(float stepR, float stepU, float stepD)
{
	mPosition += stepR * mRight;
	mPosition += stepU * mUp;
	mPosition += stepD * this->GetLookDirection();
}

void FirstPersonCamera::Yaw(float angleDegrees)
{
	mDirection = glm::rotate(mDirection, angleDegrees, mUp);
	mRight = glm::rotate(mRight, angleDegrees, mUp);
}

void FirstPersonCamera::Pitch(float angleDegrees)
{
	mUp = glm::rotate(mUp, angleDegrees, mRight);
	mDirection = glm::rotate(mDirection, angleDegrees, mRight);
}

void FirstPersonCamera::Roll(float angleDegrees)
{
	mRight = glm::rotate(mRight, angleDegrees, mDirection);
	mUp = glm::rotate(mUp, angleDegrees, mDirection);
}

void FirstPersonCamera::Walk(float dist)
{
	mPosition += dist * this->GetLookDirection();
}

void FirstPersonCamera::Strafe(float dist)
{
	mPosition += dist *mRight;
}

void FirstPersonCamera::Fly(float dist)
{
	mPosition += dist * mUp;
}

glm::vec3 FirstPersonCamera::GetEyePosition()
{
	return mPosition;
}