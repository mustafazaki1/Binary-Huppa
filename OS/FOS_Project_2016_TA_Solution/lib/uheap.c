#include <inc/lib.h>


// malloc()
//	This function use FIRST FIT strategy to allocate space in heap
//  with the given size and return void pointer to the start of the allocated space

//	To do this, we need to switch to the kernel, allocate the required space
//	in Page File then switch back to the user again.
//
//	We can use sys_allocateMem(uint32 virtual_address, uint32 size); which
//		switches to the kernel mode, calls allocateMem(struct Env* e, uint32 virtual_address, uint32 size) in
//		"memory_manager.c", then switch back to the user mode here
//	the allocateMem function is empty, make sure to implement it.

int HeapAllocation [262145];
bool FirstVisit=1;
//==================================================================================//
//============================ REQUIRED FUNCTIONS ==================================//
//==================================================================================//

void* malloc(uint32 size)
{
	//TODO: [PROJECT 2017 - [5] User Heap] malloc() [User Side]
	// Write your code here, remove the panic and write your code
//	panic("malloc() is not implemented yet...!!");
	if (FirstVisit==1)
	{
		for (int i=0;i<262144;i++)
		{
			HeapAllocation[i]=-1;
		}
		FirstVisit=0;
	}
	// Steps:
	//	1) Implement FIRST FIT strategy to search the heap for suitable sace
	//		to the required allocation size (space shold be on 4 KB BOUNDARY)
	int FindSize=0,StartIndex=-1,sizecom=ROUNDUP(size,PAGE_SIZE)/PAGE_SIZE;

	for (int i=0;i<262144;i++)
	{
		if (HeapAllocation[i]==-1)
		{
			FindSize++;
		}
		else
			FindSize=0;
		if (FindSize==sizecom)
		{
			StartIndex=i-sizecom+1;
			break;
		}
	}
	//	2) if no suitable space found, return NULL
	if (StartIndex==-1)
	{
		return NULL;
	}
	//	 Else,
	//	3) Call sys_allocateMem to invoke the Kernel for allocation
	else
	{
		uint32 VA= (StartIndex*PAGE_SIZE)+USER_HEAP_START;
		sys_allocateMem(VA,sizecom);
		for (int i=StartIndex;i<StartIndex+sizecom;i++)
		{
			HeapAllocation[i]=StartIndex;
		}
		return (void*)VA;
	}
	// 	4) Return pointer containing the virtual address of allocated space,
	//

	//This function should find the space of the required range
	// ******** ON 4KB BOUNDARY ******************* //
	//Use sys_isUHeapPlacementStrategyFIRSTFIT() to check the current strategy
	//change this "return" according to your answer
	return 0;
}

void* smalloc(char *sharedVarName, uint32 size, uint8 isWritable)
{
	//TODO: [PROJECT 2017 - [6] Shared Variables: Creation] smalloc() [User Side]
	// Write your code here, remove the panic and write your code
	//panic("smalloc() is not implemented yet...!!");

	// Steps:
	//	1) Implement FIRST FIT strategy to search the heap for suitable space
	//		to the required allocation size (space should be on 4 KB BOUNDARY)
	//void* StartAddress=malloc(size);
	if (FirstVisit==1)
	{
		for (int i=0;i<262144;i++)
		{
			HeapAllocation[i]=-1;
		}
		FirstVisit=0;
	}
	int FindSize=0,StartIndex=-1,sizecom=ROUNDUP(size,PAGE_SIZE)/PAGE_SIZE;
	for (int i=0;i<262144;i++)
	{
		if (HeapAllocation[i]==-1)
		{
			FindSize++;
		}
		else
			FindSize=0;
		if (FindSize==sizecom)
		{
			StartIndex=i-sizecom+1;
			break;
		}
	}
	//	2) if no suitable space found, return NULL
	if (StartIndex==-1)
	{
		return NULL;
	}
	//	 Else,
	//	3) Call sys_createSharedObject(...) to invoke the Kernel for allocation of shared variable
	//		sys_createSharedObject(): if succeed, it returns the ID of the created variable. Else, it returns -ve
	else
	{
		uint32 VA= (StartIndex*PAGE_SIZE)+USER_HEAP_START;
		//	sys_allocateMem(VA,sizecom);
		//int freeFrames = sys_calculate_free_frames() ;
		int SharedObjectIndex =sys_createSharedObject(sharedVarName,sizecom,isWritable,(void*)VA);
		if (SharedObjectIndex<0)
			return NULL;
		else
		{
			for (int i=StartIndex;i<StartIndex+sizecom;i++)
			{
				HeapAllocation[i]=StartIndex;
			}
			return (void*)VA;
		}
	}
	//	4) If the Kernel successfully creates the shared variable, return its virtual address
	//	   Else, return NULL

	//This function should find the space of the required range
	// ******** ON 4KB BOUNDARY ******************* //

	//Use sys_isUHeapPlacementStrategyFIRSTFIT() to check the current strategy

	//change this "return" according to your answer
	return 0;
}

void* sget(int32 ownerEnvID, char *sharedVarName)
{
	//TODO: [PROJECT 2017 - [6] Shared Variables: Get] sget() [User Side]
	// Write your code here, remove the panic and write your code
	//panic("sget() is not implemented yet...!!");

	// Steps:
	//	1) Get the size of the shared variable (use sys_getSizeOfSharedObject())
	//int freeFrames = sys_calculate_free_frames() ;
	int SharedObjectSize=sys_getSizeOfSharedObject(ownerEnvID,sharedVarName);
	//	2) If not exists, return NULL
	if (SharedObjectSize==E_SHARED_MEM_NOT_EXISTS)
		return NULL;
	//	3) Implement FIRST FIT strategy to search the heap for suitable space
	//		to share the variable (should be on 4 KB BOUNDARY)
	if (FirstVisit==1)
	{
		for (int i=0;i<262144;i++)
		{
			HeapAllocation[i]=-1;
		}
		FirstVisit=0;
	}
	int FindSize=0,StartIndex=-1;
	for (int i=0;i<262144;i++)
	{
		if (HeapAllocation[i]==-1)
		{
			FindSize++;
		}
		else
			FindSize=0;
		if (FindSize==SharedObjectSize)
		{
			StartIndex=i-SharedObjectSize+1;
			break;
		}
	}
	if (StartIndex==-1)
	{
		return NULL;
	}
	else
	{
		uint32 VA= (StartIndex*PAGE_SIZE)+USER_HEAP_START;
		int SharedObject=sys_getSharedObject(ownerEnvID,sharedVarName,(void*)VA);

		if (SharedObject==E_SHARED_MEM_NOT_EXISTS)
			return NULL;
		else
		{
			for (int i=StartIndex;i<StartIndex+SharedObjectSize;i++)
			{
				HeapAllocation[i]=StartIndex;
			}
			return (void*)VA;
		}
	}
	//	4) if no suitable space found, return NULL
	//	 Else,
	//	5) Call sys_getSharedObject(...) to invoke the Kernel for sharing this variable
	//		sys_getSharedObject(): if succeed, it returns the ID of the shared variable. Else, it returns -ve
	//	6) If the Kernel successfully share the variable, return its virtual address
	//	   Else, return NULL
	//

	//This function should find the space for sharing the variable
	// ******** ON 4KB BOUNDARY ******************* //

	//Use sys_isUHeapPlacementStrategyFIRSTFIT() to check the current strategy

	//change this "return" according to your answer
	return 0;
}

// free():
//	This function frees the allocation of the given virtual_address
//	To do this, we need to switch to the kernel, free the pages AND "EMPTY" PAGE TABLES
//	from page file and main memory then switch back to the user again.
//
//	We can use sys_freeMem(uint32 virtual_address, uint32 size); which
//		switches to the kernel mode, calls freeMem(struct Env* e, uint32 virtual_address, uint32 size) in
//		"memory_manager.c", then switch back to the user mode here
//	the freeMem function is empty, make sure to implement it.

void free(void* virtual_address)
{
	//TODO: [PROJECT 2017 - [5] User Heap] free() [User Side]
	// Write your code here, remove the panic and write your code
	//panic("free() is not implemented yet...!!");
	uint32 start =ROUNDDOWN(((uint32)virtual_address-USER_HEAP_START),PAGE_SIZE)/PAGE_SIZE,i;
	int temp =HeapAllocation[start];
	for( i =start;HeapAllocation[i]==temp;i++)
	{
		HeapAllocation[i]=-1;
	}
	sys_freeMem((uint32)virtual_address,i-start);
	//you should get the size of the given allocation using its address

	//you need to call sys_freeMem()
	//refer to the project presentation and documentation for details
}


//==================================================================================//
//============================== BONUS FUNCTIONS ===================================//
//==================================================================================//

//=============
// [1] sfree():
//=============
//	This function frees the shared variable at the given virtual_address
//	To do this, we need to switch to the kernel, free the pages AND "EMPTY" PAGE TABLES
//	from main memory then switch back to the user again.
//
//	use sys_freeSharedObject(...); which switches to the kernel mode,
//	calls freeSharedObject(...) in "shared_memory_manager.c", then switch back to the user mode here
//	the freeSharedObject() function is empty, make sure to implement it.

void sfree(void* virtual_address)
{
	//TODO: [PROJECT 2017 - BONUS4] Free Shared Variable [User Side]
	// Write your code here, remove the panic and write your code
	panic("sfree() is not implemented yet...!!");

	//	1) you should find the ID of the shared variable at the given address
	//	2) you need to call sys_freeSharedObject()

}


//===============
// [2] realloc():
//===============

//	Attempts to resize the allocated space at "virtual_address" to "new_size" bytes,
//	possibly moving it in the heap.
//	If successful, returns the new virtual_address, in which case the old virtual_address must no longer be accessed.
//	On failure, returns a null pointer, and the old virtual_address remains valid.

//	A call with virtual_address = null is equivalent to malloc().
//	A call with new_size = zero is equivalent to free().

//  Hint: you may need to use the sys_moveMem(uint32 src_virtual_address, uint32 dst_virtual_address, uint32 size)
//		which switches to the kernel mode, calls moveMem(struct Env* e, uint32 src_virtual_address, uint32 dst_virtual_address, uint32 size)
//		in "memory_manager.c", then switch back to the user mode here
//	the moveMem function is empty, make sure to implement it.

void *realloc(void *virtual_address, uint32 new_size)
{
	//TODO: [PROJECT 2017 - BONUS3] User Heap Realloc [User Side]
	// Write your code here, remove the panic and write your code
	panic("realloc() is not implemented yet...!!");

}
